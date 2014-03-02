//
//  NSObject+OutlineNode.h
//  Service Definitions GUI
//
//  Created by Nacho López on 02/03/14.
//  Copyright (c) 2014 Mobivery. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (OutlineNode)
- (NSDictionary*)namedFields;
- (BOOL)isLeaf;
@end
