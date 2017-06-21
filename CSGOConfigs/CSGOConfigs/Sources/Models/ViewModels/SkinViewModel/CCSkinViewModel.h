//
//  CCSkinViewModel.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 21.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
@class CCSkinServerModel;

@interface CCSkinViewModel : NSObject

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *exterior;
@property (nonatomic, strong) NSString *price;
@property (nonatomic, strong) NSURL *coverImageURL;

@end



typedef void(^skinDataBlock)(CCSkinViewModel *skin);

@interface CCSkinViewModelBuilder : NSObject

+ (void)buildWithServerModels:(CCSkinServerModel *)serverModel viewModel:(skinDataBlock)viewModel;

@end
