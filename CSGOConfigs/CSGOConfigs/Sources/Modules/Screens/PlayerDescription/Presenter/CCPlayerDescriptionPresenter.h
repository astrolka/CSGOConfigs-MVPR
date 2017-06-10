//
//  CCPlayerDescriptionPresenter.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 11.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol CCPlayerDescriptionRouterProtocol;
@protocol CCPlayerDescriptionViewProtocol;

@interface CCPlayerDescriptionPresenter : NSObject

- (instancetype)initWithView:(id <CCPlayerDescriptionViewProtocol>)view router:(id <CCPlayerDescriptionRouterProtocol>)router playerID:(NSUInteger)playerID;

@end
