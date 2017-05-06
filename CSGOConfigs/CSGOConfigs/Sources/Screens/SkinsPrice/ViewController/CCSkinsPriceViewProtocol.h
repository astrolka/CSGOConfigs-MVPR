//
//  CCSkinsPriceViewProtocol.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 06.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCViewControllerProtocol.h"

@protocol CCSkinsPriceViewActionProtocol <NSObject>


@end

@protocol CCSkinsPriceViewProtocol <CCViewControllerProtocol>

@property (nonatomic, strong) id <CCSkinsPriceViewActionProtocol> viewAction;

@end
