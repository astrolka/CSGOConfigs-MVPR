//
//  CCEventsViewProtocol.h
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 21.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCAnnotationEventViewModel.h"
#import "CCMessageViewProtocol.h"
#import "CCSpinerViewProtocol.h"
#import "CCEventViewModel.h"
@protocol CCEventsViewProtocol;

@protocol CCEventsViewActionProtocol <NSObject>

- (void)eventsViewDidSet:(id <CCEventsViewProtocol>)view;

- (void)eventsViewDidOpenMenu:(id <CCEventsViewProtocol>)view;

- (void)eventsViewDidRefreshEvents:(id <CCEventsViewProtocol>)view;

- (void)eventsView:(id <CCEventsViewProtocol>)view didSelectEventAtIndex:(NSUInteger)index;

@end

@protocol CCEventsViewProtocol <CCSpinerViewProtocol, CCMessageViewProtocol>

@property (nonatomic, strong) id <CCEventsViewActionProtocol> viewAction;

- (void)showEvents:(NSArray <CCEventViewModel *> *)events;

- (void)showAnnotationEvents:(NSArray <CCAnnotationEventViewModel *> *)annotations;

@end
