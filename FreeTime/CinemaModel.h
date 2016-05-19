//
//  CinemaModel.h
//  FreeTime
//
//  Created by 周祺华 on 16/4/16.
//  Copyright © 2016年 周祺华. All rights reserved.
//

/*
 名称            类型     说明
 error_code     int     返回码
 reason         string  success or error reason
 id             string	电影院ID
 cityName       string	影院所属城市
 cinemaName     string	影院名称
 address        string	影院地址
 telephone      string	联系电话
 latitude       double	纬度，适合百度地图
 longitude      double	经度，适合百度地图
 trafficRoutes	string	交通路线
 distance       string	大概距离(米)
 */


#import <Foundation/Foundation.h>

@interface CinemaItemsModel : NSObject

@property (strong, nonatomic)NSString *error_code;
@property (strong, nonatomic)NSString *reason;
@property (strong, nonatomic)NSArray *cinemaItemsArr;
@property (assign, nonatomic)NSInteger count;

+(CinemaItemsModel *)getSingletonObj;
- (void)initWithCinemaItemsData:(id)data;

@end


@interface CinemaCellsModel : NSObject

@property (strong, nonatomic)NSString *id;
@property (strong, nonatomic)NSString *cityName;
@property (strong, nonatomic)NSString *cinemaName;
@property (strong, nonatomic)NSString *address;
@property (strong, nonatomic)NSString *telephone;
@property (strong, nonatomic)NSString *latitude;
@property (strong, nonatomic)NSString *longitude;
@property (strong, nonatomic)NSString *trafficRoutes;
@property (strong, nonatomic)NSString *distance;

- (void)initWithCinemaCellsData:(id)data;

@end


@interface CinemaLocationModel : NSObject

@property (strong, nonatomic)NSString *latitude;//纬度
@property (strong, nonatomic)NSString *longitude;//经度
@property (assign, nonatomic)BOOL reloadCinemaItemsData;//标记是否刷新CinemaVC

+(CinemaLocationModel *)getSingletonObj;
- (void)initWithCinemaLocationData:(id)data;

@end

