//
//  CCPlayerDescriptionRouterProtocol.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 11.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCViewModelAlertRoutingProtocol.h"
#import "CCMailScreenRoutingProtocol.h"
#import "CCWebRoutingProtocol.h"

@protocol CCPlayerDescriptionRouterProtocol <CCWebRoutingProtocol, CCMailScreenRoutingProtocol, CCViewModelAlertRoutingProtocol>

@end
