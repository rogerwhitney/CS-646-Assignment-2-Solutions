//
//  Assignment2Tests.m
//  Assignment2Tests
//
//  Created by Roger Whitney on 9/5/11.
//  Copyright (c) 2011 San Diego State University. All rights reserved.
//

#import "Assignment2Tests.h"
#import "NSString+NSString_Extras.h"
#import "NSArray+Converting.h"

@implementation Assignment2Tests

- (void)setUp
{
    [super setUp];
    
    // Set-up code here.
}

- (void)tearDown
{
    // Tear-down code here.
    
    [super tearDown];
}

- (void) testReverse {
    STAssertTrue([@"cba" isEqual: [@"abc" reverse]], @"reverse");
}

- (void) testGlobalCallCount {
    NSString * test = @"2";
    NSString * test2 = @"8";
    STAssertTrue([test globalCallCount] == 0, @"no calls");
    STAssertTrue([test2 globalCallCount] == 0, @"no calls");
    [test integerValues];
    STAssertTrue([test globalCallCount] == 1, @"no calls");
    STAssertTrue([test2 globalCallCount] == 1, @"no calls");
    [test integerValues];
    STAssertTrue([test globalCallCount] == 2, @"no calls");
    [test2 integerValues];
    STAssertTrue([test2 globalCallCount] == 3, @"no calls");
    STAssertTrue([test globalCallCount] == 3, @"no calls");
}


- (void) testIntegerValue1  {
    int data[] = {2};
    NSArray * expectedResult = [NSArray arraywithInts: data count:1];
    NSArray * result = [@"2" integerValues];
    STAssertTrue([expectedResult isEqualToArray: result] ,@"single value");
    // STAssertTrue([@"3" integerValues] == 3,@"single value 3");

}

- (void) testIntegerValue0  {
    int data[] = {0};
    NSArray * expectedResult = [NSArray arraywithInts: data count:1];
    NSArray * result = [@"" integerValues];
    STAssertTrue([expectedResult isEqualToArray: result] ,@"single value");
}

- (void) testIntegerValue4  {
    int data[] = {2, 3, 0, 5};
    NSArray * expectedResult = [NSArray arraywithInts: data count:4];
    NSArray * result = [@" 2 , 3, cat, 5" integerValues];
    STAssertTrue([expectedResult isEqualToArray: result] ,@"single value");
}

- (void) testArrayWithInts  {
    int array[]= { 2 };
    NSArray * result = [NSArray arraywithInts: array count:1];
    STAssertTrue([result count] == 1, @"count");
    STAssertTrue([[result objectAtIndex: 0] intValue] == 2, @"value = 2");
    int array2[] = { 2 ,3 };
    result = [NSArray arraywithInts: array2 count:2];
    STAssertTrue([result count] == 2, @"count");
    STAssertTrue([[result objectAtIndex: 0] intValue] == 2, @"value = 2");
    STAssertTrue([[result objectAtIndex: 1] intValue] == 3, @"value = 3");
    int array0[] = { };
    result = [NSArray arraywithInts: array0 count:0];
    STAssertTrue([result count] == 0, @"count");
    int array5[] = { 1,2,3,4,5};
    result = [NSArray arraywithInts: array5 count:5];
    for (int k = 0;k< 5;k++) {
        STAssertTrue([[result objectAtIndex: k] intValue] == array5[k], @"individual values %i", k);
    }

}

@end
