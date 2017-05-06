//
//  CCNewsViewProtocol.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 06.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCViewControllerProtocol.h"

@protocol CCNewsViewActionProtocol <NSObject>


@end

@protocol CCNewsViewProtocol <CCViewControllerProtocol>

@property (nonatomic, strong) id <CCNewsViewActionProtocol> viewAction;

@end
