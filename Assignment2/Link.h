//
//  Link.h
//  Assignment2
//
//  Created by Roger Whitney on 9/8/11.
//  Copyright 2011 San Diego State University. All rights reserved.
//

#import <Foundation/Foundation.h>

//Link does not own any of its fields
//Link only to be used inside Stack
//Stack owns everything

@interface Link : NSObject {
  
}

@property (assign) id element;
@property (assign) Link * next;

- initWithElement: (id) newElement next: (Link *) tail;


// ListLocation index = n for topOfStack
// ListLocation index = 1 for bottom of stack
- (void) enumerateObjectsUsingBlock:(void (^)(id object, NSUInteger index, BOOL *stop)) block listLocation: (NSInteger) index;

@end
