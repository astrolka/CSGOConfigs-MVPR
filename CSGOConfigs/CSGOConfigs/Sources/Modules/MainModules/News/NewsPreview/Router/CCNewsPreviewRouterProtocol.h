//
//  CCNewsPreviewRouterProtocol.h
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 14.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCOpenSideMenuRoutingProtocol.h"

@protocol CCNewsPreviewRouterProtocol <CCOpenSideMenuRoutingProtocol>

- (void)goToNewsDescriptionScreenWithNewsID:(NSUInteger)newsID;

@end
