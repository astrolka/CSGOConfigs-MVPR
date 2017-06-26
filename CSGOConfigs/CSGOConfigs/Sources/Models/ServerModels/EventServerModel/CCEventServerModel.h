//
//  CCEventServerModel.h
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 14.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCServerModelProtocol.h"
#import <CoreGraphics/CoreGraphics.h>

@interface CCEventServerModel : NSObject <CCServerModelProtocol>

@property (nonatomic, strong, readonly) NSString *name;
@property (nonatomic, strong, readonly) NSString *city;
@property (nonatomic, strong, readonly) NSURL *flagImageURL;
@property (nonatomic, strong, readonly) NSURL *desctiptionURL;
@property (nonatomic, strong, readonly) NSDate *beginDate;
@property (nonatomic, strong, readonly) NSDate *finishDate;
@property (nonatomic, strong, readonly) NSURL *logoImageURL;
@property (nonatomic, strong, readonly) NSString *prizePool;
@property (nonatomic, assign, readonly) NSInteger countOfTeams;
@property (nonatomic, assign, readonly) CGFloat lat;
@property (nonatomic, assign, readonly) CGFloat lng;

@end
