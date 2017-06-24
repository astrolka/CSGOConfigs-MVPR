//
//  CCSettingsRowDataSource.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 24.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CGBase.h>
@class UITableViewCell;
@class UIImage;

@interface CCSettingsRowDataSource : NSObject

@property (nonatomic, strong, readonly) UITableViewCell *tableViewCell;

- (instancetype)initWithImage:(UIImage *)image title:(NSString *)title detail:(NSString *)detail;

@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *detail;
@property (nonatomic, assign) CGFloat cellHeight; // 44 by defaults

@property (nonatomic, assign) BOOL allowsSelection; // YES by defaults
@property (nonatomic, copy) void (^selectAction)();

@end
