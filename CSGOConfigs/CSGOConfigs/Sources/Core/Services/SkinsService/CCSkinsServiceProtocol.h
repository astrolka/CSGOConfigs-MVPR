//
//  CCSkinsServiceProtocol.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 21.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AppleGuice/AppleGuiceInjectable.h>
#import "CCSkinViewModel.h"

typedef void(^skinPriceConnectedBlock)();
typedef void(^skinPriceDataBlock)(CCSkinViewModel *skinViewModel);
typedef void(^skinPriceErrorBlock)(NSError *error);

@protocol CCSkinsServiceProtocol <AppleGuiceInjectable>

- (void)subscribeForSkinPrices:(skinPriceConnectedBlock)connected receiveNewSkinPrice:(skinPriceDataBlock)skinPrice disconnect:(skinPriceErrorBlock)disconnect;

@end
