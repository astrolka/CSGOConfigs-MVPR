//
//  CCBannerRouter.h
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 18.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCRouter.h"
#import "CCBannerRouterProtocol.h"
#import "CCBannerViewProtocol.h"
@class UIView;

@interface CCBannerRouter : CCRouter <CCBannerRouterProtocol>

- (UIView <CCBannerViewProtocol> *)buildModule;

@end
