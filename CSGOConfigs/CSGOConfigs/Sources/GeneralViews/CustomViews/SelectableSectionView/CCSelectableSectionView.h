//
//  CCSelectableSectionView.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 11.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <UIKit/UIKit.h>
@class CCSelectableSectionView;

typedef void(^pressSectionBlock)(CCSelectableSectionView *selectableSectionView);

@interface CCSelectableSectionView : UITableViewHeaderFooterView

@property (nonatomic, copy) pressSectionBlock pressSection;

@property (nonatomic, strong) NSString *title;

@end
