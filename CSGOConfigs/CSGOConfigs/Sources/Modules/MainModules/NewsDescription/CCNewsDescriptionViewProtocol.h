//
//  CCNewsDescriptionViewProtocol.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 18.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCNewsDescriptionViewModel.h"
#import "CCMessageViewProtocol.h"
#import "CCSpinerViewProtocol.h"
@protocol CCNewsDescriptionViewProtocol;

@protocol CCNewsDescriptionViewActionProtocol <NSObject>

- (void)newsDescriptionViewDidSet:(id <CCNewsDescriptionViewProtocol>)view;

- (void)newsDescriptionViewDidPressMoreInfoButton:(id <CCNewsDescriptionViewProtocol>)view;

@end

@protocol CCNewsDescriptionViewProtocol <CCSpinerViewProtocol, CCMessageViewProtocol>

@property (nonatomic, strong) id <CCNewsDescriptionViewActionProtocol> viewAction;

- (void)showNewsDescription:(CCNewsDescriptionViewModel *)viewModel;

@end
