//
//  CCRestServiceProtocol.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 13.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AppleGuice/AppleGuiceInjectable.h>

typedef void(^successBlock)(id responce);
typedef void(^errorBlock)(NSError *error);

@protocol CCRestServiceProtocol <AppleGuiceInjectable>

- (void)makeGETRequestWithURL:(NSURL *)url withParams:(NSDictionary *)params onSucess:(successBlock)success onFailure:(errorBlock)failure;

- (void)makePOSTRequestWithURL:(NSURL *)url withParams:(NSDictionary *)params onSucess:(successBlock)success onFailure:(errorBlock)failure;

@end
