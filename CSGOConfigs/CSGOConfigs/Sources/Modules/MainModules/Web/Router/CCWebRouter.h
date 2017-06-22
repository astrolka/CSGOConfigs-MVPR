//
//  CCWebRouter.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 22.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCRouter.h"
#import "CCWebRouterProtocol.h"

@interface CCWebRouter : CCRouter <CCWebRouterProtocol>

- (void)gotToWebScreenWithURL:(NSURL *)url;

@end
