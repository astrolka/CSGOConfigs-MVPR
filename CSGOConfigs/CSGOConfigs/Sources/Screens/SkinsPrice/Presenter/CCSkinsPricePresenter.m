//
//  CCSkinsPricePresenter.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 06.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCSkinsPricePresenter.h"
#import "CCSkinsPriceViewProtocol.h"
#import "CCSkinsPriceRouterProtocol.h"

@interface CCSkinsPricePresenter () <CCSkinsPriceViewActionProtocol>

@property (nonatomic, weak) id <CCSkinsPriceViewProtocol> view;
@property (nonatomic, strong) id <CCSkinsPriceRouterProtocol> router;

@end

@implementation CCSkinsPricePresenter

- (instancetype)initWithView:(id <CCSkinsPriceViewProtocol>)view router:(id <CCSkinsPriceRouterProtocol>)router {
    self = [super init];
    if (self) {
        self.view = view;
        self.view.viewAction = self;
        self.router = router;
    }
    return self;
}

#pragma mark - CCSkinsPriceViewActionProtocol

@end
