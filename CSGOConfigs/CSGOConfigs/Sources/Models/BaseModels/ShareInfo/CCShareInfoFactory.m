//
//  CCShareInfoFactory.m
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 25.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCShareInfoFactory.h"
#import <UIKit/UIImage.h>

@implementation CCShareInfoFactory

+ (CCShareInfo *)appShareInfo {
    CCShareInfo *shareInfo = [[CCShareInfo alloc] init];
    shareInfo.title = NSLocalizedString(@"", nil);
    shareInfo.image = [UIImage imageNamed:@"whiteAppIcon"];
    shareInfo.url = [NSURL URLWithString:@""];
    return shareInfo;
}

@end
