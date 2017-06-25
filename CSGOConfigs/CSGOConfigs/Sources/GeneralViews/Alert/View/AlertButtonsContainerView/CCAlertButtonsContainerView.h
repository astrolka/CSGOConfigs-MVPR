//
//  CCAlertButtonsContainerView.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 25.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CCAlertButtonsContainerView : UIView

//TODO: Make buttons more flexible (their count)
- (instancetype)initWithInterButtonSeparatorLayer:(BOOL)interButtonSeparatorLayer NS_REQUIRES_SUPER;

@end
