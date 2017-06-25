//
//  CCOpenURLService.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 24.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCOpenURLService.h"
#import <UIKit/UIApplication.h>

@implementation CCOpenURLService

#pragma mark - CCOpenURLServiceProtocol

- (void)openWebURL:(NSURL *)url {
    NSString *websiteURLString = [url absoluteString];
    if([websiteURLString  rangeOfString:@"://"].location == NSNotFound) {
        websiteURLString = [@"http://" stringByAppendingString:websiteURLString];
    };
    NSURL *modifiedWebsiteURL = [NSURL URLWithString:websiteURLString];
    [self checkAndOpenURL:modifiedWebsiteURL];
}

- (void)promtCallTo:(NSString *)number {
    number = [number stringByReplacingOccurrencesOfString:@" " withString:@""];
    number = [number stringByReplacingOccurrencesOfString:@"." withString:@""];
    NSString *callScheme = [NSString stringWithFormat:@"telprompt://%@", number];
    NSURL *callURL = [NSURL URLWithString:callScheme];
    [self checkAndOpenURL:callURL];
}

- (void)openApplicationSettings {
    NSURL *settingsUrl = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
    [self checkAndOpenURL:settingsUrl];
}
- (void)launchAppleEmailWithEmailInfo:(CCEmailInfo *)emailInfo {
    NSParameterAssert(emailInfo);
    NSString *toEmail = [emailInfo.recipients firstObject];
    if (!toEmail) {
        NSAssert(emailInfo.recipients, @"Can't be empty recipients");
    } else {
        NSString *emailStr = [NSString stringWithFormat:@"mailto:%@?subject=%@&body=%@", toEmail, emailInfo.subject, emailInfo.body];
        [self checkAndOpenURL:[NSURL URLWithString:emailStr]];
    }
}

#pragma mark - Private

- (void)checkAndOpenURL:(NSURL *)url {
    if ([[UIApplication sharedApplication] canOpenURL:url]) {
        [[UIApplication sharedApplication] openURL:url];
    }
}

@end
