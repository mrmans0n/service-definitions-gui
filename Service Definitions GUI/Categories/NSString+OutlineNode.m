//
//  NSString+OutlineNode.m
//  Service Definitions GUI
//
//  Created by Nacho López on 02/03/14.
//  Copyright (c) 2014 Mobivery. All rights reserved.
//

#import "NSString+OutlineNode.h"

@implementation NSString (OutlineNode)

- (NSDictionary*)namedFields {
    return [NSDictionary new];
}

- (BOOL)isLeaf {
    return YES;
}

@end