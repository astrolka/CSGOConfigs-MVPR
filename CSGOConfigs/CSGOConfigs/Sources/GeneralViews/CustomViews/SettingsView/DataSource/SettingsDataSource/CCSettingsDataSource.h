//
//  CCSettingsDataSource.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 24.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CGBase.h>
#import "CCSettingsSectionDataSource.h"
#import "CCSettingsRowDataSource.h"
@class UITableViewCell;
@class UITableView;

@interface CCSettingsDataSource : NSObject

- (instancetype)initWithSections:(NSArray <CCSettingsSectionDataSource *> *)sections;

- (void)addSections:(NSArray <CCSettingsSectionDataSource *> *)sections;

- (void)removeSectionAtIndex:(NSUInteger)index;

/*
    Methods for CCSettingsView
*/

- (NSInteger)numberOfSections;

- (NSInteger)numberOfRowsInSection:(NSInteger)section;

- (UITableViewCell *)cellForRowAtIndexPath:(NSIndexPath *)indexPath;

- (NSString *)titleForHeaderInSection:(NSInteger)section;

- (NSString *)titleForFooterInSection:(NSInteger)section;

- (void)didSelectRowAtIndexPath:(NSIndexPath *)indexPath;

- (CGFloat)heightForRowAtIndexPath:(NSIndexPath *)indexPath;

- (CGFloat)heightForHeaderInSection:(NSInteger)section;

- (CGFloat)heightForFooterInSection:(NSInteger)section;

@end
