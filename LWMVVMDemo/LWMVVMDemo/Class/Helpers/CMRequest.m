//
//  CMRequest.m
//  LWMVVMDemo
//
//  Created by qianbaoeo on 2017/3/15.
//  Copyright © 2017年 qianbaoeo. All rights reserved.
//

#import "CMRequest.h"

@implementation CMRequest
+ (instancetype)request
{
    return [[self alloc] init];
}
- (instancetype)init
{
    self = [super init];
    if (self) {
        self.operationManager = [[AFHTTPSessionManager alloc] init];
    }
    return self;
}

- (void)GET:(NSString *)URLString  parameters:(NSDictionary *)parameters success:(void(^)(CMRequest *request,NSString *responseString))success
    failure:(void(^)(CMRequest *request,NSError *error))failure
{
    self.operationQueue = self.operationManager.operationQueue;
    self.operationManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [self.operationManager GET:URLString parameters:parameters progress:^(NSProgress * _Nonnull downloadProgress) {
        NSLog(@"downloadProgress--%@",downloadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSString *responseJson = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSLog(@"responseObject--%@",responseObject);
        
        //调用block  执行调用GET时success block方法
        success(self,responseJson);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error--%@",error);
        //调用 block
        failure(self,error);
    }];
}

- (void)POST:(NSString *)URLString parameters:(NSDictionary *)parameters success:(void (^)(CMRequest *, NSString *))success failure:(void (^)(CMRequest *, NSError *))failure
{
    self.operationQueue = self.operationManager.operationQueue;
    self.operationManager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [self.operationManager POST:URLString parameters:parameters progress:^(NSProgress * _Nonnull uploadProgress) {
        NSLog(@"%@",uploadProgress);
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSString *responseJson = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSLog(@"responseJson--%@",responseJson);
        
        success(self,responseJson);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"error--%@",error);
        
        failure(self,error);
    }];
}

//CMRequest  调用下面的方法，然后在类中实现代理的实现
- (void)postWithURL:(NSString *)URLString parameters:(NSDictionary *)parameters
{
    [self POST:URLString parameters:parameters success:^(CMRequest *request, NSString *responseString) {
        if (self.delegate &&[self.delegate respondsToSelector:@selector(CMRequest:finished:)]) {
            [self.delegate CMRequest:request finished:responseString];
        }
    } failure:^(CMRequest *request, NSError *error) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(CMRequest:error:)]) {
            [self.delegate CMRequest:request error:error.description];
        }
    }];
}

- (void)getWithURL:(NSString *)URLString
{
    [self GET:URLString parameters:nil success:^(CMRequest *request, NSString *responseString) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(CMRequest:finished:)]) {
            [self.delegate CMRequest:request finished:responseString];
        }
    } failure:^(CMRequest *request, NSError *error) {
        if (self.delegate && [self.delegate respondsToSelector:@selector(CMRequest:error:)]) {
            [self.delegate CMRequest:request error:error.description];
        }
    }];
}
//是否能够取消最近的请求？？？或者所有的请求
- (void)cancelAllOperations
{
    [self.operationQueue cancelAllOperations];
}
@end
