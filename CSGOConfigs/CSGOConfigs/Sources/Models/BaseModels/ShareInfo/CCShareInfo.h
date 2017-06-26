//
//  CCShareInfo.h
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 25.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
@class UIImage;

@interface CCShareInfo : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSURL *url;

- (NSArray *)objectsToShareInArray;

@end
