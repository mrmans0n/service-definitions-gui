//
//  BrowserItem.h
//  SidebarTest
//
//  Created by Nacho Lopez Sais on 01/03/14.
//  Copyright (c) 2014 Mobivery. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BrowserItem : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSArrayController *childItemsArrayController;
@property (nonatomic, strong) NSString *childItemTitleKeypath;
@property (nonatomic, strong) NSMutableArray *children;
- (void)bindChildItemsToArrayKeypath:(NSString*)keypath onObject:(id)object;
@property (nonatomic, assign) BOOL isGroup;
@property (nonatomic, strong) NSMapTable *modelToItemMapping;
+ (BrowserItem*)itemWithTitle:(NSString*)title;

@end
