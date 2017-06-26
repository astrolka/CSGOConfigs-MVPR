//
//  CCEventsServiceProtocol.h
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 21.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AppleGuice/AppleGuiceInjectable.h>
#import "CCAnnotationEventViewModel.h"
#import "CCEventViewModel.h"

typedef void(^serviceEventsDataBlock)(NSArray <CCEventViewModel *> *events, NSArray <CCAnnotationEventViewModel *> *annotationEvents, BOOL fromServer);

@protocol CCEventsServiceProtocol <AppleGuiceInjectable>

- (void)getEvents:(serviceEventsDataBlock)events;

@end
