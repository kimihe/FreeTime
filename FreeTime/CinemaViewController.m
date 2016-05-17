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
#import "KimiNetwork.h"
#import "iToast.h"

@interface CinemaViewController ()

@property (strong, nonatomic)CinemaItemsModel *cinemaItemsM;
@property (strong, nonatomic)CinemaLocationModel *cinemaLocationM;

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
    self.cinemaItemsM = [CinemaItemsModel getSingletonObj];
    self.cinemaLocationM = [CinemaLocationModel getSingletonObj];
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


//#pragma mark - Navigation
//
//// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//    
//    if ([segue.identifier isEqualToString:@"pushToHallsSegue"]) {
//        HallsViewController *hallsVC = segue.destinationViewController;
//    }
//}

#pragma mark - getCinemaItemsData : 获取周围影院信息
- (void)getCinemaItemsData
{
    // Load some data to populate the table view with
//    NSURL *cinemaItemsJSONURL = [[NSBundle mainBundle] URLForResource:@"test" withExtension:@"json"];
//    NSData *cinemaItemsJSONData = [NSData dataWithContentsOfURL:cinemaItemsJSONURL];
//    id cinemaItemsData = [NSJSONSerialization JSONObjectWithData:cinemaItemsJSONData options:0 error:NULL];
//    [self.cinemaItemsM initWithCinemaItemsData:cinemaItemsData];
//    NSString *toast = [NSString stringWithFormat:@"搜索到%d条信息", self.cinemaItemsM.count];
//    [[[iToast makeText:NSLocalizedString(toast, @"")]
//      setGravity:iToastGravityCenter] show];
//    [self.cinemaTableView reloadData];
//    return;
    
    
    
    
    NSString *url = @"http://v.juhe.cn/movie/cinemas.local";
    NSString *latitude = self.cinemaLocationM.latitude;
    NSString *longitude = self.cinemaLocationM.longitude;
    NSDictionary *userInfo = @{@"lat" : latitude, @"lon" : longitude, @"radius" : @"3000", @"key" : @"e7423c2342a156b8288cd37d5c53683a", @"dtype" : @"json"};
    
    KimiNetwork *httpRequest = [KimiNetwork httpRequest];
    [httpRequest postDataWithURL:url params:userInfo success:^(id object) {
        NSLog(@"JSON: %@", object);
        [self.cinemaItemsM initWithCinemaItemsData:object];
        NSString *toast = [NSString stringWithFormat:@"搜索到%d条信息", self.cinemaItemsM.count];
        [[[iToast makeText:NSLocalizedString(toast, @"")]
          setGravity:iToastGravityCenter] show];
        [self.cinemaTableView reloadData];
    } failure:^(id object) {
        NSLog(@"Error: %@", object);
    }];
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
    return self.cinemaItemsM.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    long row = indexPath.row;
    long section = indexPath.section;
    
    
    static NSString *cellIdentifier = @"CinemaCell";
    CinemaCell *cinemaCell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];

    CinemaCellsModel *cinemaCellsM = [CinemaCellsModel new];
    [cinemaCellsM initWithCinemaCellsData:self.cinemaItemsM.cinemaItemsArr[row]];
    
    [cinemaCell setAppearanceWithCinemaCellsModel:cinemaCellsM];
    
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
