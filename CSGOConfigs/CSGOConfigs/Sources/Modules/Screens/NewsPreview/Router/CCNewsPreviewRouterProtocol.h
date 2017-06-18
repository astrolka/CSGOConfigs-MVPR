//
//  CCNewsPreviewRouterProtocol.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 14.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCOpenSideMenuRouterProtocol.h"

@protocol CCNewsPreviewRouterProtocol <CCOpenSideMenuRouterProtocol>

- (void)goToNewsDescriptionScreenWithNewsID:(NSUInteger)newsID;

@end
