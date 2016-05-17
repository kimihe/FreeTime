//
//  CinemaCell.h
//  FreeTime
//
//  Created by 周祺华 on 16/4/16.
//  Copyright © 2016年 周祺华. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CinemaModel.h"

@interface CinemaCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *cinemaName;
@property (weak, nonatomic) IBOutlet UILabel *address;
@property (weak, nonatomic) IBOutlet UILabel *distance;

- (void)setAppearanceWithCinemaCellsModel:(CinemaCellsModel *)cinemaCellsM;

@end
