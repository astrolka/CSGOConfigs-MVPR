//
//  CCPlayerDescriptionRouter.h
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 11.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCRouter.h"
#import "CCPlayerDescriptionRouterProtocol.h"
@class UINavigationController;

@interface CCPlayerDescriptionRouter : CCRouter <CCPlayerDescriptionRouterProtocol>

- (void)goToPlayerDescriptionScreenWithPlayerID:(NSUInteger)playerID;

@end
