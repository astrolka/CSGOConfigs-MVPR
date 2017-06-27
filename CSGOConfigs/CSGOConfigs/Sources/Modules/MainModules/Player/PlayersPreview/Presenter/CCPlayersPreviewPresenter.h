//
//  CCPlayersPreviewPresenter.h
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 14.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCPlayersPreviewRouterProtocol.h"
#import "CCPlayersPreviewViewProtocol.h"
#import "CCPlayersServiceProtocol.h"

@interface CCPlayersPreviewPresenter : NSObject <CCPlayersPreviewViewActionProtocol>

- (instancetype)initWithView:(id <CCPlayersPreviewViewProtocol>)view router:(id <CCPlayersPreviewRouterProtocol>)router;

@property (nonatomic, strong) id <CCPlayersServiceProtocol> ioc_playersService;

@end
