//
//  BrowserItem.m
//  SidebarTest
//
//  Created by Nacho Lopez Sais on 01/03/14.
//  Copyright (c) 2014 Mobivery. All rights reserved.
//

#import "BrowserItem.h"

@implementation BrowserItem

+ (BrowserItem*)itemWithTitle:(NSString*)title;
{
	BrowserItem *group = [[BrowserItem alloc] init];
	group.title = title;
	return group;
}

- (id)init
{
	if (self = [super init])
	{
		self.children = [NSMutableArray array];
		self.modelToItemMapping = [NSMapTable weakToStrongObjectsMapTable];
		self.childItemsArrayController = [[NSArrayController alloc] init];
		
		[self.childItemsArrayController addObserver:self forKeyPath:@"arrangedObjects" options:NSKeyValueObservingOptionPrior context:NULL];
	}
	return self;
}


- (void)bindChildItemsToArrayKeypath:(NSString*)keypath onObject:(id)object;
{
	[self.childItemsArrayController bind:@"contentArray" toObject:object withKeyPath:keypath options:nil];
	self.isGroup = YES;
}

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
	if ([keyPath isEqualToString:@"arrangedObjects"])
	{
		[self willChangeValueForKey:@"children"];
		NSMutableArray *watchableChildren = [self mutableArrayValueForKey:@"children"];
		
		[watchableChildren removeAllObjects];
		for (id modelItem in self.childItemsArrayController.arrangedObjects)
		{
			BrowserItem *browserItem = [self.modelToItemMapping objectForKey:modelItem];
			
			if (!browserItem)
			{
				browserItem = [BrowserItem itemWithTitle:[modelItem valueForKey:self.childItemTitleKeypath]];
				[self.modelToItemMapping setObject:browserItem forKey:modelItem];
			}
			[watchableChildren addObject:browserItem];
		}
		
		[self didChangeValueForKey:@"children"];
	}
}

@end
