//
//  CCEventsViewController.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 21.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCEventsViewController.h"
#import <MapKit/MapKit.h>
#import "Masonry.h"
#import "CCAnnotationEventViewModel.h"
#import "CCEventPinAnnotationView.h"
#import "UIColor+CC.h"
#import "CCEventTableViewCell.h"
#import "CCEventViewModel.h"
#import "UIView+CCSpiner.h"
#import "UIView+CCMessageView.h"
#import "CCSideMenuFactory.h"

@interface CCEventsViewController () <MKMapViewDelegate, UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) MKMapView *eventsMapView;
@property (nonatomic, strong) NSArray <CCAnnotationEventViewModel *> *annotationEvents;

@property (nonatomic, strong) UIView *eventsTableContainerView;
@property (nonatomic, strong) UIView *eventsTableTopContainerView;
@property (nonatomic, strong) UIButton *showHideTableButton;
@property (nonatomic, strong) UITableView *eventsTableView;
@property (nonatomic, strong) UIRefreshControl *eventsTableRefreshControl;

@property (nonatomic, strong) NSArray <CCEventViewModel *> *events;

@end

@implementation CCEventsViewController

static const CGFloat kCloseEventsTableViewContainerHeight = 52.f;

@synthesize viewAction;

- (void)viewDidLoad {
    [super viewDidLoad];
 
    self.title = NSLocalizedString(@"kPlayerNavigationTitle", nil);
    self.view.backgroundColor = [UIColor whiteColor];
    self.edgesForExtendedLayout = UIRectEdgeNone;
    [self menuButtonSetup];
    [self eventsMapViewSetup];
    [self eventsTableContainerViewSetup];
    [self showHideTableButtonSetup];
    [self eventsTableViewSetup];
    [self eventsTableRefreshControlSetup];
    
    [self.viewAction eventsViewDidSet:self];
}

- (void)menuButtonSetup {
    self.navigationItem.leftBarButtonItem = [CCSideMenuFactory menuBarButtonWithSelector:@selector(actionOpenSideMenu:) forObject:self];
}

- (void)eventsTableContainerViewSetup {
    self.eventsTableContainerView = [[UIView alloc] initWithFrame:CGRectZero];
    
    [self.view addSubview:self.eventsTableContainerView];
    [self.eventsTableContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self.view);
        make.height.equalTo(@(kCloseEventsTableViewContainerHeight));
    }];
    
    self.eventsTableTopContainerView = [[UIView alloc] initWithFrame:CGRectZero];
    
    [self.view addSubview:self.eventsTableTopContainerView];
    [self.eventsTableTopContainerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.right.equalTo(self.eventsTableContainerView);
        make.height.equalTo(@(kCloseEventsTableViewContainerHeight));
    }];
    
    UIView *lineView = [[UIView alloc] initWithFrame:CGRectZero];
    lineView.backgroundColor = [UIColor groupTableViewBackgroundColor];
    
    [self.eventsTableTopContainerView addSubview:lineView];
    [lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self.eventsTableTopContainerView);
        make.height.equalTo(@1);
    }];
}

- (void)showHideTableButtonSetup {
    self.showHideTableButton = [[UIButton alloc] initWithFrame:CGRectZero];
    [self.showHideTableButton addTarget:self action:@selector(actionOpenCloseTableView:) forControlEvents:UIControlEventTouchUpInside];
    self.showHideTableButton.backgroundColor = [[UIColor lightTextColor] colorWithAlphaComponent:0.5];
    UIImage *image = [[UIImage imageNamed:@"openListIcon"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    [self.showHideTableButton setImage:image forState:UIControlStateNormal];
    [self.showHideTableButton.imageView setTintColor:[UIColor cc_themeColor]];
    self.showHideTableButton.layer.cornerRadius = 6.f;
    self.showHideTableButton.layer.masksToBounds = YES;
    
    [self.eventsTableTopContainerView addSubview:self.showHideTableButton];
    [self.showHideTableButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.eventsTableTopContainerView).offset(8);
        make.top.equalTo(self.eventsTableTopContainerView);
        make.height.width.equalTo(@44);
    }];
}

