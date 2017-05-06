//
//  CCParentViewProtocol.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 03.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CCParentViewProtocol <NSObject>

- (void)showSpinder;

- (void)hideSpinder;

- (void)showNotificationWithText:(NSString *)message;

@end
