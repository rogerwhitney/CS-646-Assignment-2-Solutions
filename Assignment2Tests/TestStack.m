//
//  TestStack.m
//  Assignment2
//
//  Created by Roger Whitney on 9/26/11.
//  Copyright 2011 San Diego State University. All rights reserved.
//

#import "TestStack.h"
#import "Stack.h"

typedef void (^enumerateBlock)(id object, NSUInteger index, BOOL *stop);
@implementation TestStack

- (void) testCreateWithArray {
    NSArray * elements = [NSArray arrayWithObjects:@"a", @"b", nil ];
    Stack * test = [Stack stackWithArray: elements];
    STAssertTrue([@"b" isEqual: [test pop]], @"components");
    STAssertTrue([@"a" isEqual: [test pop]], @"components");
}

- (void) testEnumerateObjectsUsingBlock {
    NSArray * elements = [NSArray arrayWithObjects:@"a", @"b", @"c", @"d", nil ];
    Stack * test = [Stack stackWithArray: elements];
    __block NSMutableArray  * result = [NSMutableArray new];
    enumerateBlock collect = ^(id object, NSUInteger index, BOOL *stop) { 
        [result addObject:object];};
    [test enumerateObjectsUsingBlock:collect];
    NSArray * expectedResult = [NSArray arrayWithObjects:@"d", @"c", @"b", @"a", nil ];
    STAssertTrue([expectedResult isEqualToArray: result], @"array %@ = %@", expectedResult, result);
}

- (void) testEnumerateObjectsUsingBlockStop {
    NSArray * elements = [NSArray arrayWithObjects:@"a", @"b", @"c", @"d", nil ];
    Stack * test = [Stack stackWithArray: elements];
    __block NSMutableArray  * result = [NSMutableArray new];
    enumerateBlock collect = ^(id object, NSUInteger index, BOOL *stop) { 
        [result addObject:object];
        if (object == @"c") 
            *stop = YES;};
    [test enumerateObjectsUsingBlock:collect];
    NSArray * expectedResult = [NSArray arrayWithObjects:@"d", @"c", nil ];
    STAssertTrue([expectedResult isEqualToArray: result], @"array %@ = %@", expectedResult, result);
}

- (void) testComponentsJoinedBy {
    Stack * test = [Stack new];
    NSString * result = [test description];
    STAssertTrue([@"Stack((null))" isEqual: result], @"components");
    [test push:@"a"];
    result = [test description];
    STAssertTrue([@"Stack(a->(null))" isEqual: result], @"components");
    [test push:@"b"];
    STAssertTrue([@"Stack(b->a->(null))" isEqual: [test description]], @"components");
}

- (void) testPushPop {
    Stack * test = [Stack new];
    [test push:@"a"];
    [test push:@"b"];
    [test push:@"c"];
    STAssertTrue([@"c" isEqual: [test pop]], @"pop");
    STAssertTrue([@"b" isEqual: [test pop]], @"pop");
    STAssertTrue([@"a" isEqual: [test pop]], @"pop");
    
}

- (void) testCount {
    Stack * test = [Stack new];
    STAssertTrue(test.count == 0, @"equal");
    [test push:@"a"];
    STAssertTrue(test.count == 1, @"equal");
    [test push:@"b"];
    STAssertTrue(test.count == 2, @"equal");
    [test pop];
    STAssertTrue(test.count == 1, @"equal");
    [test pop];
    STAssertTrue(test.count == 0, @"equal");
}

- (void) testCopy {
    Stack * test = [Stack new];
    NSNumber * data = [NSNumber numberWithInt:1];
    [test push: data];
}

- (void) testClear {
    Stack * test = [Stack new];
    [test push:@"a"];
    [test push:@"b"];
    [test clear];
    STAssertTrue(test.count == 0, @"equal");   
}
@end
