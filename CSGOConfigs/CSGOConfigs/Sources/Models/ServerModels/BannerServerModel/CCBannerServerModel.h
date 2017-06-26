//
//  CCBannerServerModel.h
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 14.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCServerModelProtocol.h"

@interface CCBannerServerModel : NSObject <CCServerModelProtocol>

@property (nonatomic, strong, readonly) NSDate *updateDate;
@property (nonatomic, strong, readonly) NSString *imageSize;
@property (nonatomic, strong, readonly) NSURL *imageURL;
@property (nonatomic, assign, readonly) NSInteger playerID;

@end
