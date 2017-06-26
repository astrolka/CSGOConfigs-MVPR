//
//  CCSideMenuPresenter.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 05.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCSideMenuPresenter.h"
#import "CCSideMenuRouterProtocol.h"
#import "CCSideMenuViewProtocol.h"

@interface CCSideMenuPresenter () <CCSideMenuViewActionProtocol>

@property (nonatomic, weak) id <CCSideMenuViewProtocol> view;
@property (nonatomic, strong) id <CCSideMenuRouterProtocol> router;

@end

@implementation CCSideMenuPresenter

- (instancetype)initWithView:(id <CCSideMenuViewProtocol>)view router:(id <CCSideMenuRouterProtocol>)router {
    self = [super init];
    if (self) {
        self.router = router;
        self.view = view;
        self.view.viewAction = self;
    }
    return self;
}

#pragma mark - CCSideMenuViewActionProtocol

- (void)didSelectAppSection:(CCSideMenuViewAppSections)appSection {
    switch (appSection) {
        case CCSideMenuViewPlayersAppSection:
            [self.router goToPlayersPreviewScreen];
            break;
            
        case CCSideMenuViewTeamsAppSection:
            [self.router goToTeamsScreen];
            break;
            
        case CCSideMenuViewFavoritesAppSection:
            [self.router goToFavoritePlayersScreen];
            break;
            
        case CCSideMenuViewNewsAppSection:
            [self.router goToNewsPreviewScreen];
            break;
            
        case CCSideMenuViewMapEventsAppSection:
            [self.router goToMapEventsScreen];
            break;
            
        case CCSideMenuViewSkinsAppSection:
            [self.router goToSkinsScreen];
            break;
            
        case CCSideMenuViewToolsAppSection:
            [self.router goToAppToolsScreen];
            break;
            
        default:
            break;
    }
}

@end
