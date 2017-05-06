//
//  CCSideMenuModel.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 06.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCSideMenuViewProtocol.h"
@class UIImage;

@interface CCSideMenuModel : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) UIImage *icon;
@property (nonatomic, assign) CCSideMenuViewAppSections appSection;

- (instancetype)initWithTitle:(NSString *)title icon:(UIImage *)icon appSection:(CCSideMenuViewAppSections)appSection;

@end
