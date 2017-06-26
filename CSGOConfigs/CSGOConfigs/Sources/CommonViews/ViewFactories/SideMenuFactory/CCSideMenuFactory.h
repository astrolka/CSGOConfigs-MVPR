//
//  CCSideMenuFactory.h
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 02.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
@class UIBarButtonItem;

@interface CCSideMenuFactory : NSObject

+ (UIBarButtonItem *)menuBarButtonWithSelector:(SEL)selector forObject:(id)object;

@end
