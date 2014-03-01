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
        // TODO: nlopez: beware of the typeRef attribute crap
        self.name = [xmlElement attribute:@"name"];
        self.description = [xmlElement attribute:@"description"];
        NSArray *fieldNodesArray = [xmlElement children:@"field"];
        NSMutableArray *tempNodes = [NSMutableArray new];
        for (RXMLElement *fieldNode in fieldNodesArray) {
            [tempNodes addObject:[Field createFromRXMLElement:fieldNode]];
        }
        self.fields = [NSArray arrayWithArray:tempNodes];
    }
    return self;
}

+ (Type*)createFromRXMLElement:(RXMLElement*)xmlElement {
    return [[Type alloc] initWithRXMLElement:xmlElement];
}

@end
