//
//  CCNewsDescriptionHeaderView.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 19.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CCNewsDescriptionViewModel;
@class CCNewsDescriptionHeaderView;

typedef void(^pressDesscriptionBlock)(CCNewsDescriptionHeaderView *newsDescriptionHeaderView);

@interface CCNewsDescriptionHeaderView : UITableViewHeaderFooterView

@property (nonatomic, copy) pressDesscriptionBlock pressDescriptionButton;

@property (nonatomic, strong) CCNewsDescriptionViewModel *newsDescriptionViewModel;

@end
