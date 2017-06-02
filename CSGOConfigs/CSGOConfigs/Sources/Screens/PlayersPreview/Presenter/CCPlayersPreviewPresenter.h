//
//  CCPlayersPreviewPresenter.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 14.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol CCPlayersPreviewViewProtocol;
@protocol CCPlayersPreviewRouterProtocol;
@protocol CCOpenSideMenuRouterProtocol;

@interface CCPlayersPreviewPresenter : NSObject

- (instancetype)initWithView:(id <CCPlayersPreviewViewProtocol>)view router:(id <CCPlayersPreviewRouterProtocol, CCOpenSideMenuRouterProtocol>)router;

@end
