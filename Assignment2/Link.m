//
//  Link.m
//  Assignment2
//
//  Created by Roger Whitney on 9/8/11.
//  Copyright 2011 San Diego State University. All rights reserved.
//

#import "Link.h"

// test

@implementation Link

@synthesize element;
@synthesize next;

- initWithElement: (id) newElement next: (Link *) tail {
    self = [super init];
    if (self) {
        self.next = tail;
        self.element = newElement;
    }
    return self;
}

- (void) collectElementsIn:(NSMutableArray *)collection {
    [collection addObject: self.element];
    [self.next collectElementsIn:collection];
}

- (NSString *) description {
    return [NSString stringWithFormat:@"%@->%@", element, next];
}

@end
