//
//  MainViewController.m
//  Service Definitions GUI
//
//  Created by Nacho López on 01/03/14.
//  Copyright (c) 2014 Mobivery. All rights reserved.
//

#import "MainViewController.h"

@interface MainViewController ()
@property (weak) IBOutlet NSOutlineView *outlineView;
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

- (void)awakeFromNib {
    [self.outlineView setDataSource:self];
    [self.outlineView setDelegate:self];
    [[[self.outlineView tableColumns] objectAtIndex:0] setIdentifier:@"name"];
    [[[self.outlineView tableColumns] objectAtIndex:1] setIdentifier:@"description"];
}



// Method returns count of children for given tree node item
- (NSInteger)outlineView:(NSOutlineView *)outlineView numberOfChildrenOfItem:(id) item {
    if ([item respondsToSelector:@selector(namedFields)]) {
        NSDictionary *valuesForItem = [item namedFields];
        return [valuesForItem count];
    } else {
        return 0;
    }
}

// Method returns flag, whether we can expand given tree node item or not
// (here is the simple rule, we can expand only nodes having one and more children)
- (BOOL)outlineView:(NSOutlineView *)outlineView isItemExpandable:(id)item {
    if ([item respondsToSelector:@selector(isLeaf)]) {
        return [item isLeaf];
    } else {
        return NO;
    }
}

// Method returns value to be shown for given column of the tree node item
- (id)outlineView:(NSOutlineView *)outlineView objectValueForTableColumn:(NSTableColumn *)tableColumn byItem:(id)item {
    if ([item respondsToSelector:@selector(namedFields)]) {
        NSDictionary *valuesForItem = [item namedFields];
        return [valuesForItem objectForKey:[tableColumn identifier]];
    } else {
        return nil;
    }
}

// Method returns children item for given tree node item by given index
- (id)outlineView:(NSOutlineView *)outlineView child:(NSInteger)index ofItem:(id)item {
    if ([item respondsToSelector:@selector(namedFields)]) {
        NSArray *keys = [[item namedFields] allKeys];
        id aKey = [keys objectAtIndex:index];
        return [[item namedFields] objectForKey:aKey];
    } else {
        return nil;
    }
}

- (void)refreshLoadedFile {
    // TODO: ?
}
@end
