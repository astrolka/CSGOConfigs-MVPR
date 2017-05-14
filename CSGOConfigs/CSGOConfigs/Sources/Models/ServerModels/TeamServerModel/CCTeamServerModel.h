//
//  CCTeamServerModel.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 14.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCServerModelProtocol.h"
#import "CCPlayerPreviewServerModel.h"

@interface CCTeamServerModel : NSObject <CCServerModelProtocol>

@property (nonatomic, strong, readonly) NSString *name;
@property (nonatomic, strong, readonly) NSURL *imageURL;
@property (nonatomic, assign, readonly) NSInteger teamID;
@property (nonatomic, strong, readonly) NSArray <CCPlayerPreviewServerModel *> *players;

@end
