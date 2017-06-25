//
//  CCEmailInfoFactory.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 24.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCEmailInfoFactory.h"
#import "CCPlayerDescriptionViewModel.h"

@implementation CCEmailInfoFactory

+ (CCEmailInfo *)emailInfoWihtPlayer:(CCPlayerDescriptionViewModel *)player {
    CCEmailInfo *emailInfo = [[CCEmailInfo alloc] init];
    emailInfo.recipients = @[@""];
    emailInfo.body = NSLocalizedString(@"", nil);
    emailInfo.subject = NSLocalizedString(@"", nil);
    return emailInfo;
}

+ (CCEmailInfo *)emailInfoForContactWithDeveloper {
    CCEmailInfo *emailInfo = [[CCEmailInfo alloc] init];
    emailInfo.recipients = @[@"olehpetruch@gmail.com"];
    emailInfo.body = NSLocalizedString(@"", nil);
    emailInfo.subject = NSLocalizedString(@"", nil);
    return emailInfo;
}

@end
