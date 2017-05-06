//
//  CCMapEventsPresenter.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 06.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol CCMapEventsRouterProtocol;
@protocol CCMapEventsViewProtocol;

@interface CCMapEventsPresenter : NSObject

- (instancetype)initWithView:(id <CCMapEventsViewProtocol>)view router:(id <CCMapEventsRouterProtocol>)router;

@end
