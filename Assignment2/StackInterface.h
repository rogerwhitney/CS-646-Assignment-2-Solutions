//
//  Stack.h
//  Assignment2
//
//  Created by Roger Whitney on 9/8/11.
//  Copyright 2011 San Diego State University. All rights reserved.
//

#import <Foundation/Foundation.h>


@protocol Stack 
- (id) pop;
- (void) push: (id) element;
- (void) clear;

@property (readonly) NSInteger count;

@end
