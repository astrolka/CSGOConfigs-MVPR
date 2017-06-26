//
//  CCWebPresentationService.h
//  CSGOConfigs
//
//  Created by Petrychuk Oleg on 22.06.17.
//  Copyright © 2017 Oleg Petruchyk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "CCWebPresentationServiceProtocol.h"

@interface CCWebPresentationService : NSObject <CCWebPresentationServiceProtocol>

- (instancetype)initWithWebView:(UIWebView *)webView;

@end
