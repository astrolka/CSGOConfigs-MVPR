//
//  CCBannerRouter.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 18.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCBannerRouter.h"
#import "CCRouter+CCPlayerDescriptionScreen.h"
#import "CCBannerView.h"
#import "CCBannerPresenter.h"

@implementation CCBannerRouter

- (UIView <CCBannerViewProtocol> *)buildBannerModule {
    CCBannerView *view = [[CCBannerView alloc] initWithFrame:CGRectZero];
    CCBannerPresenter *presenter = [[CCBannerPresenter alloc] initWithView:view router:self];
    #pragma unused(presenter)
    return view;
}

#pragma mark - CCPlayerDescriptionRoutingProtocol

- (void)goToPlayerDescriptionScreenWithPlayerID:(NSUInteger)playerID {
    [self cc_goToPlayerDescriptionScreenWithPlayerID:playerID];
}

@end
