//
//  CCWebRouterProtocol.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 20.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CCWebRouterProtocol <NSObject>

- (void)goToWebScreenWithURL:(NSURL *)url;

@end
