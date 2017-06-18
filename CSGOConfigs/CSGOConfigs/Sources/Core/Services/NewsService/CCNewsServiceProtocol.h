//
//  CCNewsServiceProtocol.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 18.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AppleGuice/AppleGuiceInjectable.h>
#import "CCNewsPreviewViewModel.h"

typedef void(^newsPreviewDataBlock)(NSArray <CCNewsPreviewViewModel *> *news, BOOL fromServer, NSInteger countOfNewsOnServer);

typedef void(^newsDescriptionDataBlock)();

@protocol CCNewsServiceProtocol <AppleGuiceInjectable>

- (void)getNewsPreviewWithOffset:(NSUInteger) offset data:(newsPreviewDataBlock)newsPreview;

- (void)getNewsDescription:(newsDescriptionDataBlock)newsDescription;

@end
