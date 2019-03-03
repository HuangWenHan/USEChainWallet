//
//  UseWalletNetworkTools.m
//  UseChain
//
//  Created by Jacob on 2019/2/28.
//  Copyright © 2019 Jacob. All rights reserved.
//

#import "UseWalletNetworkTools.h"
#import "AppDelegate.h"
@implementation UseWalletNetworkTools

static id _instace = nil;
+(instancetype)sharedTools {
    static UseWalletNetworkTools *instance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURL *baseUrl = [NSURL URLWithString:@"https://api.yunzic.com/api/"];
        //        NSURL *baseUrl = [NSURL URLWithString:@"http://192.168.11.22/yunzicDzb/public/api/"];
        instance = [[UseWalletNetworkTools alloc] initWithBaseURL:baseUrl];
        instance.responseSerializer = [AFJSONResponseSerializer serializer];
        instance.requestSerializer = [AFJSONRequestSerializer serializer];
        [instance.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        instance.responseSerializer.acceptableContentTypes = [instance.responseSerializer.acceptableContentTypes setByAddingObjectsFromArray:@[@"text/plain", @"text/html"]];
    });
    instance.requestSerializer.timeoutInterval = 50;
    NSDictionary *login = [[NSUserDefaults standardUserDefaults] objectForKey:@"login"];
    NSString *token = login[@"token"];
    if (token) {
        [instance.requestSerializer setValue:token forHTTPHeaderField:@"token-id"];
    }
    NSString *languageType = @"1";
    if (isTraditionalChinese) {
        languageType = @"2";
    } else if (isEnglish) {
        languageType = @"3";
    }
    [instance.requestSerializer setValue:languageType forHTTPHeaderField:@"trans"];
    return instance;
}
+(instancetype)sharedETHTools {
    static UseWalletNetworkTools *instance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURL *baseUrl = [NSURL URLWithString:@"https://mainnet.infura.io/"];
        instance = [[UseWalletNetworkTools alloc] initWithBaseURL:baseUrl];
        instance.responseSerializer = [AFJSONResponseSerializer serializer];
        instance.requestSerializer = [AFJSONRequestSerializer serializer];
        [instance.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        instance.responseSerializer.acceptableContentTypes = [instance.responseSerializer.acceptableContentTypes setByAddingObjectsFromArray:@[@"text/plain", @"text/html"]];
    });
    instance.requestSerializer.timeoutInterval = 50;
    NSDictionary *login = [[NSUserDefaults standardUserDefaults] objectForKey:@"login"];
    NSString *token = login[@"token"];
    if (token) {
        [instance.requestSerializer setValue:token forHTTPHeaderField:@"token-id"];
    }
    NSString *languageType = @"1";
    if (isTraditionalChinese) {
        languageType = @"2";
    } else if (isEnglish) {
        languageType = @"3";
    }
    [instance.requestSerializer setValue:languageType forHTTPHeaderField:@"trans"];
    return instance;
}
+(instancetype)sharedEtherscanTools {
    static UseWalletNetworkTools *instance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        NSURL *baseUrl = [NSURL URLWithString:@"https://api.etherscan.io/api/"];
        instance = [[UseWalletNetworkTools alloc] initWithBaseURL:baseUrl];
        instance.responseSerializer = [AFJSONResponseSerializer serializer];
        instance.requestSerializer = [AFJSONRequestSerializer serializer];//请求
        [instance.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        instance.responseSerializer.acceptableContentTypes = [instance.responseSerializer.acceptableContentTypes setByAddingObjectsFromArray:@[@"text/plain", @"text/html"]];
    });
    
    return instance;
}

+ (instancetype)sharedEthplorerTools {
    static UseWalletNetworkTools *instance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        NSURL *baseUrl = [NSURL URLWithString:@"https://api.ethplorer.io/"];
        instance = [[UseWalletNetworkTools alloc] initWithBaseURL:baseUrl];
        instance.responseSerializer = [AFJSONResponseSerializer serializer];
        instance.requestSerializer = [AFJSONRequestSerializer serializer];//请求
        [instance.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        instance.responseSerializer.acceptableContentTypes = [instance.responseSerializer.acceptableContentTypes setByAddingObjectsFromArray:@[@"text/plain", @"text/html"]];
    });
    
    return instance;
}

+ (instancetype)sharedBTC123Tools {
    static UseWalletNetworkTools *instance;
    
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURL *baseUrl = [NSURL URLWithString:@"https://www.btc123.com/api/"];
        instance = [[UseWalletNetworkTools alloc] initWithBaseURL:baseUrl];
        instance.responseSerializer = [AFJSONResponseSerializer serializer];
        instance.requestSerializer = [AFJSONRequestSerializer serializer];
        [instance.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        instance.responseSerializer.acceptableContentTypes = [instance.responseSerializer.acceptableContentTypes setByAddingObjectsFromArray:@[@"text/plain", @"text/html"]];
    });
    return instance;
}
+ (instancetype)sharedBlockChainTools {
    static UseWalletNetworkTools *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURL *baseUrl = [NSURL URLWithString:@"https://blockchain.info/"];
        instance = [[UseWalletNetworkTools alloc] initWithBaseURL:baseUrl];
        instance.responseSerializer = [AFJSONResponseSerializer serializer];
        instance.requestSerializer = [AFJSONRequestSerializer serializer];
        [instance.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        instance.responseSerializer.acceptableContentTypes = [instance.responseSerializer.acceptableContentTypes setByAddingObjectsFromArray:@[@"text/plain", @"text/html"]];
    });
    return instance;
}
//https://chain.api.btc.com/v3/tx/d3e96b421807eaae49432d40d8605b6afeca178384ac542b97e0a4db7333ee74?verbose=3&_ga=2.255868555.121280017.1511851203-1185178067.1504063275
+ (instancetype)sharedChainTools {
    static UseWalletNetworkTools *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        NSURL *baseUrl = [NSURL URLWithString:@"https://chain.api.btc.com/v3/tx/"];
        instance = [[UseWalletNetworkTools alloc] initWithBaseURL:baseUrl];
        instance.responseSerializer = [AFJSONResponseSerializer serializer];
        instance.requestSerializer = [AFJSONRequestSerializer serializer];
        [instance.requestSerializer setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        instance.responseSerializer.acceptableContentTypes = [instance.responseSerializer.acceptableContentTypes setByAddingObjectsFromArray:@[@"text/plain", @"text/html"]];
    });
    return instance;
}
- (void)request:(NSString *)method URLString:(NSString *)URLString parameters:(NSDictionary *)parameters finished:(void (^)(id result, NSError *error))finished {
    NSString *token = [[NSUserDefaults standardUserDefaults] valueForKey:@"token"];
    if (token) {
        [self.requestSerializer setValue: token forHTTPHeaderField:@"token-id"];
    }
    if ([method  isEqual: @"GET"]) {
        [self GET:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            finished(responseObject, nil);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            finished(nil, error);
        }];
    } else {
        [self POST:URLString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            finished(responseObject, nil);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            finished(nil, error);
        }];
    }
}
@end

