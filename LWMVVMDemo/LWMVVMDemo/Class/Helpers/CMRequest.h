//
//  CMRequest.h
//  LWMVVMDemo
//
//  Created by qianbaoeo on 2017/3/15.
//  Copyright © 2017年 qianbaoeo. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking/AFNetworking.h>
@class CMRequest;
@protocol CMRequestDelegate <NSObject>
- (void)CMRequest:(CMRequest *)request finished:(NSString *)response;
- (void)CMRequest:(CMRequest *)request error:(NSString *)error;

@end

@interface CMRequest : NSObject
@property (nonatomic,assign)id<CMRequestDelegate>delegate;
@property (nonatomic,strong)AFHTTPSessionManager *operationManager;
@property (nonatomic,strong)NSOperationQueue *operationQueue;

//创建CMRequest的对象方法
+ (instancetype)request;

/*
 *  功能：GET请求
    参数：（1）请求的url：urlString
                （2）请求成功调用的block：success
                （3）请求失败的block ：failure
 */
- (void)GET:(NSString *)URLString  parameters:(NSDictionary *)parameters success:(void(^)(CMRequest *,NSString *))success
    failure:(void(^)(CMRequest *,NSError *))failure;

/*
 *  功能：POST请求
 参数：（1）请求的url：urlString
    （2）请求体参数：parameters
 （3）请求成功调用的block：success
 （4）请求失败的block ：failure
 */
- (void)POST:(NSString *)URLString parameters:(NSDictionary *)parameters success:(void(^)(CMRequest *request,NSString *responseString))success
    failure:(void(^)(CMRequest *request,NSError *error))failure;

/*
 *  功能：POST请求
 参数：（1）请求的url：urlString
 （2）请求体参数：parameters
 */
- (void)postWithURL:(NSString *)URLString parameters:(NSDictionary *)parameters;

/*
 *  功能：GET请求
 参数：（1）请求的url：urlString
 */
- (void)getWithURL:(NSString *)URLString;

/*
*   取消当前请求队列的所有要求
 */
- (void)cancelAllOperations;
@end
