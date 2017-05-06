//
//  CCCoreDataProtocol.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 03.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>

@protocol CCCoreDataProtocol <NSObject>

@property (readonly, strong) NSPersistentContainer *persistentContainer;

- (void)saveContext;

@end
