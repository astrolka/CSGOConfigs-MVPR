//
//  CCBannerRouter.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 18.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCRouter.h"
#import "CCBannerRouterProtocol.h"
#import "CCBannerViewProtocol.h"
@class UIView;

@interface CCBannerRouter : CCRouter <CCBannerRouterProtocol>

- (UIView <CCBannerViewProtocol> *)buildBannerModule;

@end
