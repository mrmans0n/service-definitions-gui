//
//  MainViewController.m
//  Service Definitions GUI
//
//  Created by Nacho López on 01/03/14.
//  Copyright (c) 2014 Mobivery. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()

@property (nonatomic, strong) NSArray *messageArray;
@property (nonatomic, strong) NSArray *typeArray;

@end

@implementation MainViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Initialization code here.
    }
    return self;
}

- (NSView *)outlineView:(NSOutlineView *)outlineView viewForTableColumn:(NSTableColumn *)tableColumn item:(NSTreeNode*)item {
	if ([item.representedObject isGroup]) {
		return [outlineView makeViewWithIdentifier:@"HeaderCell" owner:self];
	}
	return [outlineView makeViewWithIdentifier:@"DataCell" owner:self];
}

- (BOOL)outlineView:(NSOutlineView *)outlineView isGroupItem:(NSTreeNode*)item {
	return [item.representedObject isGroup];
}

- (BOOL)outlineView:(NSOutlineView *)outlineView shouldSelectItem:(NSTreeNode*)item {
	return ![item.representedObject isGroup];
}

- (void)refreshLoadedFile {
    // TODO: ?
    self.messageArray = [[DefinitionLogic sharedInstance] messages];
    self.typeArray = [[DefinitionLogic sharedInstance] types];
    BrowserItem *messages = [BrowserItem itemWithTitle:@"Messages"];
    messages.childItemTitleKeypath = @"name";
    [messages bindChildItemsToArrayKeypath:@"self.messageArray" onObject:self];
    
    BrowserItem *types = [BrowserItem itemWithTitle:@"Types"];
    types.childItemTitleKeypath = @"name";
    [types bindChildItemsToArrayKeypath:@"self.typeArray" onObject:self];

    
    self.sidebarItems = @[messages, types];
}
@end
