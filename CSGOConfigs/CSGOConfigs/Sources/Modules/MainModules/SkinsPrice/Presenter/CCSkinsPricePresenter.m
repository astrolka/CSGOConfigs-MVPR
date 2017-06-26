//
//  CCSkinsPricePresenter.m
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 06.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCSkinsPricePresenter.h"
#import "CCSkinsPriceRouterProtocol.h"
#import "CCSkinsPriceViewProtocol.h"
#import "CCSkinsServiceProtocol.h"

@interface CCSkinsPricePresenter () <CCSkinsPriceViewActionProtocol>

@property (nonatomic, strong) id <CCSkinsServiceProtocol> ioc_skinsService;

@property (nonatomic, strong) id <CCSkinsPriceViewProtocol> view;
@property (nonatomic, strong) id <CCSkinsPriceRouterProtocol> router;

@end

@implementation CCSkinsPricePresenter

- (instancetype)initWithView:(id <CCSkinsPriceViewProtocol>)view router:(id <CCSkinsPriceRouterProtocol>)router {
    self = [super init];
    if (self) {
        self.router = router;
        self.view = view;
        self.view.viewAction = self;
    }
    return self;
}

#pragma mark - CCSkinsPriceViewActionProtocol

- (void)skinsPriceViewDidSet:(id <CCSkinsPriceViewProtocol>)view {
    [self subscribeForSkinPrices];
}

- (void)skinsPriceViewDidOpenMenu:(id <CCSkinsPriceViewProtocol>)view {
    [self.router openSideMenu];
}

- (void)skinsPriceViewDidPressConnect:(id <CCSkinsPriceViewProtocol>)view {
    [self subscribeForSkinPrices];
}

#pragma mark - Private

- (void)subscribeForSkinPrices {
    [self.view showSpiner];
    [self.view connectionButtonEnabled:NO];
    
    [self.ioc_skinsService subscribeForSkinPrices:^{
        [self.view showMessageWithText:NSLocalizedString(@"skis.connect.message", nil)];
        [self.view hideSpiner];
        
    } receiveNewSkinPrice:^(CCSkinViewModel *skin) {
        [self.view showNewSkin:skin];
        
    } disconnect:^(NSError *error) {
        [self.view connectionButtonEnabled:YES];
        [self.view showMessageWithText:NSLocalizedString(@"skis.disconnect.message", nil)];
    }];
}

@end
