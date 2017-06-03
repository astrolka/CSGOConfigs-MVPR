//
//  UIViewController+CCMessageView.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 03.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIViewController (CCMessageView)

- (void)cc_showMessageWithText:(NSString *)text;

- (void)cc_showMessageWithText:(NSString *)text andHideAfterDelay:(CGFloat)seconds;

@end
