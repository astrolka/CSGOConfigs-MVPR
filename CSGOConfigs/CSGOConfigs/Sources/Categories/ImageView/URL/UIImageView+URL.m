//
//  UIImageView+URL.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 10.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "UIImageView+URL.h"
#import <SDWebImage/UIImageView+WebCache.h>

@implementation UIImageView (URL)

- (void)cc_setImageWithURL:(NSURL *)url {
    [self sd_setImageWithURL:url];
}

- (void)cc_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder {
    [self sd_setImageWithURL:url placeholderImage:placeholder];
}

@end
