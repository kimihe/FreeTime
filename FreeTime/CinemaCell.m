//
//  CinemaCell.m
//  FreeTime
//
//  Created by 周祺华 on 16/4/16.
//  Copyright © 2016年 周祺华. All rights reserved.
//

#import "CinemaCell.h"

@implementation CinemaCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setAppearanceWithCinemaCellsModel:(CinemaCellsModel *)cinemaCellsM
{
    self.cinemaNameLabel.adjustsFontSizeToFitWidth = YES;
    self.addressLabel.adjustsFontSizeToFitWidth = YES;
    self.distanceLabel.adjustsFontSizeToFitWidth = YES;
    
    self.cinemaNameLabel.text = cinemaCellsM.cinemaName;
    self.addressLabel.text = cinemaCellsM.address;
    self.distanceLabel.text = [cinemaCellsM.distance stringByAppendingString:@"m"];
}

@end
