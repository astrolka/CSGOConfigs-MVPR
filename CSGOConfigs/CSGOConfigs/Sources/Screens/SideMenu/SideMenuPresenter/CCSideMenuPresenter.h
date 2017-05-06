//
//  CCSideMenuPresenter.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 05.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol CCSideMenuViewProtocol;
@protocol CCSideMenuRouterProtocol;

@interface CCSideMenuPresenter : NSObject

- (instancetype)initWithView:(id <CCSideMenuViewProtocol>)view router:(id <CCSideMenuRouterProtocol>)router;

@end
