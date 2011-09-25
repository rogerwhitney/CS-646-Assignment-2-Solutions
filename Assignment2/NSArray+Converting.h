//
//  NSArray+Converting.h
//  Assignment2
//
//  Created by Roger Whitney on 9/5/11.
//  Copyright (c) 2011 San Diego State University. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (Converting)

- (int *) asIntArray;

+ (id) arraywithInts: (int *) intArray  count: (int) count;
@end
