//
//  CCFavoritePlayersPresenter.h
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 06.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol CCFavoritePlayersRouterProtocol;
@protocol CCFavoritePlayersViewProtocol;

@interface CCFavoritePlayersPresenter : NSObject

- (instancetype)initWithView:(id <CCFavoritePlayersViewProtocol>)view router:(id <CCFavoritePlayersRouterProtocol>)router;

@end
