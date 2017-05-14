//
//  CCSkinServerModel.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 14.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>

@interface CCSkinServerModel : NSObject

@property (nonatomic, strong, readonly) NSString *gunName;
@property (nonatomic, strong, readonly) NSString *gunSkin;
@property (nonatomic, strong, readonly) NSString *exterior;
@property (nonatomic, assign, readonly) CGFloat price;
@property (nonatomic, strong, readonly) NSURL *coverImageURL;

- (instancetype)initWithServerResponce:(NSString *)serverResponce;

@end
