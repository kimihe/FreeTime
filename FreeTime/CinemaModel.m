//
//  CinemaModel.m
//  FreeTime
//
//  Created by 周祺华 on 16/4/16.
//  Copyright © 2016年 周祺华. All rights reserved.
//

#import "CinemaModel.h"

@implementation CinemaItemsModel

static CinemaItemsModel *singletonObj_CinemaItemsModel = nil;
+(CinemaItemsModel *)getSingletonObj
{
    @synchronized (self) {
        if (singletonObj_CinemaItemsModel == nil)
        {
            singletonObj_CinemaItemsModel = [[super allocWithZone:NULL] init];
        }
    }
    
    return singletonObj_CinemaItemsModel;
}

- (void)initWithCinemaItemsData:(id)data
{
    if ([data isKindOfClass:[NSDictionary class]])
    {
        NSDictionary *dic = (NSDictionary *)data;
        
        self.error_code     = [NSString stringWithFormat:@"%@", dic[@"error_code"]];
        self.reason         = dic[@"reason"];
        self.cinemaItemsArr = dic[@"result"];
        self.count          = [self.cinemaItemsArr count];
        
    }
}

@end

@implementation CinemaCellsModel

- (void)initWithCinemaCellsData:(id)data
{
    if ([data isKindOfClass:[NSDictionary class]])
    {
        NSDictionary *dic = (NSDictionary *)data;
        
        self.id             = dic[@"id"];
        self.cityName       = dic[@"cityName"];
        self.cinemaName     = dic[@"cinemaName"];
        self.address        = dic[@"address"];
        self.telephone      = dic[@"telephone"];
        self.latitude       = dic[@"latitude"];
        self.longitude      = dic[@"longitude"];
        self.trafficRoutes  = dic[@"trafficRoutes"];
        self.distance       = [NSString stringWithFormat:@"%@", dic[@"distance"]];
    }
}

@end


@implementation CinemaLocationModel

static CinemaLocationModel *singletonObj_CinemaLocationModel = nil;
+(CinemaLocationModel *)getSingletonObj
{
    @synchronized (self) {
        if (singletonObj_CinemaLocationModel == nil)
        {
            singletonObj_CinemaLocationModel = [[super allocWithZone:NULL] init];
            
            //默认定位: 上海宝山UME国际影城
            singletonObj_CinemaLocationModel.latitude  = @"31.38787";//纬度
            singletonObj_CinemaLocationModel.longitude = @"121.502962";//经度
        }
    }
    
    return singletonObj_CinemaLocationModel;
}

- (void)initWithCinemaLocationData:(id)data
{
    if ([data isKindOfClass:[NSDictionary class]])
    {
        NSDictionary *dic = (NSDictionary *)data;
        
        self.latitude  = dic[@"latitude"];
        self.longitude = dic[@"longitude"];
    }
}

@end


