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

@interface CinemaModel : NSObject
@property (strong, nonatomic)NSString *error_code;
@property (strong, nonatomic)NSString *reason;

@property (strong, nonatomic)NSArray *cinemaItemsArr;
@property (assign, nonatomic)NSInteger count;

//@property (strong, nonatomic)NSArray *id;
//@property (strong, nonatomic)NSArray *cityName;
//@property (strong, nonatomic)NSArray *cinemaName;
//@property (strong, nonatomic)NSArray *address;
//@property (strong, nonatomic)NSArray *telephone;
//@property (strong, nonatomic)NSArray *latitude;
//@property (strong, nonatomic)NSArray *longitude;
//@property (strong, nonatomic)NSArray *trafficRoutes;
//@property (strong, nonatomic)NSArray *distance;

+(CinemaModel *)getSingletonObj;
- (void)initWithCinemaItemsData:(id)data;

@end

