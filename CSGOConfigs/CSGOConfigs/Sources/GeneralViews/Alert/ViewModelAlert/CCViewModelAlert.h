//
//  CCViewModelAlert.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 25.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCViewModelAlertAction.h"

/*
    Allow you work with Alers in presenters
    A Presenter build a ViewModelAlert with his own logic (without UI)
    Calls router show it
    In a Router ViewModelAlertTransformer transforms ViewModelAlert to UIViewController
    The Router shows transformed UIViewController
 
    CCViewModelAlertStyleHTML - custom view which looks like alert
*/

typedef NS_ENUM(NSInteger, CCViewModelAlertStyle) {
    CCViewModelAlertStyleAlert, // by default
    CCViewModelAlertStyleActionSheet,
    CCViewModelAlertStyleHTML
};

@interface CCViewModelAlert : NSObject

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message;

@property (nonatomic, assign) CCViewModelAlertStyle style;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong, readonly) NSMutableArray <CCViewModelAlertAction *> *actions;

- (void)addAction:(CCViewModelAlertAction *)action;

@end
