//
//  CinemaModel.m
//  FreeTime
//
//  Created by 周祺华 on 16/4/16.
//  Copyright © 2016年 周祺华. All rights reserved.
//

#import "CinemaModel.h"

@implementation CinemaModel

static CinemaModel *singletonObj = nil;
+(CinemaModel *)getSingletonObj
{
    @synchronized (self) {
        if (singletonObj == nil)
        {
            singletonObj = [[super allocWithZone:NULL] init];
        }
    }
    
    return singletonObj;
}

- (void)initWithCinemaItemsData:(id)data
{
    if ([data isKindOfClass:[NSDictionary class]])
    {
        NSDictionary *dic = (NSDictionary *)data;
        
        self.error_code = dic[@"error_code"];
        self.reason = dic[@"reason"];
        
        self.cinemaItemsArr = dic[@"result"];
        self.count = [self.cinemaItemsArr count];
        
//        self.id = [dic objectForKey:@"id"];
//        self.cityName = dic[@"cityName"];
//        self.cinemaName = dic[@"cinemaName"];
//        self.address = dic[@"address"];
//        self.telephone = dic[@"telephone"];
//        self.latitude = dic[@"latitude"];
//        self.longitude = dic[@"longitude"];
//        self.trafficRoutes = dic[@"trafficRoutes"];
//        self.distance = dic[@"distance"];
    }
}

@end