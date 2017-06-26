//
//  CCRouter+CCPlayerDescriptionScreen.m
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 21.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCRouter+CCPlayerDescriptionScreen.h"
#import "CCPlayerDescriptionRouter.h"

@implementation CCRouter (CCPlayerDescriptionScreen)

- (void)cc_goToPlayerDescriptionScreenWithPlayerID:(NSUInteger)playerID {
    CCPlayerDescriptionRouter *router = [[CCPlayerDescriptionRouter alloc] initWithNavigationController:self.navigationController];
    [router goToPlayerDescriptionScreenWithPlayerID:playerID];
}

@end
