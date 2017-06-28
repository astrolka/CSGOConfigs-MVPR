# CS:GO Configs for iOS

CS:GO Configs is my open source application, which highlights architecture  approaches and tricks which i prefer to use for developing IOS applications. You can download it from the [App Store.](https://itunes.apple.com/us/app/configs/id1186056868?l=uk&ls=1&mt=8)

![11111](https://user-images.githubusercontent.com/17677464/27645641-39d4ba5e-5c2f-11e7-8b54-0a5bac69d6df.png)

## Getting Started

1. [Download](https://developer.apple.com/xcode/download/) the Xcode 7.3.1 release.
1. Clone this repository.
1. Run `pod install` to install dependencies.

## Developing Features Overview
### Artitecture
I don't want talk a lot about Apple MVC problems and why artitecture it is so importent for developing, so let's go to my artitecture. I studied most popular IOS artitecture patterns like MVC, MVP, MVVM and VIPER. They have their pros and cons, after some time i came to my mixed artitecture. Let you introduce: MVPR (VVMPSER)
So this architecture content next layers:
* View. Passive view, which shows and detects user's interections, send those actions to Presenter. View doesn't know anything about Presenter, Presenter knows only about ViewProtocol.
* ViewModel. ViewModel stores best prepered properties for View. ViewModels close connect with ViewModelBuilder. ViewModelBuilder is responsible for presentation logic: calculates text height, modifates raw data.
* Presenter. Presenter is the center of the layer, he gots actions from view and decide what to do next. Presenter owns View, Router and Services objects (via protocols).
* Service. Upper layer services work with some type of entities which logical connect with each other, (Friends Service, Auth Service). Services get data from lower layer services (Rest Service, Local StorageSerive), then convert raw data into ViewModel via ViewModelBuilder and send to Presenter.
* Entity. Models without any logic, which only store data.
* Router. Routers are responsible for creating and navigation modules, transferring params between modules.

The diagram of the different components and how they are connected:

![22222](https://user-images.githubusercontent.com/17677464/27645637-39c8c320-5c2f-11e7-9eb9-7fe35e6a4a2b.png)

Looks realy close to [VIPER](https://www.objc.io/issues/13-architecture/viper/), but where are differents?
In VIPER i see two main problems (in 2 layers): Presenter, which is just proxy between View and Interactor and Interactor which is just proxy between Presenter and Services, alose Interactor store some data in properties. I think that the role of Presenter and Interactor in VIPER are excessive. In my artitecture Presenter = VIPER Presenter + VIPER Interactor. So now my Presenter stores data in preperties, works with Services and processes View events. And my Service layer = VIPER Service + ViewModels/ViewModelsBuilder. In my artitecture upper layer Service prepares data for View (ViewModels) via ViewModelBuilder. Now when developer/QA sees some data displayng mistakes, developer knows that the problem in ViewModelBuilder (most likely). ViewModel/ViewModelBuilder helps you with reusing code in different classes.

The diagram of abstract Friend entity flow in my artitecture:

![3333333](https://user-images.githubusercontent.com/17677464/27645642-39d69aa4-5c2f-11e7-9455-6bc7cb29a1d5.png)

### Code Reuse
We have 3 screens with partly reusing components.

![444444](https://user-images.githubusercontent.com/17677464/27645640-39cfe664-5c2f-11e7-9209-6e0dc0e355c7.png)
Let's separate components into zones:
1. Pink (TeamsView): we are sure that we need this UI only on one screen.
2. Yellow (PlayersListView): need to show the same UI but with different data sources.
3. Red (Banner): need to implement the same UI/data source/routing on multi screens. 
#### Solution:
1. We can create UI(collectionView) just in TeamsViewController.
2. Let's create separate custom view (PlayersListView) with it's own inteface/viewActions (delegate) and use it in different ViewControllers. 

PlayersListView interface:
```objective-c
#import <UIKit/UIKit.h>
@class CCPlayersListView;
@class CCPlayerPreviewViewModel;

@protocol CCPlayersListViewActionProtocol <NSObject>

- (void)playersListView:(CCPlayersListView *)view didSelectPlayerAtIndex:(NSUInteger)index;

@optional

- (void)playersListView:(CCPlayersListView *)view didScrollPlayerAtIndex:(NSUInteger)index;

@end

@interface CCPlayersListView : UIView

@property (nonatomic, weak) id <CCPlayersListViewActionProtocol> viewAction;

@property (nonatomic, strong, readonly) UICollectionView *collectionView;

- (instancetype)initWithColumnsInSection:(NSUInteger)columnsInSection cellSpaces:(CGFloat)space;

- (void)showPlayers:(NSArray <CCPlayerPreviewViewModel *> *)players;

@end
```
Now use this view in different ViewControllers:
```objective-c
- (void)playersViewSetup {
    self.playersListView = [[CCPlayersListView alloc] initWithColumnsInSection:kColumnsInSection cellSpaces:kCellSpaces];
    //[self bindNavigationBarToScrollView:self.playersListView.collectionView];
    self.playersListView.viewAction = self;
    
    [self.view addSubview:self.playersListView];
    [self.playersListView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bannerView.mas_bottom);
        make.left.right.equalTo(self.view);
        make.bottom.equalTo(self.view).offset(kCellSpaces);
    }];
}

#pragma mark - CCPlayersListViewActionProtocol

- (void)playersListView:(CCPlayersListView *)view didSelectPlayerAtIndex:(NSUInteger)index {
    [self.viewAction playersPreviewView:self didSelectPlayerAtIndex:index];
}

- (void)playersListView:(CCPlayersListView *)view didScrollPlayerAtIndex:(NSUInteger)index {
    [self.viewAction playersPreviewView:self didScrollPlayerAtIndex:index];
}

#pragma mark - CCPlayersPreviewViewProtocol

- (void)showPlayers:(NSArray <CCPlayerPreviewViewModel *> *)players {
    [self.playersListView showPlayers:players];
}
...
```

3. In simple cases, one screen corresponds to one module, but there can also be complex screens with several modules.

![555555](https://user-images.githubusercontent.com/17677464/27645638-39ca703a-5c2f-11e7-8783-6192cbccaffe.png)

Main(module) View (PlayersPreviewViewController) initialized with some view class which implement BannerView protocol. PlayersPreviewViewController only adds this view on his main view. This is the only connection between those modules.
BannerPresenter initialized together with his View and Router (via protocols), Banner Presenter saves his view property and work with his View/Router separetly from main Presenter. Main Presenter does't even know that his View has some BannerView. Banner Presenter does't know how implement his View, where is it. Routers in submodules works via UINavigationController, so ther is no problem that View is a UIView class, is't UIViewController.

Build complex module:
```objective-c
- (id <CCPlayersPreviewViewProtocol>)buildModule {
    CCBannerRouter *bannerRouter = [[CCBannerRouter alloc] initWithNavigationController:self.navigationController];
    CCPlayersPreviewViewController *view = [[CCPlayersPreviewViewController alloc] initWithBannerView:[bannerRouter buildModule]];
    CCPlayersPreviewPresenter *presenter = [[CCPlayersPreviewPresenter alloc] initWithView:view router:self];
    #pragma unused(presenter)
    return view;
}
```

View main module (PlayersPreviewViewController):
```objective-c
- (void)bannerViewSetup {
    [self.view addSubview:self.bannerView];
    [self.bannerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.top.equalTo(self.view);
        make.height.equalTo(@100);
    }];
}
```
### Web module
We know that class UIWebview has few methos like: `reload`, `goBack`, `loadURL`, `canGoBack` and more.
Firstly i decided to add WebView methods on View Protocols (`reload`, `goBack`, `loadURL`, `canGoBack`). So View (protocol) will have all UIWebview methods and Presenter will work with it, so View class becomes just proxy class.
Problems: 
* View does all "hard" work, which does't correspond to my architecture.
* View layer just dublicate all UIWebView methods/delegate methods. 

![6666](https://user-images.githubusercontent.com/17677464/27645639-39ce0cd6-5c2f-11e7-86f3-8c3f8eefa885.png)


My solution: Create separate Service(WebPresentationService), which initialized with UIWebview. Dublicate UIWebview class functions in this Service. So Presenter will work with сonvenient API, connected UIWebview object will updated via Service.
So Presenter does't know about UIWebView, UIView does't make "hard" logic.

![77777](https://user-images.githubusercontent.com/17677464/27645644-39e9903c-5c2f-11e7-9ad9-9814c0f0a937.png)

WebPresentationServiceProtocol:
```objective-c
@protocol CCWebPresentationServiceProtocol <NSObject>

@property (nonatomic, readonly, getter=canGoBack) BOOL canGoBack;
@property (nonatomic, readonly, getter=canGoForward) BOOL canGoForward;
@property (nonatomic, readonly, getter=isLoading) BOOL loading;

- (void)loadURL:(NSURL *)url startLoad:(webPresentationStartLoadBlock)startLoad finishLoad:(webPresentationFinishLoadBlock)finishLoad failLoad:(webPresentationDidFailLoadBlock)failLoad;

- (void)reload;
- (void)stopLoading;

- (void)goBack;
- (void)goForward;

- (NSURL *)currentURL;

@end
```

Example usage in Presenter:

```objective-c
#pragma mark - CCWebViewActionProtocol

- (void)webViewDidSet:(id <CCWebViewProtocol>)view { 
    [self.webPresentationService loadURL:self.url startLoad:^{
        [self.view showSpiner];
    } finishLoad:^{
        [self.view hideSpiner];
    } failLoad:^(NSError *error) {
        [self.view hideSpiner];
        [self.view showMessageWithText:NSLocalizedString(@"error.unknown", nil)];
    }];
}

- (void)webViewDidPressWebBackButton:(id <CCWebViewProtocol>)view {
    if ([self.webPresentationService canGoBack]) {
        [self.webPresentationService goBack];
    }
}
...
 ```
 ### Alers
IOS Alert is very important component in IOS applications, IOS developers offen work with them. So i want to share my experience how i working with UIAlertViewControllers in my projects.
Firstly i decidet to implement all alerts in View layer. So Presenter calls View show an alert, View show the alert, detect user action and send the action to Presenter. 
Problems: 
* One alert with 2 buttons = 1 method show alert + 2 viewActions (delegate to Presenter). So Module with 3 alerts has 9 methods/viewActions.
* Hard to read Presenter code. Imagine that in Presenter we call View show some alert in one method (~ 50 line) and get responce (delegate method) in another method (~ 100 line) :
```objective-c
#pragma mark - CCSomeViewActionProtocol

- (void)someViewSelectdeleteAvatar:(id <SomeViewProtocol>)view {
    [self.view showConfirmAlert];
}

...

- (void)someViewConfirmDeleteAvatar:(id <SomeViewProtocol>)view {
    ...
}
```
* Alert is UIAlertViewController class, so Router should show them, not View.
 
Solution: Create wrap data source classes (ViewModelAlert, ViewModelAlertAction). Work with those classes in Presenter, call Router to show them. Router via ViewModelAlertTransformmer transforms ViewModelAlert into UIAlertViewController, Router shows UIAlertViewController.
Alert flow in the diagram:

![8888](https://user-images.githubusercontent.com/17677464/27645643-39e3c1d4-5c2f-11e7-8bbe-9f281ccb95da.png)

ViewModelAlert:
```objective-c
 typedef NS_ENUM(NSInteger, CCViewModelAlertStyle) {
    CCViewModelAlertStyleAlert, // by default
    CCViewModelAlertStyleActionSheet,
    CCViewModelAlertStyleHTML // custom view which looks like IOS alert
};

@interface CCViewModelAlert : NSObject

- (instancetype)initWithTitle:(NSString *)title message:(NSString *)message;

@property (nonatomic, assign) CCViewModelAlertStyle style;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) NSString *message;
@property (nonatomic, strong, readonly) NSMutableArray <CCViewModelAlertAction *> *actions;

- (void)addAction:(CCViewModelAlertAction *)action;

@end
 ```
CCViewModelAlertAction:

 ```objective-c
 typedef NS_ENUM(NSInteger, CCViewModelAlertActionStyle) {
    CCViewModelAlertActionStyleDefault,  // by default
    CCViewModelAlertActionStyleDestructive,
    CCViewModelAlertActionStyleCancel,
};

typedef void(^CCViewModelAlertActionBlock)();

@interface CCViewModelAlertAction : NSObject

- (instancetype)initWithTitle:(NSString *)title action:(CCViewModelAlertActionBlock)action;

@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) CCViewModelAlertActionStyle style;
@property (nonatomic, copy) CCViewModelAlertActionBlock action;

+ (instancetype)cancelActionWithAction:(CCViewModelAlertActionBlock)action;

@end

 ```
 
 Example usage in Presenter:
 ```objective-c
 
 - (void)appToolsViewDidSelectContactWithDeveloper:(id <CCAppToolsViewProtocol>)view {
    [self.router openEmailScreenWithEmailInfo:[CCEmailInfoFactory emailInfoForContactWithDeveloper] withResult:^(CCMailResult result) {
        if (result == CCMailResultNoAccount) {
            [self.router showViewModelAlert:[self noEmailAccountAlert]];
        }
    }];
}
 
 - (CCViewModelAlert *)noEmailAccountAlert {
    CCViewModelAlert *alert = [[CCViewModelAlert alloc] initWithTitle:NSLocalizedString(@"email.no_account_message", nil) message:NSLocalizedString(@"email.no_account_message", nil)];
    [alert addAction:[CCViewModelAlertAction cancelActionWithAction:nil]];
    CCViewModelAlertAction *settingsAlertAction = [[CCViewModelAlertAction alloc] initWithTitle:NSLocalizedString(@"alerts.settings_button.title", nil) action:^{
        [self.ioc_openURLService openApplicationSettings];
    }];
    [alert addAction:settingsAlertAction];
    return alert;
}

 ```
With custom matcher (via [Expecta](https://github.com/specta/expecta)) it's easy to testing. We can testing count of buttons in alert and their actions.
Example of testing ViewModelAlert:

 ```objective-c
 - (void)testConnectWithDevAlert {
    [self openFailOpenEmailScreenStub];
    [self.appToolsPresenter appToolsViewDidSelectContactWithDeveloper:self.view];
    
    CCViewModelAlert *alert = [self.appToolsPresenter noEmailAccountAlert];
    OCMVerify([self.router showViewModelAlert:OCMOCK_ANY]);
    expect(alert).to.beValidAlertWithCallbacks(2, @[@1]);
    alert.actions[1].action();
    OCMVerify([self.appToolsPresenter.ioc_openURLService openApplicationSettings]);
}
 ```
 
### StaticTableView
IOS static tables are very popular in IOS apps and developers offen work with them. It's hard to work with static tableViews cuz their data are separated and can't be collected in dataSource (array, dictionary). So what to do if we need to hide/show some sections/cells? I think for static tableViews you has seen code like this:
 ```objective-c
 - (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
       switch (indexPath.section) {
        case SomeEnumSectionType:
            if (indexPath.row == kUserAvatarIndex) {
                ...
            }
            break;
        case SomeAnotherEnumSectionType:
            ...
            break;
        default:
            break;
    }
}
 ```
It's realy hard to read, add new functions.
Solution: create wrapped DataSoruceModel, setup them in View and update custom view with this data source.
Example of creating storage section with one cell:
  ```objective-c
  - (CCSettingsSectionDataSource *)storageSectionSetup {
    self.cacheRow = [[CCSettingsRowDataSource alloc] initWithImage:[UIImage imageNamed:@"appToolCache"] title:NSLocalizedString(@"app_tools.cell.clear_cache", nil) detail:nil];
    __weak __typeof(self)wself = self;
    self.cacheRow.selectAction = ^() {
        [wself.viewAction appToolsViewDidSelectClearCache:wself];
    };
    
    CCSettingsSectionDataSource *storageSection = [[CCSettingsSectionDataSource alloc] initWithRows:@[self.cacheRow]];
    return storageSection;
}

- (void)appStaticTableViewSetup {
    self.appStaticTableView = [[CCStaticTableView alloc] initWithDataSource:self.settingsDataSource];
    
    [self.view addSubview:self.appStaticTableView];
    [self.appStaticTableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(self.view);
    }];
}
  ```
## Todo

* Multithreading core data
* Finish unit tests
* Swift version
  
## Contributing

I intend for this project to be an educational resource: i am excited to share my wins, mistakes, and methodology of iOS development. My primary focus is to continue improving my skill. I am ready for your remarks and ideas.

## Find this interesting?

You can contact with me olehpetruch@gmail.com

## License

CS:GO Configs is available under the MIT license. See the [LICENSE](LICENSE) file for more info.
