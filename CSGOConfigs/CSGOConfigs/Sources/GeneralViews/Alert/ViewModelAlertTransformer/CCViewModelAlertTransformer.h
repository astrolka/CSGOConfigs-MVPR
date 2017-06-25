//
//  CCViewModelAlertTransformer.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 25.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CCViewModelAlert;
@class UIViewController;

@interface CCViewModelAlertTransformer : NSObject

+ (UIViewController *)alertControllerFromViewModelAlert:(CCViewModelAlert *)viewModel;

@end
