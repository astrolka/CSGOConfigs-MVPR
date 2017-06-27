//
//  EXPMatchers+CCViewModel.h
//  CSGOConfigs
//
//  Created by Oleg Petruchyk on 27.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Expecta/Expecta.h>
#import "CCViewModelAlert.h"

/*
    Check if alert is not nil and has {expectedNumberOfActions} actions inside
*/

EXPMatcherInterface(beValidAlert, (NSUInteger expectedNumberOfActions));

/*
    Check if alert is not nil and has {expectedNumberOfActions} actions inside, also checks that actions listed in {expectedActionIndexes} have callbacks and they are not nil.
*/

EXPMatcherInterface(beValidAlertWithCallbacks, (NSUInteger expectedNumberOfActions, NSArray *expectedActionIndexes));
