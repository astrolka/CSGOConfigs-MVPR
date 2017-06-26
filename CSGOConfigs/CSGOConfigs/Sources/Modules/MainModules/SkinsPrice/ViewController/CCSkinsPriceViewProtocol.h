//
//  CCSkinsPriceViewProtocol.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 06.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCMessageViewProtocol.h"
#import "CCSpinerViewProtocol.h"
#import "CCSkinViewModel.h"
@protocol CCSkinsPriceViewProtocol;

@protocol CCSkinsPriceViewActionProtocol <NSObject>

- (void)skinsPriceViewDidSet:(id <CCSkinsPriceViewProtocol>)view;

- (void)skinsPriceViewDidOpenMenu:(id <CCSkinsPriceViewProtocol>)view;

- (void)skinsPriceViewDidPressConnect:(id <CCSkinsPriceViewProtocol>)view;

@end

@protocol CCSkinsPriceViewProtocol <CCSpinerViewProtocol, CCMessageViewProtocol>

@property (nonatomic, strong) id <CCSkinsPriceViewActionProtocol> viewAction;

- (void)showNewSkin:(CCSkinViewModel *)skin;

- (void)connectionButtonEnabled:(BOOL)enabled;

@end
