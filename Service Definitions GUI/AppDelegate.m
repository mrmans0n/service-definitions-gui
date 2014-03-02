//
//  AppDelegate.m
//  Service Definitions GUI
//
//  Created by Nacho López on 01/03/14.
//  Copyright (c) 2014 Mobivery. All rights reserved.
//

#import "AppDelegate.h"
#import "DefinitionLogic.h"

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification
{
    // Insert code here to initialize your application
}

- (void)openDocument:(id)shit {
    NSArray *fileTypes = @[@"xml"];
    NSOpenPanel * panel = [NSOpenPanel openPanel];
    [panel setAllowsMultipleSelection:NO];
    [panel setCanChooseDirectories:NO];
    [panel setCanChooseFiles:YES];
    [panel setFloatingPanel:YES];
    [panel setDirectoryURL:[NSURL URLWithString:NSHomeDirectory()]];
    [panel setAllowedFileTypes:fileTypes];
    
    NSInteger result = [panel runModal];
    if(result == NSOKButton && [panel URLs].count > 0) {
        [self loadXML:[panel URLs][0]];
    }
}

- (void)loadXML:(NSURL*)filePath {
    NSAlert *alert = [[NSAlert alloc] init];
    [alert addButtonWithTitle:@"OK"];
    if (![[DefinitionLogic sharedInstance] loadFromFile:filePath]) {
        [alert setMessageText:@"Error"];
        [alert setInformativeText:@"Service Definitions file could not be opened. Please check its syntax and use some linter in it first."];
        [alert setAlertStyle:NSWarningAlertStyle];
    } else {
        [alert setMessageText:@"File opened!"];
        [alert setAlertStyle:NSInformationalAlertStyle];
        
        self.mainViewController = [[MainViewController alloc] initWithNibName:@"MainView" bundle:nil];
        
        [self.window.contentView addSubview:self.mainViewController.view];
        self.mainViewController.view.frame = ((NSView*)self.window.contentView).bounds;
        [self.mainViewController refreshLoadedFile];
    }
    [alert runModal];
}

@end
