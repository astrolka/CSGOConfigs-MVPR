//
//  CCViewModelAlertTransformer.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 25.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCViewModelAlertTransformer.h"
#import <UIKit/UIKit.h>
#import "CCViewModelAlert.h"
#import "CCTextViewAlertController.h"
#import "CCAlertControllerAnimator.h"

typedef NS_ENUM(NSInteger, CCViewModelAlertButtonPosition) {
    CCViewModelAlertButtonPositionRight,
    CCViewModelAlertButtonPositionLeft
};

@implementation CCViewModelAlertTransformer

#pragma mark - Public

+ (UIViewController *)alertControllerFromViewModelAlert:(CCViewModelAlert *)viewModel {
    switch (viewModel.style) {
        case CCViewModelAlertStyleAlert:
        case CCViewModelAlertStyleActionSheet: {
            return [self standardAlertControllerForViewModel:viewModel];
            break;
        }
        case CCViewModelAlertStyleHTML: {
            return [self textViewAlertControllerForViewModel:viewModel];
            break;
        }
    }
}

#pragma mark - Private

+ (UIViewController *)standardAlertControllerForViewModel:(CCViewModelAlert *)viewModel {
    UIAlertControllerStyle style = [self alertControllerStyleFromViewModelAlertStyle:viewModel.style];
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:viewModel.title message:viewModel.message preferredStyle:style];
    [viewModel.actions enumerateObjectsUsingBlock:^(CCViewModelAlertAction *action, NSUInteger idx, BOOL * _Nonnull stop) {
        UIAlertActionStyle alertActionStyle = [self alertActionStyleFromViewModelActionStyle:action.style];
        UIAlertAction *alertAction = [UIAlertAction actionWithTitle:action.title style:alertActionStyle handler:^(UIAlertAction * _Nonnull obj) {
            if (action.action) {
                action.action();
            }
        }];
        [alertController addAction:alertAction];
    }];
    return alertController;
}

+ (UIViewController *)textViewAlertControllerForViewModel:(CCViewModelAlert *)viewModel {
    NSAssert(viewModel.actions.count <= 2, @"Alert supports up to 2 actions");
    
    CCTextViewAlertController *alertController = [[CCTextViewAlertController alloc] init];
    alertController.alertTitle = viewModel.title;
    NSMutableAttributedString* attributedString = [[NSMutableAttributedString alloc] initWithData: [viewModel.message ?: @"" dataUsingEncoding:NSUnicodeStringEncoding]
                                                                                          options: @{ NSDocumentTypeDocumentAttribute: NSHTMLTextDocumentType }
                                                                               documentAttributes: nil
                                                                                            error: nil];
    alertController.attributedAlertText = [attributedString copy];
    switch (viewModel.actions.count) {
        case CCViewModelAlertButtonPositionRight: {
            CCViewModelAlertAction *action = viewModel.actions[1];
            alertController.rightButtonAction = [self textViewAlertActionFromActionViewModel:action];
        }
        case CCViewModelAlertButtonPositionLeft: {
            CCViewModelAlertAction *action = viewModel.actions[0];
            alertController.leftButtonAction = [self textViewAlertActionFromActionViewModel:action];
            break;
        }
        default: break;
    }
    return alertController;
}

+ (CCViewModelAlertAction *)textViewAlertActionFromActionViewModel:(CCViewModelAlertAction *)viewModel {
    return [[CCViewModelAlertAction alloc] initWithTitle:viewModel.title action:viewModel.action];
}

+ (UIAlertActionStyle)alertActionStyleFromViewModelActionStyle:(CCViewModelAlertActionStyle)viewModelActionStyle {
    switch (viewModelActionStyle) {
        case CCViewModelAlertActionStyleDestructive:
            return UIAlertActionStyleDestructive;
            
        case CCViewModelAlertActionStyleCancel:
            return UIAlertActionStyleCancel;
            
        case CCViewModelAlertActionStyleDefault:
        default:
            return UIAlertActionStyleDefault;
    }
}

+ (UIAlertControllerStyle)alertControllerStyleFromViewModelAlertStyle:(CCViewModelAlertStyle)alertStyle {
    switch (alertStyle) {
        case CCViewModelAlertStyleActionSheet:
            return UIAlertControllerStyleActionSheet;
        default:
            return UIAlertControllerStyleAlert;
    }
}

@end
