//
//  CCNewsDescriptionContentServerModel.h
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 14.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCServerModelProtocol.h"

@interface CCNewsDescriptionContentServerModel : NSObject <CCServerModelProtocol>

@property (nonatomic, assign, readonly) BOOL isImage;
@property (nonatomic, strong, readonly) NSURL *coverImageURL;
@property (nonatomic, strong, readonly) NSString *text;

@end
