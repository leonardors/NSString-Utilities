//
//  NSString-Utilities.h
//  leonardors
//
//  Created by Leonardo on 24/02/12.
//  Copyright (c) 2012 Ponto All. All rights reserved.
//

#import "NSString-Utilities.h"
#import <CommonCrypto/CommonDigest.h>

@implementation NSString (Addition)

#pragma Internal Methods

-(NSString*) md5
{
    const char *cStr = [self UTF8String];
	unsigned char result[16];
	CC_MD5( cStr, strlen(cStr), result );
	
	return [NSString stringWithFormat:
            @"%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X%02X",
            result[0], result[1], result[2], result[3], 
            result[4], result[5], result[6], result[7],
            result[8], result[9], result[10], result[11],
            result[12], result[13], result[14], result[15]
            ];
}

-(NSString*) sha1
{
    const char *cstr = [self cStringUsingEncoding:NSUTF8StringEncoding];
    NSData *data = [NSData dataWithBytes:cstr length:self.length];
    
    uint8_t digest[CC_SHA1_DIGEST_LENGTH];
    
    CC_SHA1(data.bytes, data.length, digest);
    
    NSMutableString* output = [NSMutableString stringWithCapacity:CC_SHA1_DIGEST_LENGTH * 2];
    
    for(int i = 0; i < CC_SHA1_DIGEST_LENGTH; i++)
        [output appendFormat:@"%02x", digest[i]];
    
    return output;
    
}

- (BOOL) isStringEmpty
{
    if (![self isKindOfClass:[NSString class]]) return YES;
	return !self || [self isEqualToString:@""];
}

#pragma External Methods

+ (NSString*) md5:(NSString*)input
{
    return [[NSString stringWithString:input] md5];
}

+ (NSString*) sh1:(NSString*)input
{
    return [[NSString stringWithString:input] sha1];
}

+(BOOL) isStringEmpty:(NSString *)input 
{
	return [[NSString stringWithString:input] isStringEmpty];
}

@end
