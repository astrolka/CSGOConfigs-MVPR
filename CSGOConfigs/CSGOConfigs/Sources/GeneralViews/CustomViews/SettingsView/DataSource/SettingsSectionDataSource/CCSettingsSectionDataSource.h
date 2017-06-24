//
//  CCSettingsSectionDataSource.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 24.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CGBase.h>
@class CCSettingsRowDataSource;

@interface CCSettingsSectionDataSource : NSObject

- (instancetype)initWithRows:(NSArray <CCSettingsRowDataSource *>*)rows;

@property (nonatomic, strong, readonly) NSMutableArray <CCSettingsRowDataSource*> *rows;
@property (nonatomic, strong) NSString *headerTitle;
@property (nonatomic, strong) NSString *footerTitle;
@property (nonatomic, assign) CGFloat headerHeight; // 20 by defaults
@property (nonatomic, assign) CGFloat footerHeight; // 0 by defaults

- (void)addRows:(NSArray <CCSettingsRowDataSource *> *)rows;
- (void)removeRowAtIndex:(NSUInteger)index;

@end
