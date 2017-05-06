//
//  CCViewControllerProtocol.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 06.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CCViewControllerProtocol <NSObject>

- (void)showSpinder;

- (void)hideSpinder;

- (void)showNotificationWithText:(NSString *)message;

@end
