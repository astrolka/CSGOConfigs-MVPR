//
//  CCSettingsView.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 24.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CCSettingsDataSource.h"

@interface CCSettingsView : UIView

@property (nonatomic, strong, readonly) UITableView *tableView;

- (instancetype)initWithDataSource:(CCSettingsDataSource *)dataSource;

- (void)updateDataSource:(CCSettingsDataSource *)dataSource;

@end
