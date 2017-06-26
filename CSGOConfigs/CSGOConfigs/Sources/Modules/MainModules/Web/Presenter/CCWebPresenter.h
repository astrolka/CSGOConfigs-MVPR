//
//  CCWebPresenter.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 22.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol CCWebPresentationServiceProtocol;
@protocol CCWebRouterProtocol;
@protocol CCWebViewProtocol;

@interface CCWebPresenter : NSObject

- (instancetype)initWithURL:(NSURL *)url view:(id <CCWebViewProtocol>)view router:(id <CCWebRouterProtocol>)router webPresentationService:(id <CCWebPresentationServiceProtocol>)webPresentationService;

@end
