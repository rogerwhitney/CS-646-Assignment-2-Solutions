//
//  NSString+NSString_Extras.m
//  Assignment2
//
//  Created by Roger Whitney on 9/5/11.
//  Copyright (c) 2011 San Diego State University. All rights reserved.
//

#import "NSString+NSString_Extras.h"

@implementation NSString (Extras)
    static int masterCount;

- (NSArray * ) integerValues {
    
    NSArray * parts = [self componentsSeparatedByString:@","];
    NSMutableArray * integers = [NSMutableArray new];
    for (NSString * part in parts) {
        [integers addObject: [NSNumber numberWithInt:[part intValue]]];
    }
    masterCount++;
    return integers;
}

- (int) globalCallCount {
    return masterCount;
}

- (NSString *) reverse {
    NSMutableString * reverse = [NSMutableString stringWithCapacity:[self length]];
    for (NSInteger k = [self length] - 1;k>=0;k--) {
        [reverse appendFormat:@"%C", [self characterAtIndex:k]];
    }
    return reverse;
}
@end
