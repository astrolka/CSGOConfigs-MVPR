//
//  CCEventPinAnnotationView.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 21.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <MapKit/MapKit.h>
@class CCEventPinAnnotationView;

typedef void(^descriptionBlock)(CCEventPinAnnotationView *eventPinAnnotationView, UIButton *button);

@interface CCEventPinAnnotationView : MKPinAnnotationView

@property (nonatomic, copy) descriptionBlock pressDescriptionButton;

@end
