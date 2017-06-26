//
//  CCRouter.h
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 06.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UINavigationController.h>

@interface CCRouter : NSObject

@property (nonatomic, weak) UINavigationController *navigationController;

- (instancetype)initWithNavigationController:(UINavigationController *)navigationController;

@end
