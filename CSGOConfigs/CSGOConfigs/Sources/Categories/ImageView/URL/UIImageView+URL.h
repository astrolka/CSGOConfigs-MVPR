//
//  UIImageView+URL.h
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 10.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImageView (URL)

- (void)cc_setImageWithURL:(NSURL *)url;

- (void)cc_setImageWithURL:(NSURL *)url placeholderImage:(UIImage *)placeholder;

@end
