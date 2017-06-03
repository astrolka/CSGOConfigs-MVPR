//
//  CCAppToolsViewProtocol.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 06.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CCAppToolsViewActionProtocol <NSObject>



@end

@protocol CCAppToolsViewProtocol <NSObject>

@property (nonatomic, strong) id <CCAppToolsViewActionProtocol> viewAction;

@end
