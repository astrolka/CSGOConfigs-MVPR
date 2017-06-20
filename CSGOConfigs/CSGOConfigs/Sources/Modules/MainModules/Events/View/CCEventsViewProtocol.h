//
//  CCEventsViewProtocol.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 21.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCEventViewModel.h"
#import "CCAnnotationEventViewModel.h"
@protocol CCEventsViewProtocol;

@protocol CCEventsViewActionProtocol <NSObject>

- (void)eventsViewDidSet:(id <CCEventsViewProtocol>)view;

- (void)eventsViewDidOpenMenu:(id <CCEventsViewProtocol>)view;

- (void)eventsViewDidRefreshEvents:(id <CCEventsViewProtocol>)view;

- (void)eventsView:(id <CCEventsViewProtocol>)view didSelectEventAtIndex:(NSUInteger)index;

@end

@protocol CCEventsViewProtocol <NSObject>

@property (nonatomic, strong) id <CCEventsViewActionProtocol> viewAction;

- (void)showListEvents:(NSArray <CCEventViewModel *> *)events;

- (void)showMapEvents:(NSArray <CCAnnotationEventViewModel *> *)events;

@end
