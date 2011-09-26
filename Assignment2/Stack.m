//
//  Stack.m
//  Assignment2
//
//  Created by Roger Whitney on 9/8/11.
//  Copyright 2011 San Diego State University. All rights reserved.
//

#import "Stack.h"

@interface Stack()

    - (NSString *) componentsJoinedByString:(NSString *)separator;
    
@end

@implementation Stack


@synthesize count;

+ (id) stackWithArray: (NSArray *) elements {
    id stack = [[self alloc] initWithArray:elements];
    [stack autorelease];
    return stack;
}

- (id) initWithArray: (NSArray *) initialElements {
    self = [super init];
    if (self) {
        for (id element in initialElements)
            [self push:element];
    }
    return self;   
}

- (id) popElementUnreleased {
    count--;
    id element = topOfStack.element;
    Link * oldTop = topOfStack;
    topOfStack = oldTop.next;
    [oldTop release];
    return element;
}

- (id) pop {
    id element = [self popElementUnreleased];
    [element autorelease];
    return element;
}

- (void) push:(id)element {
    count++;
    [element retain];
    Link * newLink = [[Link alloc] initWithElement:element next: topOfStack];
    topOfStack = newLink;
}

- (void) clear {
    while (topOfStack) {
        [[self popElementUnreleased] release];
    }
}

- (NSString *) componentsJoinedByString:(NSString *)separator {
    typedef void (^enumerateBlock)(id object, NSUInteger index, BOOL *stop);
    __block NSMutableString * result = [[NSMutableString alloc] init ];
    enumerateBlock generateString = ^(id object, NSUInteger index, BOOL *stop) { 
        [result appendFormat:@"%@",object];
        if (index > 1)
            [result appendString:separator];};
    [topOfStack enumerateObjectsUsingBlock:generateString listLocation: count];

      return result;
}

- (void) enumerateObjectsUsingBlock:(void (^)(id object, NSUInteger index, BOOL *stop)) block {
    [topOfStack enumerateObjectsUsingBlock:block listLocation: count];
}

- (NSString *) description {
    return [NSString stringWithFormat:@"Stack(%@)", [self componentsJoinedByString:@", "]];
}

- (void) dealloc {
    [self clear];
    [super dealloc];
}
@end
