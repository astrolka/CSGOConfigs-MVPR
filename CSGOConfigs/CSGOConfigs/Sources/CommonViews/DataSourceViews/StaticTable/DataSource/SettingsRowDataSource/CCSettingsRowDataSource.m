//
//  CCSettingsRowDataSource.m
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 24.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCSettingsRowDataSource.h"
#import <UIKit/UITableViewCell.h>
#import "UIFont+CC.h"
#import "UIColor+CC.h"

@interface CCSettingsRowDataSource ()

@property (nonatomic, strong, readwrite) UITableViewCell *tableViewCell;

@end

@implementation CCSettingsRowDataSource

- (instancetype)initWithImage:(UIImage *)image title:(NSString *)title detail:(NSString *)detail {
    self = [super init];
    if (self) {
        self.image = image;
        self.title = title;
        self.detail = detail;
        [self tableViewCellSetup];
        self.cellHeight = 44.f;
    }
    return self;
}

- (void)tableViewCellSetup {
    self.tableViewCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:nil];
    self.tableViewCell.textLabel.text = self.title;
    self.tableViewCell.textLabel.font = [UIFont cc_regualarFontWithSize:16];
    self.tableViewCell.detailTextLabel.text = self.detail;
    self.tableViewCell.detailTextLabel.font = [UIFont cc_regualarFontWithSize:14];
    self.tableViewCell.imageView.image = self.image;
}

- (void)setImage:(UIImage *)image {
    _image = image;
    
    self.tableViewCell.imageView.image = image;
}

- (void)setTitle:(NSString *)title {
    _title = title;
    
    self.tableViewCell.textLabel.text = title;
}

- (void)setDetail:(NSString *)detail {
    _detail = detail;
    
    self.tableViewCell.detailTextLabel.text = detail;
}

@end
