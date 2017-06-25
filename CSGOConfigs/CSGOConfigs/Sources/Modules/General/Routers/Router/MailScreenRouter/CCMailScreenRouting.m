//
//  CCMailScreenRouter.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 24.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCMailScreenRouting.h"
#import <MessageUI/MessageUI.h>

@interface CCMailScreenRouting () <MFMailComposeViewControllerDelegate>

@property (nonatomic, strong) MFMailComposeViewController *mailComposeViewController;

@property (nonatomic, copy) mailResultBlock resultBlock;

@end

@implementation CCMailScreenRouting

- (instancetype)initWithNavigationController:(UINavigationController *)navigationController {
    self = [super initWithNavigationController:navigationController];
    if (self) {
        self.mailComposeViewController = [[MFMailComposeViewController alloc] init];
    }
    return self;
}

- (void)openEmailScreenWithEmailInfo:(CCEmailInfo *)emailInfo withResult:(mailResultBlock)result {
    self.resultBlock = result;
    if ([MFMailComposeViewController canSendMail]) {
        self.mailComposeViewController.mailComposeDelegate = self;
        [self.mailComposeViewController setSubject:emailInfo.subject];
        [self.mailComposeViewController setMessageBody:emailInfo.body isHTML:NO];
        [self.mailComposeViewController setToRecipients:emailInfo.recipients];
        [self.navigationController presentViewController:self.mailComposeViewController animated:YES completion:nil];
    } else {
        if (self.resultBlock) {
            self.resultBlock(CCMailResultNoAccount);
        }
    }
}

#pragma mark - MFMailComposeViewControllerDelegate

- (void)mailComposeController:(MFMailComposeViewController *)controller
          didFinishWithResult:(MFMailComposeResult)result
                        error:(NSError *)error {
    [self.mailComposeViewController dismissViewControllerAnimated:YES completion:^{
        if (self.resultBlock) {
            self.resultBlock((CCMailResult)result);
        }
    }];
}

@end
