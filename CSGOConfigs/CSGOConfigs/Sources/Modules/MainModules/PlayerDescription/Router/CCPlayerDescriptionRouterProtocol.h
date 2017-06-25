//
//  CCPlayerDescriptionRouterProtocol.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 11.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCWebRoutingProtocol.h"
#import "CCMailScreenRoutingProtocol.h"
#import "CCViewModelAlertRoutingProtocol.h"

@protocol CCPlayerDescriptionRouterProtocol <CCWebRoutingProtocol, CCMailScreenRoutingProtocol, CCViewModelAlertRoutingProtocol>

@end
