//
//  CCRestService.m
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 13.05.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import "CCRestService.h"
#import <AFNetworking/AFNetworking.h>
#import "CCLog.h"

@interface CCRestService ()

@property (strong, nonatomic) AFHTTPSessionManager *requestOperationManager;

@end

NSString * const kServerBaseURL = @"https://cscoconfigs.firebaseio.com/";

@implementation CCRestService

- (instancetype)init {
    self = [super init];
    if (self) {
        self.requestOperationManager = [[AFHTTPSessionManager alloc] initWithBaseURL:[NSURL URLWithString:kServerBaseURL]];
        self.requestOperationManager.requestSerializer = [AFJSONRequestSerializer serializer];
    }
    return self;
}

- (void)makeGETRequestWithURL:(NSURL *)url onSucess:(successBlock)success onFailure:(errorBlock)failure {
    NSString *urlWithBaseURL = [NSString stringWithFormat:@"%@%@",kServerBaseURL, url.absoluteString];
    [self.requestOperationManager GET:urlWithBaseURL parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        CCLog(@"Request with URL: %@ Responce:\%@", urlWithBaseURL, responseObject);
        if (responseObject) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        CCLog(@"Request with URL: %@ Error:\%@", urlWithBaseURL, error);
        failure(error);
    }];
}

- (void)makePOSTRequestWithURL:(NSURL *)url onSucess:(successBlock)success onFailure:(errorBlock)failure {
    NSString *urlWithBaseURL = [NSString stringWithFormat:@"%@%@",kServerBaseURL, url.absoluteString];
    [self.requestOperationManager POST:urlWithBaseURL parameters:nil progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        CCLog(@"Request with URL: %@ Responce:\%@", urlWithBaseURL, responseObject);
        if (responseObject) {
            success(responseObject);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        CCLog(@"Request with URL: %@ Error:\%@", urlWithBaseURL, error);
        failure(error);
    }];
}

@end
