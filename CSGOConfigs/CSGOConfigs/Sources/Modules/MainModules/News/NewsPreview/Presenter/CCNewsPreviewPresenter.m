//
//  CCNewsPreviewPresenter.m
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 14.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCNewsPreviewPresenter.h"
#import "CCNewsPreviewRouterProtocol.h"
#import "CCNewsPreviewViewProtocol.h"
#import "CCNewsServiceProtocol.h"

@interface CCNewsPreviewPresenter () <CCNewsPreviewViewActionProtocol>

@property (nonatomic, strong) id <CCNewsServiceProtocol> ioc_newsService;

@property (nonatomic, weak) id <CCNewsPreviewViewProtocol> view;
@property (nonatomic, strong) id <CCNewsPreviewRouterProtocol> router;

@property (nonatomic, strong) NSMutableArray <CCNewsPreviewViewModel *> *news;
@property (nonatomic, assign) NSUInteger countOfNewsOnServer; // pagination logic

@end

@implementation CCNewsPreviewPresenter

- (instancetype)initWithView:(id <CCNewsPreviewViewProtocol>)view router:(id <CCNewsPreviewRouterProtocol>)router {
    self = [super init];
    if (self) {
        self.router = router;
        self.view = view;
        self.view.viewAction = self;
        
        self.news = [[NSMutableArray alloc] init];
        self.countOfNewsOnServer = 0;
    }
    return self;
}

#pragma mark - CCNewsPreviewViewActionProtocol

- (void)newsPreviewViewDidSet:(id <CCNewsPreviewViewProtocol>)view {
    [self loadNewsFromRefresh:NO];
}

- (void)newsPreviewViewDidOpenMenu:(id <CCNewsPreviewViewProtocol>)view {
    [self.router openSideMenu];
}

- (void)newsPreviewViewDidRefreshNews:(id <CCNewsPreviewViewProtocol>)view {
    [self loadNewsFromRefresh:YES];
}

- (void)newsPreviewView:(id <CCNewsPreviewViewProtocol>)view didSelectNewsAtIndex:(NSUInteger)index {
    CCNewsPreviewViewModel *news = self.news[index];
    [self.router goToNewsDescriptionScreenWithNewsID:news.newsID];
}

- (void)newsPreviewView:(id <CCNewsPreviewViewProtocol>)view didScrollNewsAtIndex:(NSUInteger)index {
    [self loadNewsFromRefresh:NO];
}

#pragma mark - Private

- (void)loadNewsFromRefresh:(BOOL)refresh {
    if (self.news.count == 0 || self.news.count < self.countOfNewsOnServer) {
        if (!refresh) {
            [self.view showSpiner];
        }
        [self.ioc_newsService getNewsPreviewWithOffset:self.news.count data:^(NSArray<CCNewsPreviewViewModel *> *news, BOOL fromServer, NSInteger countOfNewsOnServer) {
            self.countOfNewsOnServer = countOfNewsOnServer;
            [self.news addObjectsFromArray:news];
            if (refresh) {
                [self.view showNewNews:news];
            } else {
                [self.view showMoreNews:news];
                [self.view hideSpiner];
            }
            (fromServer) ?: [self.view showMessageWithText:NSLocalizedString(@"", nil)];
        }];
    }
}

@end
