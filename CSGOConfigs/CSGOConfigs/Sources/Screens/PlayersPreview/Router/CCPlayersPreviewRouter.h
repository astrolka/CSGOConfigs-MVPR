//
//  CCPlayersPreviewRouter.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 14.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCRouter.h"
#import "CCPlayersPreviewRouterProtocol.h"
#import "CCPlayersPreviewViewProtocol.h"
#import "CCOpenSideMenuRouterProtocol.h"

@interface CCPlayersPreviewRouter : CCRouter <CCPlayersPreviewRouterProtocol, CCOpenSideMenuRouterProtocol>

- (id <CCPlayersPreviewViewProtocol>)buildPlayersPreviewModule;

@end
