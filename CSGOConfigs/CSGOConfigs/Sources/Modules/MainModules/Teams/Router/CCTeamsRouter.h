//
//  CCTeamsRouter.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 06.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCRouter.h"
#import "CCTeamsRouterProtocol.h"
#import "CCTeamsViewProtocol.h"

@interface CCTeamsRouter : CCRouter <CCTeamsRouterProtocol>

- (id <CCTeamsViewProtocol>)buildModule;

@end
