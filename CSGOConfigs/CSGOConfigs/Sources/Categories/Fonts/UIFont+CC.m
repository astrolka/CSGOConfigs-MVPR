//
//  UIFont+CC.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 06.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "UIFont+CC.h"

@implementation UIFont (CC)

+ (UIFont *)cc_regualarFontWithSize:(CGFloat)size {
    return [UIFont fontWithName:@"AvenirNextCondensed-Regular" size:size];
}

+ (UIFont *)cc_mediumFontWithSize:(CGFloat)size {
    return [UIFont fontWithName:@"AvenirNextCondensed-MediumItalic" size:size];
}

+ (UIFont *)cc_boldFontWithSize:(CGFloat)size {
    return [UIFont fontWithName:@"AvenirNextCondensed-BoldItalic" size:size];
}

@end
