//
//  CCPlayersPreviewRouter.h
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 14.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCRouter.h"
#import "CCPlayersPreviewRouterProtocol.h"
#import "CCPlayersPreviewViewProtocol.h"

@interface CCPlayersPreviewRouter : CCRouter <CCPlayersPreviewRouterProtocol>

- (id <CCPlayersPreviewViewProtocol>)buildModule;

@end
