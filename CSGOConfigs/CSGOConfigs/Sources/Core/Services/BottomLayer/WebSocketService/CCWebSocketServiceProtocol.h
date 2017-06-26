//
//  CCWebSocketServiceProtocol.h
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 21.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AppleGuice/AppleGuiceInjectable.h>

/*
 
 The service allow you work with websockets via blocks
 
*/

typedef void(^webSocketConnectBlock)();
typedef void(^webSocketReceiveNewMessageBlock)(NSString *message);
typedef void(^webSocketDisconnecBlock)(NSError *error);

@protocol CCWebSocketServiceProtocol <AppleGuiceInjectable>

- (void)connectToURL:(NSURL *)url connect:(webSocketConnectBlock)connect receiveNewMessage:(webSocketReceiveNewMessageBlock)receiveNewMessage disconnect:(webSocketDisconnecBlock)disconnect;

@end
