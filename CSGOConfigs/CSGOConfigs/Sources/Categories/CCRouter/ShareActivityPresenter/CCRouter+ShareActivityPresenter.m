//
//  CCRouter+ShareActivityPresenter.m
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 25.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCRouter+ShareActivityPresenter.h"
#import <UIKit/UIActivityViewController.h>
#import <UIKit/UIActivity.h>
#import "CCShareInfo.h"

@implementation CCRouter (ShareActivityPresenter)

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
