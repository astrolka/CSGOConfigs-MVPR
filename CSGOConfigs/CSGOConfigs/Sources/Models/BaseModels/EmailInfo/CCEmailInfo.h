//
//  CCEmailInfo.h
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 24.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCRouter.h"

@interface CCEmailInfo : CCRouter

@property (nonatomic, strong) NSArray <NSString *> *recipients;
@property (nonatomic, strong) NSString *body;
@property (nonatomic, strong) NSString *subject;

@end
