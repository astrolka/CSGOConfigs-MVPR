//
//  CCSkinServerModelTests.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 26.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <XCTest/XCTest.h>
#import <Expecta/Expecta.h>
#import "CCSkinServerModel.h"

@interface CCSkinServerModelTests : XCTestCase

@end

@implementation CCSkinServerModelTests

- (void)testWeaponParsing {
    NSString *responce = @"{type:history_go,data:[310776580,302028390,G3SG1 | Jungle Dashed (Field-Tested),Сегодня 00:19,53,G3SG1 | Тропическая штриховка (После полевых испытаний),#000000]}";
    CCSkinServerModel * skinServerModel = [[CCSkinServerModel alloc] initWithServerResponce:responce];
    
    expect(skinServerModel.gunName).to.equal(@"G3SG1");
    expect(skinServerModel.gunSkin).to.equal(@"Jungle Dashed");
    expect(skinServerModel.exterior).to.equal(@"Field-Tested");
}

- (void)testStickerParsing {
    NSString *responce = @"{type:history_go,data:[341291325,188530139,Sticker | Luck Skill,Сегодня 17:16,3735,Наклейка | Везунчик,#000000]}";
    CCSkinServerModel *skinServerModel = [[CCSkinServerModel alloc]initWithServerResponce:responce];
    
    expect(skinServerModel).to.beNil;
}

- (void)testCaseParsing {
    NSString *responce = @"{type:history_go,data:[1797256701,0,Gamma Case,Сегодня 00:24,118,Gamma Case,#000000]}";
    CCSkinServerModel *skinServerModel = [[CCSkinServerModel alloc]initWithServerResponce:responce];

    expect(skinServerModel).to.beNil;
}

@end
