//
//  CCOpenURLServiceProtocol.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 24.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AppleGuice/AppleGuiceInjectable.h>
#import "CCEmailInfo.h"

@protocol CCOpenURLServiceProtocol <AppleGuiceInjectable>

- (void)openWebURL:(NSURL *)url;

- (void)promtCallTo:(NSString *)number;

- (void)openApplicationSettings;

- (void)launchAppleEmailWithEmailInfo:(CCEmailInfo *)emailInfo;

@end
