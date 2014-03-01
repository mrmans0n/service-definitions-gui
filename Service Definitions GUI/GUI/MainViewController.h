//
//  MainViewController.h
//  Service Definitions GUI
//
//  Created by Nacho López on 01/03/14.
//  Copyright (c) 2014 Mobivery. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface MainViewController : NSViewController<NSOutlineViewDataSource>
@property (weak) IBOutlet NSOutlineView *outlineView;

@end
