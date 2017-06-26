//
//  CCNewsDescriptionServerModel.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 14.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCServerModelProtocol.h"
#import "CCNewsDescriptionContentServerModel.h"

@interface CCNewsDescriptionServerModel : NSObject <CCServerModelProtocol>

@property (nonatomic, assign, readonly) NSInteger newsID;
@property (nonatomic, strong, readonly) NSString *subtitle;
@property (nonatomic, strong, readonly) NSDate *date;
@property (nonatomic, strong, readonly) NSString *author;
@property (nonatomic, strong, readonly) NSURL *descriptionURL;
@property (nonatomic, strong, readonly) NSArray <CCNewsDescriptionContentServerModel *> *content;

@end
