//
//  CCMailScreenRoutingProtocol.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 24.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCEmailInfo.h"

typedef NS_ENUM(NSInteger, CCMailResult) {
    CCMailResultCancelled,
    CCMailResultSaved,
    CCMailResultSent,
    CCMailResultFailed,
    CCMailResultNoAccount
};

typedef void(^mailResultBlock)(CCMailResult result);

@protocol CCMailScreenRoutingProtocol <NSObject>

- (void)openEmailScreenWithEmailInfo:(CCEmailInfo *)emailInfo withResult:(mailResultBlock)result;

@end
