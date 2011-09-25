//
//  NSArray+Converting.m
//  Assignment2
//
//  Created by Roger Whitney on 9/5/11.
//  Copyright (c) 2011 San Diego State University. All rights reserved.
//

#import "NSArray+Converting.h"

@implementation NSArray (Converting)

- (int *) asIntArray {
    int * asArray = (int *) malloc([self count] * sizeof(int));
    for (int k = 0; k < [self count];k++ ) {
        asArray[k] = [[self objectAtIndex:k] intValue];
    }
    return asArray;
}

+ (id) arraywithInts: (int *) intArray count: (int) count{
    NSMutableArray * integers = [NSMutableArray new];
    for (int k = 0; k < count;k++) {
        [integers addObject:[NSNumber numberWithInt: intArray[k]]];
    }
    [integers autorelease];
    return integers;
  }

@end
