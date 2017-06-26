//
//  CCSkinServerModel.m
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 14.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCSkinServerModel.h"

@interface CCSkinServerModel ()

@property (nonatomic, strong, readwrite) NSString *gunName;
@property (nonatomic, strong, readwrite) NSString *gunSkin;
@property (nonatomic, strong, readwrite) NSString *exterior;
@property (nonatomic, assign, readwrite) CGFloat price;
@property (nonatomic, strong, readwrite) NSURL *coverImageURL;

@end

@implementation CCSkinServerModel

NSString *const kCase = @"Case";
NSString *const kSticker = @"Sticker";
NSString *const kImageBaseURL = @"https://cdn.csgo.com/item_%@_%@.png";

- (instancetype)initWithServerResponce:(NSString *)serverResponce {
    self = [super init];
    if (self) {
        if (![serverResponce containsString:kCase] && ![serverResponce containsString:kSticker]) {
            self = [self buildSkinModelWithServerResponce:serverResponce];
        } else {
            return nil;
        }
    }
    return self;
}

#pragma mark - Private

- (CCSkinServerModel *)buildSkinModelWithServerResponce:(NSString *)serverResponce { // hell responce
    CCSkinServerModel *skinServerModel = [[CCSkinServerModel alloc] init];
    skinServerModel.gunName = [self buildGunNameWithServerResponce:serverResponce];
    skinServerModel.gunSkin = [self buildGunSkinWithServerResponce:serverResponce];
    skinServerModel.exterior = [self buildExteriorWithServerResponce:serverResponce];
    skinServerModel.price = [self buildPriceWithServerResponce:serverResponce];
    skinServerModel.coverImageURL = [self buildCoverWithServerResponce:serverResponce];
    return skinServerModel;
}

- (NSString *)buildGunNameWithServerResponce:(NSString *)serverResponce {
    NSArray *tempArray = [serverResponce componentsSeparatedByString:@","];
    if (tempArray.count > 2) {
        NSString *tempStr = tempArray[3];
        NSArray *tempArray = [tempStr componentsSeparatedByString:@"|"];
        if (tempArray.count > 0) {
            NSString *tempStr = tempArray[0];
            if (tempStr.length > 0) {
                tempStr = [tempStr substringToIndex:tempStr.length - 1];
                return tempStr;
            }
        }
    }
    return nil;
}

- (NSString *)buildGunSkinWithServerResponce:(NSString *)serverResponce {
    NSArray *tempArray = [serverResponce componentsSeparatedByString:@"|"];
    if (tempArray.count > 0) {
        NSString *tempStr = tempArray[1];
        NSArray *tempArray = [tempStr componentsSeparatedByString:@"("];
        if (tempArray.count > 0) {
            NSString *tempStr = [tempArray firstObject];
            if (tempStr.length > 0) {
                tempStr = [tempStr substringToIndex:tempStr.length - 1];
                if (tempStr.length > 1) {
                    tempStr = [tempStr substringFromIndex:1];
                    return tempStr;
                }
            }
        }
    }
    return nil;
}

- (NSInteger)buildPriceWithServerResponce:(NSString *)serverResponce {
    NSArray *tempArray = [serverResponce componentsSeparatedByString:@"|"];
    if (tempArray.count > 0) {
        NSString *tempStr = tempArray[1];
        NSArray *tempArray = [tempStr componentsSeparatedByString:@","];
        if (tempArray.count > 1) {
            NSString *tempStr = tempArray[2];
            CGFloat price = tempStr.floatValue / 1000.f;
            return price;
        }
    }
    return 0;
}

- (NSString *)buildExteriorWithServerResponce:(NSString *)serverResponce {
    NSArray *tempArray = [serverResponce componentsSeparatedByString:@"("];
    if (tempArray.count > 0) {
        NSString *tempStr = tempArray[1];
        NSArray *tempArray = [tempStr componentsSeparatedByString:@")"];
        if (tempArray.count > 0) {
            NSString *tempStr = tempArray[0];
            return tempStr;
        }
    }
    return nil;
}

- (NSURL *)buildCoverWithServerResponce:(NSString *)serverResponce {
    NSArray *tempArray = [serverResponce componentsSeparatedByString:@"["];
    if (tempArray.count > 0) {
        NSString *tempStr = tempArray[1];
        NSArray *tempArray = [tempStr componentsSeparatedByString:@","];
        if (tempArray.count > 1) {
            NSString *firstPart = tempArray[0];
            NSString *secondPart = tempArray[1];
            NSString *cover = [NSString stringWithFormat:kImageBaseURL, firstPart, secondPart];
            return [NSURL URLWithString:cover];
        }
    }
    return nil;
}

@end
