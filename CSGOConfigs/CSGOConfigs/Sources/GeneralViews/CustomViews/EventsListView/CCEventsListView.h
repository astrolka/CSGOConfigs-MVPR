//
//  CCEventsListView.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 21.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CCEventViewModel;
@class CCEventsListView;

@protocol CCEventsListViewActionProtocol <NSObject>

- (void)eventsListView:(CCEventsListView *)eventsListView didSelectEventAtIndex:(NSUInteger)index;

@end

@interface CCEventsListView : UIView

@property (nonatomic, strong) id <CCEventsListViewActionProtocol> viewAction;

- (void)showEvents:(NSArray <CCEventViewModel *> *)events;

@end
