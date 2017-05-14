//
//  CCRestService.m
//  CSGOConfigs
//
//  Created by Петрічук Олег Аркадійовіч on 13.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCRestService.h"
#import <AFNetworking/AFNetworking.h>

@interface CCRestService ()

@property (strong, nonatomic) AFHTTPSessionManager *requestOperationManager;

@end

@implementation CCRestService

- (instancetype)init {
    self = [super init];
    if (self) {
        self.requestOperationManager = [[AFHTTPSessionManager alloc]initWithBaseURL:nil];
        self.requestOperationManager.requestSerializer = [AFJSONRequestSerializer serializer];
    }
    return self;
}

- (void)makeGETRequestWithURL:(NSURL *)url withParams:(NSDictionary *)params onSucess:(successBlock)success onFailure:(errorBlock)failure {
    [self.requestOperationManager GET:url.absoluteString parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

- (void)makePOSTRequestWithURL:(NSURL *)url withParams:(NSDictionary *)params onSucess:(successBlock)success onFailure:(errorBlock)failure {
    [self.requestOperationManager POST:url.absoluteString parameters:params progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        failure(error);
    }];
}

@end
