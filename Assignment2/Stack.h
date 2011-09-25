//
//  Stack.h
//  Assignment2
//
//  Created by Roger Whitney on 9/8/11.
//  Copyright 2011 San Diego State University. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "StackInterface.h"
#import "Link.h"

@interface Stack : NSObject <Stack> {
    Link * topOfStack;
}

+ (id) stackWithArray: (NSArray *) elements;

- (id) initWithArray: (NSArray *) elements;

- (void) enumerateObjectsUsingBlock:(void (^)(id object, NSUInteger index, BOOL *stop)) block ;

@end
 