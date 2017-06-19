//
//  CCMessageView.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 03.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCMessageView.h"
#import "Masonry.h"
#import "UIFont+CC.h"
#import "UIColor+CC.h"

@interface CCMessageView ()

@property (nonatomic, strong) UILabel *messageLabel;

@end

@implementation CCMessageView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self messageLabelSetup];
    }
    return self;
}

- (void)setMessage:(NSString *)message {
    _message = message;
    
    self.messageLabel.text = message;
}

- (void)messageLabelSetup {
    self.messageLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    self.messageLabel.textAlignment = NSTextAlignmentCenter;
    self.messageLabel.textColor = [UIColor cc_themeColor];
    self.messageLabel.font = [UIFont cc_mediumFontWithSize:16];
    self.messageLabel.numberOfLines = 0;
    
    [self addSubview:self.messageLabel];
    [self.messageLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self).with.insets(UIEdgeInsetsMake(8, 6, 8, 6));
    }];
}

@end
