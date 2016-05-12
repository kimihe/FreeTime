//
//  FocusPointViewController.m
//  FreeTime
//
//  Created by 周祺华 on 16/5/5.
//  Copyright © 2016年 周祺华. All rights reserved.
//

#import "FocusPointViewController.h"

@interface FocusPointViewController ()

@end

@implementation FocusPointViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self initNavigationBar];
    [self initTabBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initNavigationBar
{
    [self.navigationController.navigationBar setBackgroundImage:[UIImage new]
                                                  forBarMetrics:UIBarMetricsDefault];
    self.navigationController.navigationBar.shadowImage = [UIImage new];
    self.navigationController.navigationBar.translucent = YES;
    
    
    //            self.view.backgroundColor = [UIColor clearColor];
    //            self.navigationBar.backgroundColor = [UIColor clearColor];
    //self.navigationController.navigationBar.alpha = 0.8;
    
    
    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
    
    //            viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(leftBarButtonItemAction:)];
    //            //解决自定义了leftBarbuttonItem左滑返回手势失效了的问题
    //            self.interactivePopGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)self;
    
    //self.navigationItem.leftItemsSupplementBackButton = YES;
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];}

- (void)initTabBar
{
    self.tabBarController.tabBar.hidden = YES;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
