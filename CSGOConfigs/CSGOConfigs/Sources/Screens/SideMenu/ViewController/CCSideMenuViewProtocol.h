//
//  CCSideMenuViewProtocol.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 05.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, CCSideMenuViewAppSections) {
    CCSideMenuViewPlayersAppSection,
    CCSideMenuViewTeamsAppSection,
    CCSideMenuViewFavoritesAppSection,
    CCSideMenuViewNewsAppSection,
    CCSideMenuViewMapEventsAppSection,
    CCSideMenuViewSkinsAppSection,
    CCSideMenuViewToolsAppSection
};

@protocol CCSideMenuViewActionProtocol <NSObject>

- (void)didSelectAppSection:(CCSideMenuViewAppSections)appSection;

@end

@protocol CCSideMenuViewProtocol <NSObject>

@property (nonatomic, strong) id <CCSideMenuViewActionProtocol> viewAction;

@end
