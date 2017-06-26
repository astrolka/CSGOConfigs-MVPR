//
//  CCBannerCollectionViewCell.h
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 03.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CCBannerViewModel;

@interface CCBannerCollectionViewCell : UICollectionViewCell

@property (nonatomic, strong) CCBannerViewModel *banner;

@end
