//
//  CCPlayersServiceTests.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 27.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <AppleGuice/AppleGuice.h>
#import <OCMock/OCMock.h>
#import "CCPlayerPreviewCoreDataModel+CoreDataProperties.h"
#import "CCPlayerDescriptionServerModel.h"
#import "CCPlayersService.h"

@interface CCPlayersServiceTests : XCTestCase

@property (nonatomic, strong) CCPlayersService *playersService;

@end

static NSInteger const kPlayerID = 1;

@implementation CCPlayersServiceTests

- (void)setUp {
    [super setUp];
    
    [AppleGuice startService];
    [AppleGuice setInstanceCreationPolicy:AppleGuiceInstanceCreationPolicyCreateMocks];
    [self moduleSetup];
}

- (void)moduleSetup {
    id <CCRestServiceProtocol> restService = OCMProtocolMock(@protocol(CCRestServiceProtocol));
    id <CCLocalStorageServiceProtocol> localStoreageService = OCMProtocolMock(@protocol(CCLocalStorageServiceProtocol));
    self.playersService = [[CCPlayersService alloc] init];
    self.playersService.ioc_restService = restService;
    self.playersService.ioc_localStorageService = localStoreageService;
}

- (void)restServiceSendResponce {
    [OCMStub([self.playersService.ioc_restService makeGETRequestWithURL:OCMOCK_ANY onSucess:OCMOCK_ANY onFailure:OCMOCK_ANY]) andDo:^(NSInvocation *invocation) {
      
        __unsafe_unretained successBlock responceBlock;
        [invocation getArgument:&responceBlock atIndex:3];
        responceBlock(nil);
    }];
}

- (void)restServiceMakeSendError {
    [OCMStub([self.playersService.ioc_restService makeGETRequestWithURL:OCMOCK_ANY onSucess:OCMOCK_ANY onFailure:OCMOCK_ANY]) andDo:^(NSInvocation *invocation) {
      
        
        __unsafe_unretained errorBlock errorBlock;
        [invocation getArgument:&errorBlock atIndex:4];
        errorBlock([NSError errorWithDomain:@"" code:0 userInfo:@{}]);
    }];
}

#pragma mark - Tests

- (void)testFavoritePlayersPreview {
    NSArray *favoritePlayersID = @[@1, @2, @3];
    NSArray *favoritePlayers = @[OCMClassMock([CCPlayerPreviewCoreDataModel class])];
    OCMStub([self.playersService.ioc_localStorageService getUserFavoritePlayersID]).andReturn(favoritePlayersID);
    OCMStub([self.playersService.ioc_localStorageService getFavoritePlayersPreviewWithIDs:OCMOCK_ANY]).andReturn(favoritePlayers);
    [self.playersService getFavoritePlayersPreviewWithContainerWidth:100 data:OCMOCK_ANY];
    
    OCMVerify([self.playersService.ioc_localStorageService getUserFavoritePlayersID]);
    OCMVerify([self.playersService.ioc_localStorageService getFavoritePlayersPreviewWithIDs:favoritePlayersID]);
}

- (void)testPlayerDescriptionFromServer {
    [self restServiceSendResponce];
    OCMStub([self.playersService.ioc_localStorageService updatePlayerDescription:OCMOCK_ANY]);
    [self.playersService getPlayerDescriptionWithPlayerID:kPlayerID data:OCMOCK_ANY];
    
    OCMVerify([self.playersService.ioc_localStorageService updatePlayerDescription:OCMOCK_ANY]);
}

- (void)testAddPlayerToFavorites {
    OCMStub([self.playersService.ioc_localStorageService addPlayerToFavoritesWithPlayerID:kPlayerID]);
    [self.playersService addPlayerToFavoritesWithPlayerID:kPlayerID];
    
    OCMVerify([self.playersService.ioc_localStorageService addPlayerToFavoritesWithPlayerID:kPlayerID]);
}

- (void)removePlayerFromFavorites {
    OCMStub([self.playersService.ioc_localStorageService removePlayerFromFavoritesWithID:kPlayerID]);
    [self.playersService removePlayerFromFavoritesWithPlayerID:kPlayerID];
    
    OCMVerify([self.playersService.ioc_localStorageService removePlayerFromFavoritesWithID:kPlayerID]);
}

- (void)testPlayerIsFavoriteStatusCheak {
    OCMStub([self.playersService.ioc_localStorageService playerIsFavorite:kPlayerID]).andReturn(YES);\
    [self.playersService playerIsFavorite:kPlayerID];
    
    OCMVerify([self.playersService.ioc_localStorageService playerIsFavorite:kPlayerID]);
}

@end
