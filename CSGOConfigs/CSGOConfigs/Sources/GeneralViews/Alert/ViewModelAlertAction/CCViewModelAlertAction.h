//
//  CCViewModelAlertAction.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 25.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, CCViewModelAlertActionStyle) {
    CCViewModelAlertActionStyleDefault,  // by default
    CCViewModelAlertActionStyleDestructive,
    CCViewModelAlertActionStyleBold,
    CCViewModelAlertActionStyleCancel,
};

typedef void(^CCViewModelAlertActionBlock)();

@interface CCViewModelAlertAction : NSObject

- (instancetype)initWithTitle:(NSString *)title action:(CCViewModelAlertActionBlock)action;

@property (nonatomic, assign) CCViewModelAlertActionStyle style;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) CCViewModelAlertActionBlock action;

+ (instancetype)cancelActionWithAction:(CCViewModelAlertActionBlock)action;

@end
