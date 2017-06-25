//
//  CCAlertButtonsContainerView.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 25.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCAlertButtonsContainerView.h"

@interface CCAlertButtonsContainerView ()

@property (nonatomic, strong) CALayer *topButtonsSeparatorLayer;
@property (nonatomic, strong) CALayer *interButtonsSeparatorLayer;

@end

@implementation CCAlertButtonsContainerView

// TODO: 
- (instancetype)initWithInterButtonSeparatorLayer:(BOOL)interButtonSeparatorLayer {
    self = [super initWithFrame:CGRectZero];
    if (self) {
        self.topButtonsSeparatorLayer = [CALayer new];
        self.topButtonsSeparatorLayer.frame = CGRectMake(0.0f, 0.0f, CGRectGetWidth(self.frame), 1.0f);
        self.topButtonsSeparatorLayer.backgroundColor = [UIColor colorWithWhite:240.0/255.0f alpha:1.0f].CGColor;
        [self.layer addSublayer:self.topButtonsSeparatorLayer];
        
        if (interButtonSeparatorLayer) {
            self.interButtonsSeparatorLayer = [CALayer new];
            self.interButtonsSeparatorLayer.frame = CGRectMake(CGRectGetWidth(self.frame) / 2.0, 0.0f, 1.0f, CGRectGetHeight(self.frame));
            self.interButtonsSeparatorLayer.backgroundColor = [UIColor colorWithWhite:240.0/255.0f alpha:1.0f].CGColor;
            [self.layer addSublayer:self.interButtonsSeparatorLayer];
        }
    }
    return self;
}

- (void)layoutSublayersOfLayer:(CALayer *)layer {
    [super layoutSublayersOfLayer:layer];
    if (layer == self.layer) {
        self.topButtonsSeparatorLayer.frame = CGRectMake(0.0f, 0.0f, CGRectGetWidth(self.frame), 1.0f);
        self.interButtonsSeparatorLayer.frame = CGRectMake(CGRectGetWidth(self.frame) / 2.0, 0.0f, 1.0f, CGRectGetHeight(self.frame));
    }
}

@end
