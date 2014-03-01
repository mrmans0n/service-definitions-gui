//
//  DefinitionLogic.h
//  Service Definitions GUI
//
//  Created by Nacho Lopez Sais on 01/03/14.
//  Copyright (c) 2014 Mobivery. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DefinitionLogic : NSObject

@property (nonatomic, strong) NSArray *messages;
@property (nonatomic, strong) NSArray *types;

+ (DefinitionLogic *)sharedInstance;
- (BOOL)loadFromFile:(NSURL*)filePath;

@end
