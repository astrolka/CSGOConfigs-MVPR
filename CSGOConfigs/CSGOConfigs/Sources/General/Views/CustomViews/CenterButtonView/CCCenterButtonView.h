//
//  CCCenterButtonView.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 11.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CCCenterButtonView;

typedef void(^pressButtonBlock)(CCCenterButtonView *centerButtonView);

@interface CCCenterButtonView : UITableViewHeaderFooterView

@property (nonatomic, strong) NSString *buttonTitle;

@property (nonatomic, copy) pressButtonBlock pressButton;

@end
