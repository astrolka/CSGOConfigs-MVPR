//
//  CCAppToolsRouterProtocol.h
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 06.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCViewModelAlertRoutingProtocol.h"
#import "CCOpenSideMenuRoutingProtocol.h"
#import "CCMailScreenRoutingProtocol.h"
#import "CCShareRoutingProtocol.h"

@protocol CCAppToolsRouterProtocol <CCOpenSideMenuRoutingProtocol, CCMailScreenRoutingProtocol, CCViewModelAlertRoutingProtocol, CCShareRoutingProtocol>

@end
