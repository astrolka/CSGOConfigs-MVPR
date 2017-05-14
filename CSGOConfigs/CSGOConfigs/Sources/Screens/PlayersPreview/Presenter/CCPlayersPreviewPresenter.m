//
//  CCPlayersPreviewPresenter.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 14.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCPlayersPreviewPresenter.h"
#import "CCPlayersPreviewViewProtocol.h"
#import "CCPlayersPreviewRouterProtocol.h"

@interface CCPlayersPreviewPresenter () <CCPlayersPreviewViewActionProtocol>

@property (nonatomic, weak) id <CCPlayersPreviewViewProtocol> view;
@property (nonatomic, strong) id <CCPlayersPreviewRouterProtocol> router;

@end

@implementation CCPlayersPreviewPresenter

- (instancetype)initWithView:(id <CCPlayersPreviewViewProtocol>)view router:(id <CCPlayersPreviewRouterProtocol>)router {
    self = [super init];
    if (self) {
        self.view = view;
        self.view.viewAction = self;
        self.router = router;
    }
    return self;
}

#pragma mark - CCPlayersPreviewViewActionProtocol



@end
