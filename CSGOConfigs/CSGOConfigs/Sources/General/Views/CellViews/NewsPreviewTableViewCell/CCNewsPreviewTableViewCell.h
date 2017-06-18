//
//  CCNewsPreviewTableViewCell.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 18.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CCNewsPreviewViewModel;

@interface CCNewsPreviewTableViewCell : UITableViewCell

@property (nonatomic, strong) CCNewsPreviewViewModel *news;

- (void)updateImageViewCellOffset;

@end
