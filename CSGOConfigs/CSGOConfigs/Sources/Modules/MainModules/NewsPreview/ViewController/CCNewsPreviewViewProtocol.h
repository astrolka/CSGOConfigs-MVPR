//
//  CCNewsPreviewViewProtocol.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 14.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCNewsPreviewViewModel.h"
#import "CCMessageViewProtocol.h"
#import "CCSpinerViewProtocol.h"

@protocol CCNewsPreviewViewProtocol;

@protocol CCNewsPreviewViewActionProtocol <NSObject>

- (void)newsPreviewViewDidSet:(id <CCNewsPreviewViewProtocol>)view;

- (void)newsPreviewViewDidOpenMenu:(id <CCNewsPreviewViewProtocol>)view;

- (void)newsPreviewViewDidRefreshNews:(id <CCNewsPreviewViewProtocol>)view;

- (void)newsPreviewView:(id <CCNewsPreviewViewProtocol>)view didSelectNewsAtIndex:(NSUInteger)index;

- (void)newsPreviewView:(id <CCNewsPreviewViewProtocol>)view didScrollNewsAtIndex:(NSUInteger)index;

@end

@protocol CCNewsPreviewViewProtocol <CCSpinerViewProtocol, CCMessageViewProtocol>

@property (nonatomic, strong) id <CCNewsPreviewViewActionProtocol> viewAction;

- (void)showNewNews:(NSArray <CCNewsPreviewViewModel*> *)news;

- (void)showMoreNews:(NSArray <CCNewsPreviewViewModel*> *)news;

@end
