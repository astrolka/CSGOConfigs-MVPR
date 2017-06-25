//
//  CCRouter+CCShareActivityPresenter.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 25.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCRouter.h"
@class CCShareInfo;

@interface CCRouter (CCShareActivityPresenter)

- (void)cc_presentShareActivityViewControllerWithShareInfo:(CCShareInfo *)shareInfo;

@end
