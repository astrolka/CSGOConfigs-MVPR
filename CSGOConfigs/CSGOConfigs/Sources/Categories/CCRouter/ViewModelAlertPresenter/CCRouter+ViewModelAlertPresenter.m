//
//  CCRouter+ViewModelAlertPresenter.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 25.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCRouter+ViewModelAlertPresenter.h"
#import "CCViewModelAlert.h"
#import "CCViewModelAlertTransformer.h"

@implementation CCRouter (ViewModelAlertPresenter)

- (void)cc_presentViewModelAlert:(CCViewModelAlert *)viewModelAlert {
    [self.navigationController.topViewController.view endEditing:YES];
    UIViewController *viewController = [CCViewModelAlertTransformer alertControllerFromViewModelAlert:viewModelAlert];
    [self.navigationController.topViewController presentViewController:viewController animated:YES completion:nil];
}

@end
