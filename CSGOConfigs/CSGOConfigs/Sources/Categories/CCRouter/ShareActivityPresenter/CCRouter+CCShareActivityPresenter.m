//
//  CCRouter+CCShareActivityPresenter.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 25.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCRouter+CCShareActivityPresenter.h"
#import "CCShareInfo.h"
#import <UIKit/UIActivityViewController.h>
#import <UIKit/UIActivity.h>

@implementation CCRouter (CCShareActivityPresenter)

- (void)cc_presentShareActivityViewControllerWithShareInfo:(CCShareInfo *)shareInfo {
    UIActivityViewController *activityViewController = [[UIActivityViewController alloc] initWithActivityItems:[shareInfo objectsToShareInArray] applicationActivities:nil];
    NSArray *excludedActivities = @[UIActivityTypeAirDrop,
                                    UIActivityTypePrint,
                                    UIActivityTypeAssignToContact,
                                    UIActivityTypeSaveToCameraRoll,
                                    UIActivityTypeAddToReadingList,
                                    UIActivityTypePostToFlickr,
                                    UIActivityTypePostToFacebook,
                                    UIActivityTypePostToTwitter,
                                    UIActivityTypeMail,
                                    UIActivityTypePostToVimeo];
    activityViewController.excludedActivityTypes = excludedActivities;
    [self.navigationController presentViewController:activityViewController animated:YES completion:nil];
}

@end
