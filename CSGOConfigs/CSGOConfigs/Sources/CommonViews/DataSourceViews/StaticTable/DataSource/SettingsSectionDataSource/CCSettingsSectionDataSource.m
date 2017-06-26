//
//  CCSettingsSectionDataSource.m
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 24.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCSettingsSectionDataSource.h"
#import "CCSettingsRowDataSource.h"

@interface CCSettingsSectionDataSource ()

@property (nonatomic, strong, readwrite) NSMutableArray <CCSettingsRowDataSource*> *rows;

@end

@implementation CCSettingsSectionDataSource

- (instancetype)initWithRows:(NSArray<CCSettingsRowDataSource *> *)rows {
    self = [super init];
    if (self) {
        self.headerHeight = 20.f;
        self.footerHeight = 0.f;
        self.rows = [[NSMutableArray alloc] initWithArray:rows];
    }
    return self;
}

- (void)addRows:(NSArray <CCSettingsRowDataSource *> *)rows {
    [self.rows addObjectsFromArray:rows];
}

- (void)removeRowAtIndex:(NSUInteger)index {
    if (self.rows.count > index) {
        NSAssert(index, @"Out of range");
    }
    [self.rows removeObjectAtIndex:index];
}

@end
