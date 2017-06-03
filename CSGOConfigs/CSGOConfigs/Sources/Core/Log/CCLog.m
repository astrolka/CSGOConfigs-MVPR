//
//  CCLog.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 14.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCLog.h"

void CCLog(NSString *format, ...) {
    #if LOGS_ENABLED
        va_list argumentList;
        va_start(argumentList, format);
        NSLogv(format, argumentList);
    #endif
}
