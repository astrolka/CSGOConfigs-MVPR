//
//  CCPlayersPreviewViewProtocol.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 14.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
@protocol CCPlayersPreviewViewProtocol;

@protocol CCPlayersPreviewViewActionProtocol <NSObject>

//- (BOOL)textViewShouldBeginEditing:(UITextView *)textView;

- (void)playersPreviewView:(id <CCPlayersPreviewViewProtocol>)view didSelectPlayerAtIndex:(NSInteger)index;

@end

@protocol CCPlayersPreviewViewProtocol <NSObject>

@property (nonatomic, strong) id <CCPlayersPreviewViewActionProtocol> viewAction;

@end
