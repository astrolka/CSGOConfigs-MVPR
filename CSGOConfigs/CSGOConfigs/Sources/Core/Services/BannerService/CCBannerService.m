//
//  CCBannerService.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 03.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCBannerService.h"
#import "CCRestServiceProtocol.h"
#import "CCLocalStorageServiceProtocol.h"
#import "CCBannerServerModel.h"
#import "CCBannerCoreDataModel+CoreDataProperties.h"
#import <UIKit/UIScreen.h>

@interface CCBannerService ()

@property (strong, nonatomic) id <CCRestServiceProtocol> ioc_restService;
@property (strong, nonatomic) id <CCLocalStorageServiceProtocol> ioc_localStorageService;

@end

@implementation CCBannerService

NSString *const kBannerSizeSpechialChar = @"x"; // server responce: "320x640"

#pragma mark - CCBannerServiceProtocol

- (void)getBanners:(bannerDataBlock)banners {
    [self.ioc_restService makeGETRequestWithURL:[NSURL URLWithString:@"bannersData.json"] onSucess:^(NSArray *responce) {
        NSMutableArray <CCBannerServerModel *> *serverModels  = [[NSMutableArray alloc] init];
        [responce enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            CCBannerServerModel *bannerServerModel = [[CCBannerServerModel alloc] initWithServerResponce:obj];
            [serverModels addObject:bannerServerModel];
        }];
        
        [self.ioc_localStorageService updateBanners:serverModels];
        
        [CCBannerViewModelBuilder buildWithServerModel:serverModels viewModel:^(NSArray<CCBannerViewModel *> *viewModels) {
            banners(viewModels, [self bannerSizeFromCoreDataModels:(NSArray *)serverModels]);
        }];
    } onFailure:^(NSError *error) {
        NSArray <CCBannerCoreDataModel *> *coreDataModels = [self.ioc_localStorageService getBanners];
        [CCBannerViewModelBuilder buildWithCoreDataModel:coreDataModels viewModel:^(NSArray<CCBannerViewModel *> *viewModels) {
            banners(viewModels, [self bannerSizeFromCoreDataModels:coreDataModels]);
        }];
    }];
}

#pragma mark - Private

- (CGFloat)bannerSizeFromServerModels:(NSArray <CCBannerServerModel *> *)dataArray {
    if (dataArray.count > 0) {
        return [self bannerSizeFromString:[dataArray firstObject].imageSize];
    } else {
        return 0.f;
    }
}

- (CGFloat)bannerSizeFromCoreDataModels:(NSArray <CCBannerCoreDataModel *> *)dataArray {
    if (dataArray.count > 0) {
        return [self bannerSizeFromString:[dataArray firstObject].imageSize];
    } else {
        return 0.f;
    }
}

- (CGFloat)bannerSizeFromString:(NSString *)sizeStr {
    NSArray *bannerSizeArray = [sizeStr componentsSeparatedByString:kBannerSizeSpechialChar];
    NSString *heightStr = [bannerSizeArray lastObject];
    NSString *widthStr = [bannerSizeArray firstObject];
    if (heightStr) {
        return (heightStr.floatValue * [UIScreen mainScreen].bounds.size.width) / widthStr.floatValue; // UIScreen - hack, better send container width as param
    } else {
        return 0;
    }
}

@end
