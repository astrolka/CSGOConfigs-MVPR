//
//  CCRouter+ShareActivityPresenter.h
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 25.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCRouter.h"
@class CCShareInfo;

@interface CCRouter (ShareActivityPresenter)

- (void)cc_presentShareActivityViewControllerWithShareInfo:(CCShareInfo *)shareInfo;

@end
