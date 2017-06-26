//
//  CCEventsPresenter.m
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 21.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCEventsPresenter.h"
#import "CCEventsServiceProtocol.h"
#import "CCEventsRouterProtocol.h"
#import "CCEventsViewProtocol.h"

@interface CCEventsPresenter () <CCEventsViewActionProtocol>

@property (nonatomic, strong) id <CCEventsServiceProtocol> ioc_eventsService;

@property (nonatomic, strong) id <CCEventsViewProtocol> view;
@property (nonatomic, strong) id <CCEventsRouterProtocol> router;

@property (nonatomic, strong) NSArray <CCEventViewModel *> *events;

@end

@implementation CCEventsPresenter

- (instancetype)initWithView:(id <CCEventsViewProtocol>)view router:(id <CCEventsRouterProtocol>)router {
    self = [super init];
    if (self) {
        self.router = router;
        self.view = view;
        self.view.viewAction = self;
    }
    return self;
}

#pragma mark - CCEventsViewActionProtocol

- (void)eventsViewDidSet:(id <CCEventsViewProtocol>)view {
    [self loadEventsWithSpiner:YES];
}

- (void)eventsViewDidOpenMenu:(id <CCEventsViewProtocol>)view {
    [self.router openSideMenu];
}

- (void)eventsViewDidRefreshEvents:(id <CCEventsViewProtocol>)view {
    [self loadEventsWithSpiner:NO];
}

- (void)eventsView:(id <CCEventsViewProtocol>)view didSelectEventAtIndex:(NSUInteger)index {
    CCEventViewModel *event = self.events[index];
    [self.router goToWebScreenWithURL:event.desctiptionURL];
}

#pragma mark - Private

- (void)loadEventsWithSpiner:(BOOL)spiner {
    if (spiner) {
        [self.view showSpiner];
    }
    [self.ioc_eventsService getEvents:^(NSArray<CCEventViewModel *> *events, NSArray<CCAnnotationEventViewModel *> *annotationEvents, BOOL fromServer) {
        self.events = events;
        [self.view showEvents:events];
        [self.view showAnnotationEvents:annotationEvents];
        [self.view hideSpiner];
        (fromServer) ?: [self.view showMessageWithText:NSLocalizedString(@"message.offline_mode", nil)];
    }];
}

@end
