//
//  CCAppToolsPresenterTests.m
//  CSGOConfigs
//
//  Created by Oleg Petruchyk on 27.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <AppleGuice/AppleGuice.h>
#import <OCMock/OCMock.h>
#import "CCAppToolsPresenter.h"
#import "EXPMatchers+CCViewModel.h"


@interface CCAppToolsPresenterTests : XCTestCase

@property (nonatomic, strong) id <CCAppToolsViewProtocol> view;
@property (nonatomic, strong) id <CCAppToolsRouterProtocol> router;
@property (nonatomic, strong) CCAppToolsPresenter *appToolsPresenter;

@end

@implementation CCAppToolsPresenterTests

- (void)setUp {
    [super setUp];
 
    [AppleGuice startService];
    [AppleGuice setInstanceCreationPolicy:AppleGuiceInstanceCreationPolicyCreateMocks];
    [self moduleSetup];
    [self localStorageServiceSetup];
    [self openURLServiceSetup];
}

- (void)localStorageServiceSetup {
    id <CCLocalStorageServiceProtocol> localStorageService = OCMProtocolMock(@protocol(CCLocalStorageServiceProtocol));
    self.appToolsPresenter.ioc_localStorageService = localStorageService;
    
    OCMStub([self.appToolsPresenter.ioc_localStorageService clearImagesCache]);
    [OCMStub([self.appToolsPresenter.ioc_localStorageService getImageCacheSize]) andReturnValue:OCMOCK_VALUE(100)];
}

- (void)openURLServiceSetup {
    id <CCOpenURLServiceProtocol> openURLService = OCMProtocolMock(@protocol(CCOpenURLServiceProtocol));
    self.appToolsPresenter.ioc_openURLService = openURLService;
    
    OCMStub([self.appToolsPresenter.ioc_openURLService openWebURL:OCMOCK_ANY]);
    OCMStub([self.appToolsPresenter.ioc_openURLService openApplicationSettings]);
}

- (void)moduleSetup {
    self.view = OCMProtocolMock(@protocol(CCAppToolsViewProtocol));
    self.router = OCMProtocolMock(@protocol(CCAppToolsRouterProtocol));
    self.appToolsPresenter = [[CCAppToolsPresenter alloc] initWithView:self.view router:self.router];
}

- (void)openFailOpenEmailScreenStub {
    [OCMStub([self.router openEmailScreenWithEmailInfo:OCMOCK_ANY withResult:OCMOCK_ANY]) andDo:^(NSInvocation *invocation) {
        __unsafe_unretained mailResultBlock resultBlock;
        [invocation getArgument:&resultBlock atIndex:3];
        resultBlock(CCMailResultNoAccount);
    }];
}

#pragma mark - Tests

- (void)testOpenMenu {
    [self.appToolsPresenter appToolsViewDidOpenMenu:self.view];
    
    OCMVerify([self.router openSideMenu]);
}

- (void)testUpdateCacheSize {
    [self.appToolsPresenter appToolsViewDidSet:self.view];
    
    OCMVerify([self.appToolsPresenter.ioc_localStorageService getImageCacheSize]);
    OCMVerify([self.view updateAppCache:OCMOCK_ANY]);
}

- (void)testClearCache {
    [self.appToolsPresenter appToolsViewDidSelectClearCache:self.view];
    
    OCMVerify([self.appToolsPresenter.ioc_localStorageService clearImagesCache]);
    OCMVerify([self.appToolsPresenter.ioc_localStorageService getImageCacheSize]);
    OCMVerify([self.view updateAppCache:OCMOCK_ANY]);
    OCMVerify([self.view showMessageWithText:OCMOCK_ANY]);
}

- (void)testDonate {
    [self.appToolsPresenter appToolsViewDidSelectDonate:self.view];
    
    OCMVerify([self.appToolsPresenter.ioc_openURLService openWebURL:OCMOCK_ANY]);
}

- (void)testConnectWithDevAlert {
    [self openFailOpenEmailScreenStub];
    [self.appToolsPresenter appToolsViewDidSelectContactWithDeveloper:self.view];
    
    CCViewModelAlert *alert = [self.appToolsPresenter noEmailAccountAlert];
    OCMVerify([self.router showViewModelAlert:OCMOCK_ANY]);
    expect(alert).to.beValidAlertWithCallbacks(2, @[@1]);
    alert.actions[1].action();
    OCMVerify([self.appToolsPresenter.ioc_openURLService openApplicationSettings]);
}

- (void)testShare {
    [self.appToolsPresenter appToolsViewDidSelectShareApp:self.view];
    
    OCMVerify([self.router openShareScreenWithShareInfo:OCMOCK_ANY]);
}

- (void)testRateApp {
    [self.appToolsPresenter appToolsViewDidSelectRateApp:self.view];
    
    OCMVerify([self.appToolsPresenter.ioc_openURLService openWebURL:OCMOCK_ANY]);
}

@end
