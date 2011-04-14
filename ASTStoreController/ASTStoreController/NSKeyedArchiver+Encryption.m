//
//  NSKeyedArchiver+Encryption.m
//  ASTStoreController
//
//  Created by Sean Kormilo on 11-04-14.
//  http://www.anystonetech.com
//
//  Copyright (c) 2011 Anystone Technologies, Inc.
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.

#import "NSKeyedArchiver+Encryption.h"
#import "NSData+Encryption.h"


@implementation NSKeyedArchiver (Encryption)

+ (BOOL)encryptArchiveRootObject:(id)rootObject toFile:(NSString *)path usingKey:(NSData*)key
{
    NSData *decryptedData = [NSKeyedArchiver archivedDataWithRootObject:rootObject];
    
    if( nil == decryptedData )
    {
        return NO;
    }
    

    NSData *encryptedData = [decryptedData encryptWithKey:key];
    
    if( nil == encryptedData ) 
    {
        return NO;
    }
    
    return( [encryptedData writeToFile:path atomically:YES] );
}

@end
