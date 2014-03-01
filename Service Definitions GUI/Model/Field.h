//
//  Field.h
//  Service Definitions GUI
//
//  Created by Nacho Lopez Sais on 01/03/14.
//  Copyright (c) 2014 Mobivery. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RXMLElement.h"

@interface Field : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *serviceName;
@property (nonatomic, strong) NSString *type;
@property (nonatomic, strong) NSString *description;

- (id)initWithRXMLElement:(RXMLElement*)xmlElement;
+ (Field*)createFromRXMLElement:(RXMLElement*)xmlElement;

@end
