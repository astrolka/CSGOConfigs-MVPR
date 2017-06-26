//
//  CCPlayerPreviewCollectionViewCell.h
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 02.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CCPlayerPreviewViewModel;

@interface CCPlayerPreviewCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) CCPlayerPreviewViewModel *player;

+ (CGFloat)cellHeightWithoutImageView;

@end
