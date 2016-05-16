//
//  CinemaCell.m
//  FreeTime
//
//  Created by 周祺华 on 16/4/16.
//  Copyright © 2016年 周祺华. All rights reserved.
//

#import "CinemaCell.h"
#import "CinemaModel.h"

@implementation CinemaCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setAppearanceWithModel:(NSDictionary *)dic
{
    self.cinemaName.adjustsFontSizeToFitWidth = YES;
    self.address.adjustsFontSizeToFitWidth = YES;
    self.distance.adjustsFontSizeToFitWidth = YES;
    
    self.cinemaName.text = dic[@"cinemaName"];
    self.address.text = dic[@"address"];
    self.distance.text = [NSString stringWithFormat:@"%@m", dic[@"distance"]];
}

@end
