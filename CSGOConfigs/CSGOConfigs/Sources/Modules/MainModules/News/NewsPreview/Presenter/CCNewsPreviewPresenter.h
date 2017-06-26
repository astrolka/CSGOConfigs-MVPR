//
//  CCNewsPreviewPresenter.h
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 14.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol CCNewsPreviewRouterProtocol;
@protocol CCNewsPreviewViewProtocol;

@interface CCNewsPreviewPresenter : NSObject

- (instancetype)initWithView:(id <CCNewsPreviewViewProtocol>)view router:(id <CCNewsPreviewRouterProtocol>)router;

@end