- (void)eventsMapViewSetup {
    self.eventsMapView = [[MKMapView alloc] initWithFrame:CGRectZero];
    self.eventsMapView.delegate = self;

    [self.view addSubview:self.eventsMapView];
    [self.eventsMapView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}

- (void)eventsTableViewSetup {
    self.eventsTableView = [[UITableView alloc] initWithFrame:CGRectZero];
    self.eventsTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.eventsTableView registerClass:[CCEventTableViewCell class] forCellReuseIdentifier:NSStringFromClass([CCEventTableViewCell class])];
    self.eventsTableView.dataSource = self;
    self.eventsTableView.delegate = self;
    
    [self.eventsTableContainerView addSubview:self.eventsTableView];
    [self.eventsTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.equalTo(self.eventsTableContainerView);
        make.top.equalTo(self.eventsTableTopContainerView.mas_bottom);
    }];
}

- (void)eventsTableRefreshControlSetup {
    self.eventsTableRefreshControl = [[UIRefreshControl alloc] init];
    self.eventsTableRefreshControl.tintColor = [UIColor cc_themeColor];
    [self.eventsTableView addSubview:self.eventsTableRefreshControl];
    [self.eventsTableRefreshControl addTarget:self action:@selector(actionRefreshControlUpdated:) forControlEvents:UIControlEventValueChanged];
}

#pragma mark - MKMapViewDelegate

- (MKAnnotationView *)mapView:(MKMapView *)mapView viewForAnnotation:(CCAnnotationEventViewModel *)annotationEvent {
    CCEventPinAnnotationView *annotationView = [[CCEventPinAnnotationView alloc] initWithAnnotation:annotationEvent reuseIdentifier:NSStringFromClass([CCAnnotationEventViewModel class])];
    annotationView.pressDescriptionButton = ^(CCEventPinAnnotationView *eventPinAnnotationView, UIButton *button) {
        [self.viewAction eventsView:self didSelectEventAtIndex:[self.annotationEvents indexOfObject:annotationEvent]];
    };
    return annotationView;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.events.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CCEventTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:NSStringFromClass([CCEventTableViewCell class])];
    cell.event = self.events[indexPath.row];
    return cell;
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    [self.viewAction eventsView:self didSelectEventAtIndex:indexPath.row];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return [CCEventTableViewCell defaultCellHeight];
}

#pragma mark - CCEventsViewProtocol

- (void)showEvents:(NSArray <CCEventViewModel *> *)events {
    self.events = events;
    [self.eventsTableView reloadData];
}

- (void)showAnnotationEvents:(NSArray <CCAnnotationEventViewModel *> *)annotationEvents {
    self.annotationEvents = annotationEvents;
    [self.eventsMapView addAnnotations:self.annotationEvents];
}

#pragma mark - CCSpinerViewProtocol

- (void)showSpiner {
    [self.view cc_showSpiner];
}

- (void)hideSpiner {
    [self.view cc_hideSpiner];
    [self.eventsTableRefreshControl endRefreshing];
}

#pragma mark - CCMessageViewProtocol

- (void)showMessageWithText:(NSString *)text {
    [self.view cc_showMessageWithText:text];
}

#pragma mark - Action

- (void)actionOpenSideMenu:(UIButton *)button {
    [self.viewAction eventsViewDidOpenMenu:self];
}

- (void)actionRefreshControlUpdated:(UIRefreshControl *)refreshControl {
    [self.viewAction eventsViewDidRefreshEvents:self];
}

- (void)actionOpenCloseTableView:(UIButton *)button {
    UIImage *buttonImage = nil;
    if (self.eventsTableContainerView.bounds.size.height == kCloseEventsTableViewContainerHeight) {  // Open
        buttonImage = [[UIImage imageNamed:@"closeListIcon"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        [self.eventsTableContainerView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@280);
        }];
        
    } else {
        buttonImage = [[UIImage imageNamed:@"openListIcon"] imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
        [self.eventsTableContainerView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.equalTo(@(kCloseEventsTableViewContainerHeight));
        }];
    }
    [self.showHideTableButton setImage:buttonImage forState:UIControlStateNormal];
    
    [UIView animateWithDuration:1.5 delay:0.f usingSpringWithDamping:0.5 initialSpringVelocity:1.f options:UIViewAnimationOptionCurveLinear
                     animations:^{
                         [self.view layoutIfNeeded];
                     } completion:nil];
}

@end
