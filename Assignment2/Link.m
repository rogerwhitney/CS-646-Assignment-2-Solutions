//
//  Link.m
//  Assignment2
//
//  Created by Roger Whitney on 9/8/11.
//  Copyright 2011 San Diego State University. All rights reserved.
//

#import "Link.h"


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

- (void) enumerateObjectsUsingBlock:(void (^)(id object, NSUInteger index, BOOL *stop)) block listLocation: (NSInteger) index {
    BOOL stop = FALSE;
    block(element,index,&stop);
    if (stop) return;
    if (next)
        [next enumerateObjectsUsingBlock:block listLocation:index - 1];
}
@end
