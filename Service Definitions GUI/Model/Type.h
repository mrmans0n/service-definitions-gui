//
//  Type.h
//  Service Definitions GUI
//
//  Created by Nacho Lopez Sais on 01/03/14.
//  Copyright (c) 2014 Mobivery. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "RXMLElement.h"
#import "Field.h"
#import "NSObject+OutlineNode.h"

@interface Type : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *description;
@property (nonatomic, strong) NSArray *fields;
@property (nonatomic, assign) BOOL typeRef;

- (id)initWithRXMLElement:(RXMLElement*)xmlElement;
+ (Type*)createFromRXMLElement:(RXMLElement*)xmlElement;

@end
