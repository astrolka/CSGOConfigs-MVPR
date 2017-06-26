//
//  CCNewsDescriptionPresenter.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 18.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol CCNewsDescriptionRouterProtocol;
@protocol CCNewsDescriptionViewProtocol;

@interface CCNewsDescriptionPresenter : NSObject

- (instancetype)initWithView:(id <CCNewsDescriptionViewProtocol>)view router:(id <CCNewsDescriptionRouterProtocol>)router newsID:(NSUInteger)newsID;

@end
