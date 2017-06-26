//
//  CCFavoritePlayersRouter.h
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 06.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCRouter.h"
#import "CCFavoritePlayersRouterProtocol.h"
#import "CCFavoritePlayersViewProtocol.h"

@interface CCFavoritePlayersRouter : CCRouter <CCFavoritePlayersRouterProtocol>

- (id <CCFavoritePlayersViewProtocol>)buildModule;

@end
