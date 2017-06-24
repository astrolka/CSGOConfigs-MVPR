//
//  CCAppToolsViewProtocol.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 06.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCMessageViewProtocol.h"
@protocol CCAppToolsViewProtocol;

@protocol CCAppToolsViewActionProtocol <NSObject>

- (void)appToolsViewDidOpenMenu:(id <CCAppToolsViewProtocol>)view;

- (void)appToolsViewDidSelectClearCache:(id <CCAppToolsViewProtocol>)view;

- (void)appToolsViewDidSelectDonate:(id <CCAppToolsViewProtocol>)view;

- (void)appToolsViewDidSelectContactWithDeveloper:(id <CCAppToolsViewProtocol>)view;

- (void)appToolsViewDidSelectShareApp:(id <CCAppToolsViewProtocol>)view;

- (void)appToolsViewDidSelectRateApp:(id <CCAppToolsViewProtocol>)view;

@end

@protocol CCAppToolsViewProtocol <CCMessageViewProtocol>

@property (nonatomic, strong) id <CCAppToolsViewActionProtocol> viewAction;

- (void)updateAppCache:(NSString *)cache;

@end
