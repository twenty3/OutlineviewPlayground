//
//  AppDelegate.m
//  Outlineview Playground
//
//  Created by 23 on 10/15/15.
//  Copyright © 2015 MartianCraft. All rights reserved.
//

#import "AppDelegate.h"

@interface DataItem : NSObject

@property (copy) NSString* mapName;
@property (copy) NSString* planetName;

- (instancetype)initWithMapName:(NSString*)mapName planetName:(NSString*)planetName;

@end

@implementation DataItem

- (instancetype)initWithMapName:(NSString *)mapName planetName:(NSString *)planetName
{
    self = [super init];
    if (self)
    {
        self.mapName = mapName;
        self.planetName = planetName;
    }
    return self;
}

@end

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@property (strong) NSMutableArray* dataItems;
@property (weak) IBOutlet NSOutlineView *outlineView;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)notification
{    
    self.dataItems = [NSMutableArray arrayWithArray:@[
                            [[DataItem alloc] initWithMapName:@"Bannerfall" planetName:@"Earth"],
                            [[DataItem alloc] initWithMapName:@"Twilight Gap" planetName:@"Earth"],
                            [[DataItem alloc] initWithMapName:@"Rusted Lands" planetName:@"Earth"],
                            [[DataItem alloc] initWithMapName:@"Firease Delphi" planetName:@"Mars"],
                            [[DataItem alloc] initWithMapName:@"Blind Watch" planetName:@"Mars"],
                            [[DataItem alloc] initWithMapName:@"Bastion" planetName:@"Mars"],
                            [[DataItem alloc] initWithMapName:@"Shores of Time" planetName:@"Venus"],
                            [[DataItem alloc] initWithMapName:@"Thieves' Den" planetName:@"Venus"],
                            [[DataItem alloc] initWithMapName:@"Asylum" planetName:@"Venus"],
                            [[DataItem alloc] initWithMapName:@"The Burning Shrine" planetName:@"Mercury"],
                            ]];
    
    [self.outlineView reloadData];
    [self.outlineView sizeToFit];
}

#pragma mark - NSOutlineViewDataSource

- (NSInteger)outlineView:(NSOutlineView *)outlineView numberOfChildrenOfItem:(nullable id)item
{
    if ( item == nil ) return self.dataItems.count;
    
    return 0;
}

- (id)outlineView:(NSOutlineView *)outlineView child:(NSInteger)index ofItem:(nullable id)item
{
    if ( item == nil ) return self.dataItems[index];
    
    return nil;
}
- (BOOL)outlineView:(NSOutlineView *)outlineView isItemExpandable:(id)item
{
    return NO;
}

- (nullable id)outlineView:(NSOutlineView *)outlineView objectValueForTableColumn:(nullable NSTableColumn *)tableColumn byItem:(nullable id)item
{
    return item;
}

- (NSView *)outlineView:(NSOutlineView *)outlineView viewForTableColumn:(NSTableColumn *)tableColumn item:(id)item
{
    NSTableCellView* cellView = nil;
    
    if ( [tableColumn.identifier isEqualToString:@"MapNameColumn"] )
    {
        cellView = [outlineView makeViewWithIdentifier:@"DataCell" owner:self];
        cellView.layer.backgroundColor = [[NSColor purpleColor] colorWithAlphaComponent:0.25].CGColor;
    }
    else if ( [tableColumn.identifier isEqualToString:@"PlanetNameColumn"] )
    {
        cellView = [outlineView makeViewWithIdentifier:@"PlanetCell" owner:self];
        cellView.layer.backgroundColor = [[NSColor yellowColor] colorWithAlphaComponent:0.25].CGColor;
    }
    

    
    return cellView;
} 


@end
