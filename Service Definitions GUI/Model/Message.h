//
//  Message.h
//  Service Definitions GUI
//
//  Created by Nacho Lopez Sais on 01/03/14.
//  Copyright (c) 2014 Mobivery. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Type.h"
#import "RXMLElement.h"

@interface Message : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *service;
@property (nonatomic, strong) NSString *method;
@property (nonatomic, strong) NSString *verb;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) NSString *urlAddress;
@property (nonatomic, strong) Type *request;
@property (nonatomic, strong) Type *response;

- (id)initWithRXMLElement:(RXMLElement*)xmlElement;
+ (Message*)createFromRXMLElement:(RXMLElement*)xmlElement;

@end
