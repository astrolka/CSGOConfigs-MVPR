//
//  CCTeamsViewProtocol.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 06.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCViewControllerProtocol.h"

@protocol CCTeamsViewActionProtocol <NSObject>



@end

@protocol CCTeamsViewProtocol <CCViewControllerProtocol>

@property (nonatomic, strong) id <CCTeamsViewActionProtocol> viewAction;

@end
