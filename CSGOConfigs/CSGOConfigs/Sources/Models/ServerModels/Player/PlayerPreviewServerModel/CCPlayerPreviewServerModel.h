//
//  CCPlayerPreviewServerModel.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 14.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCServerModelProtocol.h"

@interface CCPlayerPreviewServerModel : NSObject <CCServerModelProtocol>

@property (nonatomic, assign, readonly) NSString *nickName;
@property (nonatomic, assign, readonly) NSString *imageSize;
@property (nonatomic, assign, readonly) NSURL *imageURL;
@property (nonatomic, assign, readonly) NSInteger playerID;

@end
