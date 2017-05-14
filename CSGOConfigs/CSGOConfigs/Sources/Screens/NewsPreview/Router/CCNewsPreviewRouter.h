//
//  CCNewsPreviewRouter.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 14.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCRouter.h"
#import "CCNewsPreviewRouterProtocol.h"
#import "CCNewsPreviewViewProtocol.h"

@interface CCNewsPreviewRouter : CCRouter <CCNewsPreviewRouterProtocol>

- (id <CCNewsPreviewViewProtocol>)buildNewsPreviewModule;

@end
