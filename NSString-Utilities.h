//
//  NSString-Utilities.h
//  leonardors
//
//  Created by Leonardo on 24/02/12.
//  Copyright (c) 2012 Ponto All. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (Additions)

#pragma Internal Methods
- (NSString*) md5;
- (NSString*) sha1;
- (BOOL) isStringEmpty;

#pragma External Methods
+ (NSString*) md5:(NSString*)input;
+ (NSString*) sh1:(NSString*)input;
+ (BOOL) isStringEmpty:(NSString *)input;

@end
