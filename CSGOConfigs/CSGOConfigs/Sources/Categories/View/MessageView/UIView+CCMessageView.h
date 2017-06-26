//
//  UIView+CCMessageView.h
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 18.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIView (CCMessageView)

- (void)cc_showMessageWithText:(NSString *)text;

- (void)cc_showMessageWithText:(NSString *)text andHideAfterDelay:(CGFloat)seconds;

@end
