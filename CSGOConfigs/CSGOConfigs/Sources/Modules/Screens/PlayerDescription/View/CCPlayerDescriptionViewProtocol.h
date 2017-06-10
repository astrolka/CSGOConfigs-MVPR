//
//  CCPlayerDescriptionViewProtocol.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 11.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol CCPlayerDescriptionViewProtocol;

@protocol CCPlayerDescriptionViewActionProtocol <NSObject>

- (void)playersPreviewViewDidSet:(id <CCPlayerDescriptionViewProtocol>)view;

- (void)playersPreviewViewDidPressLoadButton:(id <CCPlayerDescriptionViewProtocol>)view;

- (void)playersPreviewViewDidPressFavoritePlayer:(id <CCPlayerDescriptionViewProtocol>)view;

@end

@protocol CCPlayerDescriptionViewProtocol <NSObject>

@property (nonatomic, strong) id <CCPlayerDescriptionViewActionProtocol> viewAction;

@end
