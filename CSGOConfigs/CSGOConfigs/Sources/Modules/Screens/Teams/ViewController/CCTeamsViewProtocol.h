//
//  CCTeamsViewProtocol.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 06.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CCTeamsViewActionProtocol <NSObject>



@end

@protocol CCTeamsViewProtocol <NSObject>

@property (nonatomic, strong) id <CCTeamsViewActionProtocol> viewAction;

@end
