//
//  CCEventPinAnnotationView.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 21.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCEventPinAnnotationView.h"
#import "CCAnnotationEventViewModel.h"
#import "UIColor+CC.h"
#import <SDWebImage/UIImageView+WebCache.h>

@interface CCEventPinAnnotationView ()

@property (nonatomic, strong) UIButton *descriptionButton;

@end

@implementation CCEventPinAnnotationView

#pragma mark - LifeCycle

- (instancetype)initWithAnnotation:(CCAnnotationEventViewModel *)annotation reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithAnnotation:annotation reuseIdentifier:reuseIdentifier];
    if (self) {
        self.canShowCallout = YES;
        self.animatesDrop = YES;
        self.pinTintColor = [UIColor cc_themeColor];
        [self descriptionButtonSetup];
        [self updateDescriptionButtonWithImageURL:annotation.logoImageURL];
    }
    return self;
}

- (void)prepareForReuse {
    [super prepareForReuse];
    
    self.leftCalloutAccessoryView = nil;
}

#pragma mark - View

- (void)descriptionButtonSetup {
    self.descriptionButton = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
    [self.descriptionButton addTarget:self action:@selector(actionDescriptionButton:)
                forControlEvents:UIControlEventTouchUpInside];
    self.rightCalloutAccessoryView = self.descriptionButton;
}

#pragma mark - Private

- (void)updateDescriptionButtonWithImageURL:(NSURL *)url {
    // TODO: move SDWebImageManager to a wrapper class
    [[SDWebImageManager sharedManager]downloadImageWithURL:url
                                                   options:SDWebImageAllowInvalidSSLCertificates
                                                  progress:nil
                                                 completed:^(UIImage *image, NSError *error, SDImageCacheType cacheType, BOOL finished, NSURL *imageURL) {
                                                     UIImageView * imageView = [[UIImageView alloc] initWithImage:image];
                                                     imageView.contentMode = UIViewContentModeScaleToFill;
                                                     self.leftCalloutAccessoryView = imageView;
                                                 }];
}

#pragma mark - Action

- (void)actionDescriptionButton:(UIButton *)button {
    if (self.pressDescriptionButton) {
        self.pressDescriptionButton(self, button);
    }
}

@end