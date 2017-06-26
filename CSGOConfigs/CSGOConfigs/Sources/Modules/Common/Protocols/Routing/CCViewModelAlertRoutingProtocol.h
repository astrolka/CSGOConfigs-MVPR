//
//  CCViewModelAlertRoutingProtocol.h
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 25.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCViewModelAlert.h"

@protocol CCViewModelAlertRoutingProtocol <NSObject>

- (void)showViewModelAlert:(CCViewModelAlert *)viewModelAlert;

@end
