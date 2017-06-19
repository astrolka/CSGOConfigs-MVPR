//
//  CCNewsTextContentTableViewCell.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 19.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCNewsTextContentTableViewCell.h"
#import "CCNewsContentViewModel.h"
#import "CCNewsTextContentViewModel.h"
#import "Masonry.h"
#import "UIFont+CC.h"

@interface CCNewsTextContentTableViewCell ()

@property (nonatomic, strong) UILabel *textLabelz;

@end

@implementation CCNewsTextContentTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self textLabelzSetup];
    }
    return self;
}

#pragma mark - View

- (void)textLabelzSetup {
    self.textLabelz = [[UILabel alloc] initWithFrame:CGRectZero];
    self.textLabelz.font = [UIFont cc_regualarFontWithSize:16];
    self.textLabelz.numberOfLines = 0;
    
    [self.contentView addSubview:self.textLabelz];
    [self.textLabelz mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.contentView).with.insets(UIEdgeInsetsMake(8, 8, 8, 8));
    }];
}

#pragma mark - Public

- (void)setNewsContentViewModel:(CCNewsContentViewModel *)newsContentViewModel {
    _newsContentViewModel = newsContentViewModel;
   
    self.textLabelz.text = [(CCNewsTextContentViewModel *)newsContentViewModel text];
}

@end
