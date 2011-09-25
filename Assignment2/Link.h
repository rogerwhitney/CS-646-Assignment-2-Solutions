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

- (void) collectElementsIn: (NSMutableArray * ) collection;

@end
