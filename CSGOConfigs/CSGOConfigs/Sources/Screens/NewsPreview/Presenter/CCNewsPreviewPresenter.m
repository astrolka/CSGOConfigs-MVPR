//
//  CCNewsPreviewPresenter.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 14.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCNewsPreviewPresenter.h"
#import "CCNewsPreviewRouterProtocol.h"
#import "CCNewsPreviewViewProtocol.h"

@interface CCNewsPreviewPresenter () <CCNewsPreviewViewActionProtocol>

@property (nonatomic, weak) id <CCNewsPreviewViewProtocol> view;
@property (nonatomic, strong) id <CCNewsPreviewRouterProtocol> router;

@end

@implementation CCNewsPreviewPresenter

- (instancetype)initWithView:(id <CCNewsPreviewViewProtocol>)view router:(id <CCNewsPreviewRouterProtocol>)router {
    self = [super init];
    if (self) {
        self.view = view;
        self.view.viewAction = self;
        self.router = router;
    }
    return self;
}

#pragma mark - CCNewsPreviewViewActionProtocol

@end
