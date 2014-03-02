//
//  NSObject+OutlineNode.m
//  Service Definitions GUI
//
//  Created by Nacho López on 02/03/14.
//  Copyright (c) 2014 Mobivery. All rights reserved.
//

#import "NSObject+OutlineNode.h"

@implementation NSObject (OutlineNode)

- (NSDictionary*)namedFields {
    return nil;
}

- (BOOL)isLeaf {
    return [[self namedFields] count] < 1;
}

@end
