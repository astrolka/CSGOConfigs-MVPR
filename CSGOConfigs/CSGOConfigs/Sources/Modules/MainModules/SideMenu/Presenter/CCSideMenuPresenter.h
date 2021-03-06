//
//  CCSideMenuPresenter.h
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 05.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol CCSideMenuRouterProtocol;
@protocol CCSideMenuViewProtocol;

@interface CCSideMenuPresenter : NSObject

- (instancetype)initWithView:(id <CCSideMenuViewProtocol>)view router:(id <CCSideMenuRouterProtocol>)router;

@end
