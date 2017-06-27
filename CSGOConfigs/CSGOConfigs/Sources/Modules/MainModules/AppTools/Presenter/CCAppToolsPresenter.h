//
//  CCAppToolsPresenter.h
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 06.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCAppToolsViewProtocol.h"
#import "CCAppToolsRouterProtocol.h"
#import "CCLocalStorageServiceProtocol.h"
#import "CCOpenURLServiceProtocol.h"

@interface CCAppToolsPresenter : NSObject <CCAppToolsViewActionProtocol>

- (instancetype)initWithView:(id <CCAppToolsViewProtocol>)view router:(id <CCAppToolsRouterProtocol>)router;

@property (nonatomic, weak) id <CCAppToolsViewProtocol> view;
@property (nonatomic, strong) id <CCAppToolsRouterProtocol> router;

@property (nonatomic, strong) id <CCLocalStorageServiceProtocol> ioc_localStorageService;
@property (nonatomic, strong) id <CCOpenURLServiceProtocol> ioc_openURLService;

@end

@interface CCAppToolsPresenter (Testing)

- (CCViewModelAlert *)noEmailAccountAlert;

@end
