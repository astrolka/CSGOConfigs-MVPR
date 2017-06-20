//
//  CCAnnotationEventViewModel.h
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 21.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MKAnnotation.h>
@class CCEventCoreDataModel;
@class CCEventServerModel;
@class CCEventViewModel;

@interface CCAnnotationEventViewModel : NSObject <MKAnnotation>

@property (nonatomic, assign) CLLocationCoordinate2D coordinate;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;

@property (strong, nonatomic) NSURL *desctiptionURL;
@property (strong, nonatomic) NSURL *logoImageURL;

@end



typedef void(^annotationEventsDataBlock)(NSArray <CCAnnotationEventViewModel *> *events);

@interface CCAnnotationEventViewModelBuildr : NSObject

+ (void)buildWithCoreDataModel:(NSArray <CCEventCoreDataModel *> *)coreDataModels
                     viewModel:(annotationEventsDataBlock)viewModel;

+ (void)buildWithServerModel:(NSArray <CCEventServerModel *> *)serverModels
                   viewModel:(annotationEventsDataBlock)viewModel;

@end
