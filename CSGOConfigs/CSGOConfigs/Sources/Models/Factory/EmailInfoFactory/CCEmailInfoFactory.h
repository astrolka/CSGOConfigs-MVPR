//
//  CCEmailInfoFactory.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 24.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCEmailInfo.h"
@class CCPlayerDescriptionViewModel;

@interface CCEmailInfoFactory : NSObject

+ (CCEmailInfo *)emailInfoWihtPlayer:(CCPlayerDescriptionViewModel *)player;

+ (CCEmailInfo *)emailInfoForContactWithDeveloper;

@end
