//
//  CCShareRoutingProtocol.h
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 25.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCShareInfo.h"

@protocol CCShareRoutingProtocol <NSObject>

- (void)openShareScreenWithShareInfo:(CCShareInfo *)shareInfo;

@end
