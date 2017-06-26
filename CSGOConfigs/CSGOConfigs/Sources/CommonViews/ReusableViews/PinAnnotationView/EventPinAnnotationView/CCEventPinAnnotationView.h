//
//  CCEventPinAnnotationView.h
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 21.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <MapKit/MapKit.h>
@class CCEventPinAnnotationView;

typedef void(^descriptionBlock)(CCEventPinAnnotationView *eventPinAnnotationView);

@interface CCEventPinAnnotationView : MKPinAnnotationView

@property (nonatomic, copy) descriptionBlock pressDescriptionButton;

@end
