//
//  CCNewsPreviewViewProtocol.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 14.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol CCNewsPreviewViewActionProtocol <NSObject>


@end

@protocol CCNewsPreviewViewProtocol <NSObject>

@property (nonatomic, strong) id <CCNewsPreviewViewActionProtocol> viewAction;

@end
