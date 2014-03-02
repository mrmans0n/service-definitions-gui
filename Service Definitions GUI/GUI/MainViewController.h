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
#import "NSString+OutlineNode.h"

@interface MainViewController : NSViewController<NSOutlineViewDataSource, NSOutlineViewDelegate>

- (void)refreshLoadedFile;

@end
