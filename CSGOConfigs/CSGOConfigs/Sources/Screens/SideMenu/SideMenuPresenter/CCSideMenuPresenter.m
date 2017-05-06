//
//  CCSideMenuPresenter.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 05.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCSideMenuPresenter.h"
#import "CCSideMenuViewProtocol.h"
#import "CCSideMenuRouterProtocol.h"

@interface CCSideMenuPresenter ()

@property (nonatomic, weak) id <CCSideMenuViewProtocol> view;
@property (nonatomic, strong) id <CCSideMenuRouterProtocol> router;

@end

@implementation CCSideMenuPresenter

- (instancetype)initWithView:(id <CCSideMenuViewProtocol>)view router:(id <CCSideMenuRouterProtocol>)router {
    
    self = [super init];
    if (self) {
        self.view = view;
        self.router = router;
    }
    return self;
}

@end
