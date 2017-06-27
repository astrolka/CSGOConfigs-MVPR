//
//  CCPlayersPreviewPresenterTests.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 26.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <AppleGuice/AppleGuice.h>
#import <OCMock/OCMock.h>
#import "CCPlayersPreviewPresenter.h"
#import "CCPlayerPreviewViewModel.h"

@interface CCPlayersPreviewPresenterTests : XCTestCase

@property (nonatomic, strong) id <CCPlayersPreviewViewProtocol> view;
@property (nonatomic, strong) id <CCPlayersPreviewRouterProtocol> router;
@property (nonatomic, strong) CCPlayersPreviewPresenter *playersPreviewPresenter;

@property (nonatomic, strong) NSArray <CCPlayerPreviewViewModel *> *playersDataFromService;

@end

@implementation CCPlayersPreviewPresenterTests

static CGFloat const kCellContainerWidth = 100.f;

- (void)setUp {
    [super setUp];
    
    [AppleGuice startService];
    [AppleGuice setInstanceCreationPolicy:AppleGuiceInstanceCreationPolicyCreateMocks];
    [self moduleSetup];
    [self playersServiceSetup];
}

- (void)playersServiceSetup {
    self.playersPreviewPresenter.ioc_playersService = OCMProtocolMock(@protocol(CCPlayersServiceProtocol));
    CCPlayerPreviewViewModel *player = [[CCPlayerPreviewViewModel alloc] init];
    player.playerID = 1;
    self.playersDataFromService = @[player];
}

- (void)getPlayersMethodStubFromServer:(BOOL)fromServer {
    void (^proxyBlock)(NSInvocation *) = ^(NSInvocation *invocation) {
        __unsafe_unretained playersPreviewDataBlock playersPreview;
        [invocation getArgument:&playersPreview atIndex:4];
        playersPreview(self.playersDataFromService, fromServer, 10);
    };
    
    [OCMStub([self.playersPreviewPresenter.ioc_playersService getPlayersPreviewWithOffset:0 containerWidth:kCellContainerWidth data:OCMOCK_ANY]) andDo:proxyBlock];
}

- (void)moduleSetup {
    self.view = OCMProtocolMock(@protocol(CCPlayersPreviewViewProtocol));
    self.router = OCMProtocolMock(@protocol(CCPlayersPreviewRouterProtocol));
    [OCMStub([self.view cellContainerWidth]) andReturnValue:OCMOCK_VALUE(kCellContainerWidth)];
    self.playersPreviewPresenter = [[CCPlayersPreviewPresenter alloc] initWithView:self.view router:self.router];
}

#pragma mark - Tests

- (void)testOpenMenu {
    [self.playersPreviewPresenter playersPreviewViewDidOpenMenu:self.view];
    
    OCMVerify([self.router openSideMenu]);
}

- (void)testSelectPlayer {
    static NSUInteger const selectedPlayerIndex = 0;
    [self getPlayersMethodStubFromServer:YES];
    [self.playersPreviewPresenter playersPreviewViewDidSet:self.view];
    [self.playersPreviewPresenter playersPreviewView:self.view didSelectPlayerAtIndex:selectedPlayerIndex];
    
    OCMVerify([self.router goToPlayerDescriptionScreenWithPlayerID:self.playersDataFromService[selectedPlayerIndex].playerID]);
}

- (void)testLoadPlayersFromServer {
    [self getPlayersMethodStubFromServer:YES];
    [self.playersPreviewPresenter playersPreviewViewDidSet:self.view];
    
    OCMVerify([self.view showSpiner]);
    OCMVerify([self.view showPlayers:self.playersDataFromService]);
    OCMReject([self.view showMessageWithText:[OCMArg any]]);
    OCMVerify([self.view hideSpiner]);
}

- (void)testLoadPlayersFromLocalBD {
    [self getPlayersMethodStubFromServer:NO];
    [self.playersPreviewPresenter playersPreviewViewDidSet:self.view];
    
    OCMVerify([self.view showSpiner]);
    OCMVerify([self.view showPlayers:self.playersDataFromService]);
    OCMVerify([self.view showMessageWithText:[OCMArg any]]);
    OCMVerify([self.view hideSpiner]);
}

@end
