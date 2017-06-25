//
//  CCShareInfo.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 25.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCShareInfo.h"

@implementation CCShareInfo

- (NSArray *)objectsToShareInArray {
    NSMutableArray *shareObjects = [[NSMutableArray alloc] init];
    !(self.title) ?: [shareObjects addObject:self.title];
    !(self.image) ?: [shareObjects addObject:self.image];
    !(self.url) ?: [shareObjects addObject:self.url];
    return shareObjects;
}

@end
