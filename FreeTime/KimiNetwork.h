//
//  KimiNetwork.h
//  FreeTime
//
//  Created by 周祺华 on 16/5/17.
//  Copyright © 2016年 周祺华. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking/AFNetworking.h"

//请求超时
#define TIMEOUT 15

@interface KimiNetwork : NSObject

+(instancetype)httpRequest;

-(void)postDataWithURL:(NSString *)url params:(NSDictionary *)userInfo
               success:(void (^)(id object))successBlk
               failure:(void (^)(id object))failureBlk;

@end
