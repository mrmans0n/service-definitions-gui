//
//  Field.m
//  Service Definitions GUI
//
//  Created by Nacho Lopez Sais on 01/03/14.
//  Copyright (c) 2014 Mobivery. All rights reserved.
//

#import "Field.h"

@implementation Field

- (id)initWithRXMLElement:(RXMLElement*)xmlElement {
    self = [super init];
    if (self) {
        self.name = [xmlElement attribute:@"name"];
        self.description = [xmlElement attribute:@"description"];
        self.serviceName = [xmlElement attribute:@"serviceName"];
        self.type = [xmlElement attribute:@"type"];
    }
    return self;
}

+ (Field*)createFromRXMLElement:(RXMLElement*)xmlElement {
    return [[Field alloc] initWithRXMLElement:xmlElement];
}
@end


@implementation Field (OutlineNode)

- (NSDictionary*)namedFields {
    return @{@"name" : self.name,
             @"description" : self.description,
             @"type" : self.type,
             @"serviceName" : self.serviceName};
}

- (BOOL)isLeaf {
    return NO;
}

@end