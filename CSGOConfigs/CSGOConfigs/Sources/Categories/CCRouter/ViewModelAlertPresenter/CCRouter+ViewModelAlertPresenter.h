//
//  CCRouter+ViewModelAlertPresenter.h
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 25.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCRouter.h"
@class CCViewModelAlert;

@interface CCRouter (ViewModelAlertPresenter)

- (void)cc_presentViewModelAlert:(CCViewModelAlert *)viewModelAlert;

@end
