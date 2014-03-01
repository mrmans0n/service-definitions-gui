//
//  Type.m
//  Service Definitions GUI
//
//  Created by Nacho Lopez Sais on 01/03/14.
//  Copyright (c) 2014 Mobivery. All rights reserved.
//

#import "Type.h"

@implementation Type

- (id)initWithRXMLElement:(RXMLElement*)xmlElement {
    self = [super init];
    if (self) {
        // TODO: nlopez: custom initialization
    }
    return self;
}

+ (Type*)createFromRXMLElement:(RXMLElement*)xmlElement {
    return [[Type alloc] initWithRXMLElement:xmlElement];
}

@end
