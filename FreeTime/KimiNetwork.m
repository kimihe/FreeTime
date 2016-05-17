//
//  KimiNetwork.m
//  FreeTime
//
//  Created by 周祺华 on 16/5/17.
//  Copyright © 2016年 周祺华. All rights reserved.
//

#import "KimiNetwork.h"

@implementation KimiNetwork

+(instancetype)httpRequest
{
    return [[[self class] alloc] init];
}

- (AFHTTPRequestOperationManager *)createManager
{
    AFHTTPRequestOperationManager *manager = [AFHTTPRequestOperationManager manager];
    manager.responseSerializer.acceptableContentTypes = [self acceptableContentTypes];
    manager.requestSerializer.timeoutInterval = TIMEOUT;
    NSDictionary *headers = [self headerVaules];
    for (NSString *filed in [headers allKeys]) {
        [manager.requestSerializer setValue:headers[filed] forHTTPHeaderField:filed];
    }
    
    return manager;
}

- (NSSet *)acceptableContentTypes
{
    
    return [NSSet setWithObjects:@"application/json",@"text/html", @"text/json", @"text/javascript", nil];
}

- (NSDictionary *)headerVaules
{
    return nil;
}

-(void)postDataWithURL:(NSString *)url params:(NSDictionary *)userInfo
               success:(void (^)(id object))successBlk
               failure:(void (^)(id object))failureBlk
{
     AFHTTPRequestOperationManager *manager = [self createManager];
    
    [manager POST:url parameters:userInfo
    success:^(AFHTTPRequestOperation *operation, id responseObject)
     {
//         NSLog(@"JSON: %@", responseObject);
         successBlk(responseObject);
     }
    failure:^(AFHTTPRequestOperation *operation, NSError *error)
     {
//         NSLog(@"Error: %@", error);
         failureBlk(error);
     }];
}


@end
