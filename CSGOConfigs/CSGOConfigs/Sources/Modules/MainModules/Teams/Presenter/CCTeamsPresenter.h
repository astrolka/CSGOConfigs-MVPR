//
//  CCTeamsPresenter.h
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 06.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol CCTeamsRouterProtocol;
@protocol CCTeamsViewProtocol;

@interface CCTeamsPresenter : NSObject

- (instancetype)initWithView:(id <CCTeamsViewProtocol>)view router:(id <CCTeamsRouterProtocol>)router;

@end
