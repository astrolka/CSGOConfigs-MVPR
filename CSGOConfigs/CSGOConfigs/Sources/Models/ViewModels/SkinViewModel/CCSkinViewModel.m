//
//  CCSkinViewModel.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 21.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCSkinViewModel.h"
#import "CCSkinServerModel.h"

@implementation CCSkinViewModel

@end



@implementation CCSkinViewModelBuilder

static const NSInteger kNoPrice = 0;

+ (void)buildWithServerModels:(CCSkinServerModel *)serverModel viewModel:(skinDataBlock)viewModelData {
    CCSkinViewModel *viewModel = [[CCSkinViewModel alloc] init];
    
    const char *classNameChar = [NSStringFromClass([CCSkinViewModelBuilder class]) UTF8String];
    dispatch_queue_t queue = dispatch_queue_create(classNameChar, DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        viewModel.name = [NSString stringWithFormat:@"%@: %@ %@", NSLocalizedString(@"", nil), serverModel.gunName, serverModel.gunSkin];
        viewModel.exterior = [NSString stringWithFormat:@"%@: %@", NSLocalizedString(@"", nil), serverModel.exterior];
        viewModel.price = [NSString stringWithFormat:@"%@: %ld", NSLocalizedString(@"", nil), (long)serverModel.price];
        viewModel.coverImageURL = serverModel.coverImageURL;
        if (serverModel.price == kNoPrice) {
            viewModel.price = [NSString stringWithFormat:@"%@: 0.1$", NSLocalizedString(@"", nil)];
        }
        else {
            viewModel.price = [NSString stringWithFormat:@"%@: %.02f$", NSLocalizedString(@"", nil), serverModel.price];
        }
    });
    
    dispatch_async(queue, ^{
        dispatch_async(dispatch_get_main_queue(), ^{
            viewModelData(viewModel);
        });
    });
}

@end