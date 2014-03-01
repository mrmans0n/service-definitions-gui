//
//  DefinitionLogic.m
//  Service Definitions GUI
//
//  Created by Nacho Lopez Sais on 01/03/14.
//  Copyright (c) 2014 Mobivery. All rights reserved.
//

#import "DefinitionLogic.h"
#import "RXMLElement.h"
#import "Message.h"
#import "Type.h"
#import "Field.h"

@implementation DefinitionLogic

// Get the shared instance and create it if necessary.
+ (DefinitionLogic *)sharedInstance {
    
    static dispatch_once_t onceQueue;
    static DefinitionLogic *instance = nil;
    
    dispatch_once(&onceQueue, ^{ instance = [[self alloc] init]; });
    return instance;
}

- (BOOL)loadFromFile:(NSURL*)filePath {
    NSString *normalizedPath = [filePath path];
    if (![[NSFileManager defaultManager] fileExistsAtPath: normalizedPath]) {
        return NO;
    }
    RXMLElement *rootXML = [RXMLElement elementFromURL:filePath];
    if (!rootXML || ![rootXML isValid]) {
        return NO;
    }
    // Maybe do something with description??
    [self loadMessages:[rootXML child:@"messages"]];
    [self loadTypes:[rootXML child:@"types"]];
    return YES;
}

- (void) loadMessages:(RXMLElement*)messagesNode {
    NSArray *messagesNodeArray = [messagesNode children:@"message"];
    NSMutableArray *tempMessages = [NSMutableArray new];
    for (RXMLElement *messageNode in messagesNodeArray) {
        [tempMessages addObject: [Message createFromRXMLElement:messageNode]];
    }
    self.messages = [NSArray arrayWithArray:tempMessages];
}

- (void) loadTypes:(RXMLElement*)typesNode {
    NSArray *typesNodeArray = [typesNode children:@"type"];
    NSMutableArray *tempTypes = [NSMutableArray new];
    for (RXMLElement *typeNode in typesNodeArray) {
        [tempTypes addObject: [Type createFromRXMLElement:typeNode]];
    }
    self.types = [NSArray arrayWithArray:tempTypes];}

@end
