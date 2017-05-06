//
//  CCCoreDataService.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 03.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCCoreDataService.h"

@interface CCCoreDataService ()

@property (nonatomic, readwrite, strong) NSPersistentContainer *persistentContainer;

@end

@implementation CCCoreDataService

#pragma mark -CCCoreDataProtocol

- (void)saveContext {
    NSManagedObjectContext *context = self.persistentContainer.viewContext;
    NSError *error = nil;
    if ([context hasChanges] && ![context save:&error]) {
        NSLog(@"Unresolved error %@, %@", error, error.userInfo);
        abort();
    }
}

@synthesize persistentContainer = _persistentContainer;

- (NSPersistentContainer *)persistentContainer {
    @synchronized (self) {
        if (_persistentContainer == nil) {
            _persistentContainer = [[NSPersistentContainer alloc] initWithName:@"CSGOConfigs"];
            [_persistentContainer loadPersistentStoresWithCompletionHandler:^(NSPersistentStoreDescription *storeDescription, NSError *error) {
                if (error != nil) {
                    NSLog(@"Unresolved error %@, %@", error, error.userInfo);
                    abort();
                }
            }];
        }
    }
    
    return _persistentContainer;
}

@end
