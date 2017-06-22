//
//  CCSkinsService.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 21.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCSkinsService.h"
#import "CCWebSocketServiceProtocol.h"
#import "CCSkinServerModel.h"
#import "CCSkinViewModel.h"

@interface CCSkinsService ()

@property (nonatomic, strong) id <CCWebSocketServiceProtocol> ioc_webSocketService;

@end

@implementation CCSkinsService

#pragma mark - CCSkinsServiceProtocol

- (void)subscribeForSkinPrices:(skinPriceConnectedBlock)connected receiveNewSkinPrice:(skinPriceDataBlock)skinPrice disconnect:(skinPriceErrorBlock)disconnect {
    [self.ioc_webSocketService connectToURL:[NSURL URLWithString:@"wss://wsn.dota2.net/wsn/"] connect:^{
        if (connected) {
            connected();
        }
    } receiveNewMessage:^(NSString *responce) {
        CCSkinServerModel *serverModel = [[CCSkinServerModel alloc] initWithServerResponce:responce];
        [CCSkinViewModelBuilder buildWithServerModels:serverModel viewModel:^(CCSkinViewModel *viewModel) {
            if (skinPrice) {
                skinPrice(viewModel);
            }
        }];
    } disconnect:^(NSError *error) {
        if (disconnect) {
            disconnect(error);
        }
    }];
}

@end
