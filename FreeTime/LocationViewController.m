//
//  LocationViewController.m
//  FreeTime
//
//  Created by 周祺华 on 16/5/17.
//  Copyright © 2016年 周祺华. All rights reserved.
//

#import "LocationViewController.h"

#import "CinemaModel.h"

@interface LocationViewController ()

@property (strong, nonatomic)CinemaLocationModel *cinemaLocationM;

@property (weak, nonatomic) IBOutlet UITextField *latitudeTextField;//纬度
@property (weak, nonatomic) IBOutlet UITextField *longitudeTextField;//经度

@end

@implementation LocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initData];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    NSString *latitude = self.latitudeTextField.text;
    if ([latitude isEqualToString:@""])
        latitude = @"32.076269";
    
    NSString *longitude = self.longitudeTextField.text;
    if ([longitude isEqualToString:@""])
        longitude = @"118.790456";
    
    self.cinemaLocationM.latitude = latitude;
    self.cinemaLocationM.longitude = longitude;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initData
{
    self.cinemaLocationM = [CinemaLocationModel getSingletonObj];
}




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)leftBarButtonItemAction:(UIBarButtonItem *)sender
{
    [self dismissViewControllerAnimated:YES completion:NULL];
}

@end
