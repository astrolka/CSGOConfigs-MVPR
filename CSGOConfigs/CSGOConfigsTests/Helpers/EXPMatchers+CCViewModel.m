//
//  EXPMatchers+CCViewModel.m
//  CSGOConfigs
//
//  Created by Oleg Petruchyk on 27.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "EXPMatchers+CCViewModel.h"

EXPMatcherImplementationBegin(beValidAlert, (NSUInteger expectedNumberOfActions)) {
    
    CCViewModelAlert *alert = actual;
    BOOL alertIsNotKindOfAlert = ![actual isKindOfClass:[CCViewModelAlert class]];
    BOOL alertIsNil = (alert == nil);
    BOOL actionsAreNil = (alert.actions == nil);
    NSUInteger actualCount = alert.actions.count;
    
    prerequisite(^BOOL{
        return !(alertIsNil || actionsAreNil || alertIsNotKindOfAlert);
    });
    
    match(^BOOL{
        return alert.actions.count == expectedNumberOfActions;
    });
    
    failureMessageForTo(^NSString *{
        if(alertIsNil || alertIsNotKindOfAlert) {
            return @"the CCViewModelAlert is nil or is not kind of CCViewModelAlert";
        }
        
        if(actionsAreNil) {
            return @"the CCViewModelAlert actions property is nil";
        }
        
        return [NSString stringWithFormat:@"expected: a number of actions to be count of %lu, got: number of actions is %lu", (unsigned long)expectedNumberOfActions, (unsigned long)actualCount];
    });
    
    failureMessageForNotTo(^NSString *{
        if(alertIsNil || alertIsNotKindOfAlert) {
            return @"the CCViewModelAlert is nil or is not kind of CCViewModelAlert";
        }
        
        if(actionsAreNil) {
            return @"the CCViewModelAlert actions property is not nil";
        }
        
        return [NSString stringWithFormat:@"expected: a number of actions to be count of %lu, got: number of actions is %lu", (unsigned long)expectedNumberOfActions, (unsigned long)actualCount];
    });
}
EXPMatcherImplementationEnd

EXPMatcherImplementationBegin(beValidAlertWithCallbacks, (NSUInteger expectedNumberOfActions, NSArray *expectedActionIndexes)) {
    
    CCViewModelAlert *alert = actual;
    BOOL alertIsNotKindOfAlert = ![actual isKindOfClass:[CCViewModelAlert class]];
    BOOL alertIsNil = (alert == nil);
    BOOL actionsAreNil = (alert.actions == nil);
    BOOL expectedActionsIndexesIsNil = (expectedActionIndexes == nil);
    NSUInteger actualCount = alert.actions.count;
    
    prerequisite(^BOOL{
        return !(alertIsNil || actionsAreNil || expectedActionsIndexesIsNil || alertIsNotKindOfAlert);
    });
    
    BOOL countOfActionsMatch = (actualCount == expectedNumberOfActions);
    
    match(^BOOL{
        if (!countOfActionsMatch) {
            return NO;
        }
        
        for (NSUInteger i = 0; i < actualCount; i++) {
            if ([expectedActionIndexes containsObject:@(i)]) {
                if (alert.actions[i].action == nil) {
                    return NO;
                }
            }
        }
        
        return YES;
    });
    
    failureMessageForTo(^NSString *{
        if(alertIsNil || alertIsNotKindOfAlert) {
            return @"the CCViewModelAlert is nil or is not kind of CCViewModelAlert";
        }
        
        if(actionsAreNil) {
            return @"the CCViewModelAlert actions property is nil";
        }
        
        if (expectedActionsIndexesIsNil) {
            return @"the expectedActionIndexesIsNil is nil";
        }
        
        if (!countOfActionsMatch) {
            return [NSString stringWithFormat:@"expected: a number of actions to be count of %lu, got: number of actions is %lu", (unsigned long)expectedNumberOfActions, (unsigned long)actualCount];
        }
        
        return @"some of callbacks expected to not be nil are nil";
    });
    
    failureMessageForNotTo(^NSString *{
        if(alertIsNil || alertIsNotKindOfAlert) {
            return @"the CCViewModelAlert is nil or is not kind of CCViewModelAlert";
        }
        
        if(actionsAreNil) {
            return @"the CCViewModelAlert actions property is not nil";
        }
        
        if (!countOfActionsMatch) {
            return [NSString stringWithFormat:@"expected: a number of actions to be count of %lu, got: number of actions is %lu", (unsigned long)expectedNumberOfActions, (unsigned long)actualCount];
        }
        
        return @"some of callbacks expected to be nil are not nil";
    });
}
EXPMatcherImplementationEnd
