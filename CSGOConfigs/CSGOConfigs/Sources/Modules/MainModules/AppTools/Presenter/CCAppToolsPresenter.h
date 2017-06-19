//
//  CCAppToolsPresenter.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 06.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol CCAppToolsViewProtocol;
@protocol CCAppToolsRouterProtocol;

@interface CCAppToolsPresenter : NSObject

- (instancetype)initWithView:(id <CCAppToolsViewProtocol>)view router:(id <CCAppToolsRouterProtocol>)router;

@end
