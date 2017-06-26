//
//  CCWebSocketService.m
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 21.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCWebSocketService.h"
#import "JFRWebSocket.h"
#import "CCLog.h"

@interface CCWebSocketService () <JFRWebSocketDelegate>

@property (nonatomic, strong) JFRWebSocket *webSocket;

@property (nonatomic, copy) webSocketConnectBlock connectBlock;
@property (nonatomic, copy) webSocketReceiveNewMessageBlock receiveNewMessageBlock;
@property (nonatomic, copy) webSocketDisconnecBlock disconnectBlock;

@end

@implementation CCWebSocketService

#pragma mark - CCWebSocketServiceProtocol

- (void)connectToURL:(NSURL *)url connect:(webSocketConnectBlock)connect receiveNewMessage:(webSocketReceiveNewMessageBlock)receiveNewMessage disconnect:(webSocketDisconnecBlock)disconnect {
    self.connectBlock = connect;
    self.receiveNewMessageBlock = receiveNewMessage;
    self.disconnectBlock = disconnect;

    self.webSocket = [[JFRWebSocket alloc] initWithURL:url protocols:nil];
    self.webSocket.delegate = self;
    [self.webSocket connect];
}

#pragma mark - JFRWebSocketDelegate

- (void)websocketDidConnect:(JFRWebSocket*)socket {
    [self.webSocket writeString:@"history_go"];
    if (self.connectBlock) {
        self.connectBlock();
    }
}

- (void)websocketDidDisconnect:(JFRWebSocket*)socket error:(NSError*)error {
    CCLog(@"Websocket did disconnect: %@",error);
    if (self.disconnectBlock) {
        self.disconnectBlock(error);
    }
}

- (void)websocket:(JFRWebSocket*)socket didReceiveMessage:(NSString*)string {
    NSString *transformString = [string stringByApplyingTransform:@"Any-Hex/Java" reverse:YES];
    transformString = [transformString stringByReplacingOccurrencesOfString:@"\"" withString:@""];
    transformString = [transformString stringByReplacingOccurrencesOfString:@"\\" withString:@""];
    
    CCLog([NSString stringWithFormat:@"WebSocket did receive message: %@", transformString]);
    if (self.receiveNewMessageBlock) {
        self.receiveNewMessageBlock(transformString);
    }
}

@end
