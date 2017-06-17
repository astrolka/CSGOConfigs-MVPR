//
//  CCBannerPresenter.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 18.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol CCBannerViewProtocol;
@protocol CCBannerRouterProtocol;

@interface CCBannerPresenter : NSObject

- (instancetype)initWithView:(id <CCBannerViewProtocol>)view router:(id <CCBannerRouterProtocol>)router;

@end
