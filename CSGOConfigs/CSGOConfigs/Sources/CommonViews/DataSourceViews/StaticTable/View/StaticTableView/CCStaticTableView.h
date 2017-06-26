//
//  CCStaticTableView.h
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 26.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CCSettingsDataSource;

/*
    Better API for working with static tableview
    No more switch hell
*/

@interface CCStaticTableView : UIView

@property (nonatomic, strong, readonly) UITableView *tableView;

- (instancetype)initWithDataSource:(CCSettingsDataSource *)dataSource;

- (void)updateDataSource:(CCSettingsDataSource *)dataSource;

@end
