//
//  CCPlayersPresenter.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 03.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol CCPlayersViewProtocol;
@protocol CCPlayersRouterProtocol;
@protocol CCPlayersViewAction;

@interface CCPlayersPresenter : NSObject

- (instancetype)initWithView:(id <CCPlayersViewProtocol>)view router:(id <CCPlayersRouterProtocol>)router;

@end
