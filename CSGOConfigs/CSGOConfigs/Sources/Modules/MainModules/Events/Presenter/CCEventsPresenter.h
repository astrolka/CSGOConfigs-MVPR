//
//  CCEventsPresenter.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 21.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol CCEventsRouterProtocol;
@protocol CCEventsViewProtocol;

@interface CCEventsPresenter : NSObject

- (instancetype)initWithView:(id <CCEventsViewProtocol>)view router:(id <CCEventsRouterProtocol>)router;

@end
