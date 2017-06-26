//
//  CCNewsDescriptionPresenter.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 18.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCNewsDescriptionPresenter.h"
#import "CCNewsDescriptionRouterProtocol.h"
#import "CCNewsDescriptionViewProtocol.h"
#import "CCNewsServiceProtocol.h"

@interface CCNewsDescriptionPresenter () <CCNewsDescriptionViewActionProtocol>

@property (nonatomic, strong) id <CCNewsServiceProtocol> ioc_newsService;

@property (nonatomic, strong) id <CCNewsDescriptionViewProtocol> view;
@property (nonatomic, strong) id <CCNewsDescriptionRouterProtocol> router;

@property (nonatomic, strong) CCNewsDescriptionViewModel *newsDescriptionViewModel;

@property (nonatomic, assign) NSInteger newsID;

@end

@implementation CCNewsDescriptionPresenter

- (instancetype)initWithView:(id <CCNewsDescriptionViewProtocol>)view router:(id <CCNewsDescriptionRouterProtocol>)router newsID:(NSUInteger)newsID {
    self = [super init];
    if (self) {
        self.router = router;
        self.view = view;
        self.view.viewAction = self;
        
        self.newsID = newsID;
    }
    return self;
}

#pragma mark - CCNewsDescriptionViewActionProtocol

- (void)newsDescriptionViewDidSet:(id <CCNewsDescriptionViewProtocol>)view {
    [self getNewsDescription];
}

- (void)newsDescriptionViewDidPressMoreInfoButton:(id <CCNewsDescriptionViewProtocol>)view {
    [self.router goToWebScreenWithURL:self.newsDescriptionViewModel.descriptionURL];
}

#pragma mark - Private

- (void)getNewsDescription {
    [self.view showSpiner];
    [self.ioc_newsService getNewsDescriptionWithNewsID:self.newsID data:^(CCNewsDescriptionViewModel *newsDescriptionViewModel, BOOL fromServer) {
        [self.view hideSpiner];
        if (newsDescriptionViewModel) {
            [self.view showNewsDescription:newsDescriptionViewModel];
            (fromServer) ?: [self.view showMessageWithText:NSLocalizedString(@"", nil)];
        } else {
            [self.view showMessageWithText:NSLocalizedString(@"", nil)];
        }
    }];
}

@end
