//
//  CCPlayersPreviewPresenter.h
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 14.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol CCPlayersPreviewRouterProtocol;
@protocol CCPlayersPreviewViewProtocol;

@interface CCPlayersPreviewPresenter : NSObject

- (instancetype)initWithView:(id <CCPlayersPreviewViewProtocol>)view router:(id <CCPlayersPreviewRouterProtocol>)router;

@end
