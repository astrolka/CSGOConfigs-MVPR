//
//  CCNewsDescriptionRouter.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 18.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCRouter.h"
#import "CCNewsDescriptionRouterProtocol.h"

@interface CCNewsDescriptionRouter : CCRouter <CCNewsDescriptionRouterProtocol>

- (void)goToNewsDescriptionScreenWithNewsID:(NSInteger)newsID;

@end
