//
//  MainViewController.h
//  Service Definitions GUI
//
//  Created by Nacho López on 01/03/14.
//  Copyright (c) 2014 Mobivery. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Message.h"
#import "Type.h"
#import "Field.h"
#import "BrowserItem.h"
#import "DefinitionLogic.h"

@interface MainViewController : NSViewController<NSOutlineViewDataSource, NSOutlineViewDelegate>

@property (nonatomic, strong) NSArray *sidebarItems;

- (void)refreshLoadedFile;

@end
