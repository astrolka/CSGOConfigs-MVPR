//
//  CCFavoritePlayersViewProtocol.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 06.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CCFavoritePlayersViewActionProtocol <NSObject>

@end

@protocol CCFavoritePlayersViewProtocol <NSObject>

@property (nonatomic, strong) id <CCFavoritePlayersViewActionProtocol> viewAction;

@end
