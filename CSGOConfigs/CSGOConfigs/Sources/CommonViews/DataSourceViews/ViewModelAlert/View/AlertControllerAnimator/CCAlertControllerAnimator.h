//
//  CCAlertControllerAnimator.h
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 25.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CCAlertControllerAnimator : NSObject <UIViewControllerAnimatedTransitioning>

@property (nonatomic, assign, getter=isPresenting) BOOL presenting;

@end
