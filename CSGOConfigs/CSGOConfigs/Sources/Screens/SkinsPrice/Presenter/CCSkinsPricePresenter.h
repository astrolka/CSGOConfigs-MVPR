//
//  CCSkinsPricePresenter.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 06.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol CCSkinsPriceRouterProtocol;
@protocol CCSkinsPriceViewProtocol;

@interface CCSkinsPricePresenter : NSObject

- (instancetype)initWithView:(id <CCSkinsPriceViewProtocol>)view router:(id <CCSkinsPriceRouterProtocol>)router;

@end
