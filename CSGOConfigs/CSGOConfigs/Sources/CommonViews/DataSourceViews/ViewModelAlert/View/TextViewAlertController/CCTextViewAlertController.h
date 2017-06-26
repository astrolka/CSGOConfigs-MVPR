//
//  CCTextViewAlertController.h
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 25.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CCViewModelAlertAction;

@interface CCTextViewAlertController : UIViewController

//TODO: Make count of buttons more flexible
@property (nonatomic, strong) CCViewModelAlertAction *leftButtonAction;
@property (nonatomic, strong) CCViewModelAlertAction *rightButtonAction;

@property (nonatomic, copy) NSString *alertTitle;
@property (nonatomic, copy) NSString *alertText;
@property (nonatomic, copy) NSAttributedString *attributedAlertText;

@end
