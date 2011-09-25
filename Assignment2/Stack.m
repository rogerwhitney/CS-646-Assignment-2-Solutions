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

- (id) pop {
    count--;
    id element = topOfStack.element;
    Link * oldTop = topOfStack;
    topOfStack = oldTop.next;
    [oldTop release];
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
        [self pop];
    }
}

- (NSMutableArray *) elementsAsArray {
    NSMutableArray * listElements = [NSMutableArray arrayWithCapacity:self.count];
    [topOfStack collectElementsIn:listElements];
  return listElements;
}

- (NSString *) componentsJoinedByString:(NSString *)separator {
      return [[self elementsAsArray] componentsJoinedByString:separator];
}

- (void) enumerateObjectsUsingBlock:(void (^)(id object, NSUInteger index, BOOL *stop)) block {
    [[self elementsAsArray] enumerateObjectsUsingBlock:block];
}

- (NSString *) description {
    return [NSString stringWithFormat:@"Stack(%@)", topOfStack];
}

- (void) dealloc {
    [self clear];
    [super dealloc];
}
@end
