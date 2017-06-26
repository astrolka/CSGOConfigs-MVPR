//
//  CCPlayerPersonalInfoView.h
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 11.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CCPlayerPersonalInfoView;
@class CCPlayerDescriptionViewModel;

typedef void(^moreInfoButtonBlock)(CCPlayerPersonalInfoView *playerPersonalInfoView);

@interface CCPlayerPersonalInfoView : UITableViewHeaderFooterView

@property (nonatomic, copy) moreInfoButtonBlock moreInfoButton;

- (void)updateWithViewModel:(CCPlayerDescriptionViewModel *)viewModel;

@end
