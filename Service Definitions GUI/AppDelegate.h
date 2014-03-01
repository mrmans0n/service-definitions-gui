//
//  AppDelegate.h
//  Service Definitions GUI
//
//  Created by Nacho López on 01/03/14.
//  Copyright (c) 2014 Mobivery. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MainViewController.h"
@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (assign) IBOutlet NSWindow *window;
@property (nonatomic, strong) MainViewController *mainViewController;

@end
