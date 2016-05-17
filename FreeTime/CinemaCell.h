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

@property (weak, nonatomic) IBOutlet UILabel *cinemaNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;
@property (weak, nonatomic) IBOutlet UILabel *distanceLabel;

- (void)setAppearanceWithCinemaCellsModel:(CinemaCellsModel *)cinemaCellsM;

@end
