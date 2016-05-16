//
//  CinemaViewController.m
//  FreeTime
//
//  Created by 周祺华 on 16/5/5.
//  Copyright © 2016年 周祺华. All rights reserved.
//

#import "CinemaViewController.h"
#import "HallsViewController.h"

#import "CinemaModel.h"

#import "CinemaCell.h"

#import "Defines.h"

@interface CinemaViewController ()

@property (strong, nonatomic)CinemaModel *cinemaItemsModel;
@property (weak, nonatomic) IBOutlet UITableView *cinemaTableView;

@end

@implementation CinemaViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initData];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self initNavigationBar];
    [self initTabBar];
    
    [self getCinemaItemsData];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initData
{
    self.cinemaItemsModel = [CinemaModel getSingletonObj];
}

- (void)initNavigationBar
{
    self.navigationController.navigationBar.barTintColor = RGBA(90.0, 90.0, 90.0, 1.0);
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];
}

- (void)initTabBar
{
    self.tabBarController.tabBar.hidden = NO;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    
    if ([segue.identifier isEqualToString:@"pushToHallsSegue"]) {
        HallsViewController *hallsVC = segue.destinationViewController;
    }
}

#pragma mark - getCinemaItemsData : 获取周围影院信息
- (void)getCinemaItemsData
{
    // Load some data to populate the table view with
    NSURL *cinemaItemsJSONURL = [[NSBundle mainBundle] URLForResource:@"test" withExtension:@"json"];
    NSData *cinemaItemsJSONData = [NSData dataWithContentsOfURL:cinemaItemsJSONURL];
    id cinemaItemsData = [NSJSONSerialization JSONObjectWithData:cinemaItemsJSONData options:0 error:NULL];
    
    [self.cinemaItemsModel initWithCinemaItemsData:cinemaItemsData];
}



#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 20;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @"影院信息";
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.cinemaItemsModel.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    long row = indexPath.row;
    long section = indexPath.section;
    
    
    static NSString *cellIdentifier = @"CinemaCell";
    CinemaCell *cinemaCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];

    [cinemaCell setAppearanceWithModel:self.cinemaItemsModel.cinemaItemsArr[row]];    
    return cinemaCell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60;
}

- (void)tableView:(UITableView *)tableView willDisplayHeaderView:(nonnull UIView *)view forSection:(NSInteger)section
{
    view.tintColor = [UIColor whiteColor];
    UITableViewHeaderFooterView *header = (UITableViewHeaderFooterView *)view;
    header.textLabel.textColor = [UIColor grayColor];
    header.textLabel.font = [UIFont systemFontOfSize:14];
}






@end
