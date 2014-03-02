//
//  Message.m
//  Service Definitions GUI
//
//  Created by Nacho Lopez Sais on 01/03/14.
//  Copyright (c) 2014 Mobivery. All rights reserved.
//

#import "Message.h"

@implementation Message

- (id)initWithRXMLElement:(RXMLElement*)xmlElement {
    self = [super init];
    if (self) {
        self.name = [xmlElement attribute:@"name"];
        self.description = [xmlElement attribute:@"description"];
        self.service = [xmlElement attribute:@"service"];
        self.method = [xmlElement attribute:@"method"];
        self.verb = [xmlElement attribute:@"type"];
        self.urlAddress = [[[xmlElement child:@"urlPattern"] child:@"url"] attribute:@"address"];
        self.request = [Type createFromRXMLElement:[xmlElement child:@"request"]];
        self.response = [Type createFromRXMLElement:[xmlElement child:@"response"]];
    }
    return self;
}

+ (Message*)createFromRXMLElement:(RXMLElement*)xmlElement {
    return [[Message alloc] initWithRXMLElement:xmlElement];
}

@end

@implementation Message (OutlineNode)

- (NSDictionary*)namedFields {
    return @{@"name" : self.name,
             @"description" : self.description,
             @"service" : self.service,
             @"method" : self.method,
             @"verb" : self.verb,
             @"url" : self.urlAddress,
             @"request" : self.request,
             @"response" : self.response};
}

- (BOOL)isLeaf {
    return NO;
}

@end