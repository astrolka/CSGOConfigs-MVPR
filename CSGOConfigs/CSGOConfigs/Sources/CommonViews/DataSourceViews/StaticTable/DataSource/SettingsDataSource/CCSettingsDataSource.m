//
//  CCSettingsDataSource.m
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 24.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCSettingsDataSource.h"
#import <UIKit/UITableView.h>
#import <UIKit/UITableViewCell.h>

@interface CCSettingsDataSource ()

@property (nonatomic, strong) NSMutableArray <CCSettingsSectionDataSource *> *sections;

@end

@implementation CCSettingsDataSource

- (instancetype)initWithSections:(NSArray <CCSettingsSectionDataSource *> *)sections {
    self = [super init];
    if (self) {
        self.sections = [[NSMutableArray alloc] initWithArray:sections];
    }
    return self;
}

- (void)addSections:(NSArray <CCSettingsSectionDataSource *> *)sections {
    [self.sections addObjectsFromArray:sections];
}

- (void)removeSectionAtIndex:(NSUInteger)index {
    if (self.sections.count > index) {
        NSAssert(index, @"Out of range");
    }
    [self.sections removeObjectAtIndex:index];
}

#pragma mark - CCSettingsView

- (NSInteger)numberOfSections {
    return self.sections.count;
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section {
    return self.sections[section].rows.count;
}

- (UITableViewCell *)cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CCSettingsSectionDataSource *section = self.sections[indexPath.section];
    CCSettingsRowDataSource *row = section.rows[indexPath.row];
    return row.tableViewCell;
}

- (NSString *)titleForHeaderInSection:(NSInteger)section {
    return self.sections[section].headerTitle;
}

- (NSString *)titleForFooterInSection:(NSInteger)section {
    return self.sections[section].footerTitle;
}

- (void)didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    CCSettingsSectionDataSource *section = self.sections[indexPath.section];
    CCSettingsRowDataSource *row = section.rows[indexPath.row];
    if (row.selectAction) {
        row.selectAction();
    }
}

- (CGFloat)heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    CCSettingsSectionDataSource *section = self.sections[indexPath.section];
    CCSettingsRowDataSource *row = section.rows[indexPath.row];
    return row.cellHeight;
}

- (CGFloat)heightForHeaderInSection:(NSInteger)section {
    return self.sections[section].headerHeight;
}

- (CGFloat)heightForFooterInSection:(NSInteger)section {
    return self.sections[section].footerHeight;
    
}

@end
