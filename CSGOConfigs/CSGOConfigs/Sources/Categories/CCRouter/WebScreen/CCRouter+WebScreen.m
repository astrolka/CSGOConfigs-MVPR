//
//  CCRouter+WebScreen.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 21.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCRouter+WebScreen.h"
#import "CCWebRouter.h"

@implementation CCRouter (WebScreen)

- (void)cc_goToWebScreenWithURL:(NSURL *)url {
    CCWebRouter *webRouter = [[CCWebRouter alloc] initWithNavigationController:self.navigationController];
    [webRouter gotToWebScreenWithURL:url];
}

@end
