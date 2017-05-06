//
//  CCNewsPresenter.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 06.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol CCNewsRouterProtocol;
@protocol CCNewsViewProtocol;

@interface CCNewsPresenter : NSObject

- (instancetype)initWithView:(id <CCNewsViewProtocol>)view router:(id <CCNewsRouterProtocol>)router;

@end
