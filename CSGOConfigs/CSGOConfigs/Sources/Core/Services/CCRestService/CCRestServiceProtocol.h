//
//  CCRestServiceProtocol.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 13.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AppleGuice/AppleGuiceInjectable.h>

/*
 
 I don't have params in this project, cuz i use Firebase, so "params" generating in the url
 
 */

typedef void(^successBlock)(id responce);
typedef void(^errorBlock)(NSError *error);

@protocol CCRestServiceProtocol <AppleGuiceInjectable>

- (void)makeGETRequestWithURL:(NSURL *)url onSucess:(successBlock)success onFailure:(errorBlock)failure;

- (void)makePOSTRequestWithURL:(NSURL *)url onSucess:(successBlock)success onFailure:(errorBlock)failure;

@end
