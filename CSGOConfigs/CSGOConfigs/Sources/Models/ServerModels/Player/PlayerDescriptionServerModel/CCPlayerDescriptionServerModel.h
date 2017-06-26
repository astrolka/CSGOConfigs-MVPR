//
//  CCPlayerDescriptionServerModel.h
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 14.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCServerModelProtocol.h"

@interface CCPlayerDescriptionServerModel : NSObject <CCServerModelProtocol>

@property (nonatomic, assign, readonly) NSInteger playerID;
@property (nonatomic, strong, readonly) NSString *nickName;
@property (nonatomic, strong, readonly) NSString *name;
@property (nonatomic, strong, readonly) NSString *surname;
@property (nonatomic, strong, readonly) NSURL * profileImageURL;

@property (nonatomic, strong, readonly) NSString *teamName;
@property (nonatomic, strong, readonly) NSURL *teamImageURL;

@property (nonatomic, strong, readonly) NSURL *flagImageURL;
@property (nonatomic, strong, readonly) NSString *country;

@property (nonatomic, strong, readonly) NSURL *moreInfoURL;

@property (nonatomic, strong, readonly) NSString *mouse;
@property (nonatomic, strong, readonly) NSString *mousepad;
@property (nonatomic, strong, readonly) NSString *monitor;
@property (nonatomic, strong, readonly) NSString *keyboard;
@property (nonatomic, strong, readonly) NSString *headSet;

@property (nonatomic, strong, readonly) NSString *effectiveDPI;
@property (nonatomic, strong, readonly) NSString *gameResolution;
@property (nonatomic, strong, readonly) NSString *windowsSensitivity;
@property (nonatomic, strong, readonly) NSString *pollingRate;

@property (nonatomic, strong, readonly) NSURL *downloadURL;

@end
