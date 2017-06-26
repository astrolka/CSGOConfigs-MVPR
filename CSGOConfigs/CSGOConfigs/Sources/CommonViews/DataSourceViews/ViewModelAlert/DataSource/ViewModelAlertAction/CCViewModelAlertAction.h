//
//  CCViewModelAlertAction.h
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 25.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, CCViewModelAlertActionStyle) {
    CCViewModelAlertActionStyleDefault,  // by default
    CCViewModelAlertActionStyleDestructive,
    CCViewModelAlertActionStyleCancel,
};

typedef void(^CCViewModelAlertActionBlock)();

@interface CCViewModelAlertAction : NSObject

- (instancetype)initWithTitle:(NSString *)title action:(CCViewModelAlertActionBlock)action;

@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) CCViewModelAlertActionStyle style;
@property (nonatomic, copy) CCViewModelAlertActionBlock action;

+ (instancetype)cancelActionWithAction:(CCViewModelAlertActionBlock)action;

@end
