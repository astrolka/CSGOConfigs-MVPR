//
//  CCNewsPreviewServerModel.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 14.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCServerModelProtocol.h"

@interface CCNewsPreviewServerModel : NSObject <CCServerModelProtocol>

@property (nonatomic, strong, readonly) NSString *title;
@property (nonatomic, assign, readonly) NSInteger newsID;
@property (nonatomic, strong, readonly) NSURL *imageURL;

@end
