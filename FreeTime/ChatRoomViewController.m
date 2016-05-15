//
//  ChatRoomViewController.m
//  FreeTime
//
//  Created by 周祺华 on 16/5/5.
//  Copyright © 2016年 周祺华. All rights reserved.
//

#import "ChatRoomViewController.h"

@interface ChatRoomViewController ()

@end

@implementation ChatRoomViewController

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

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    [self resetNavigationBar];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

//全透明，一般在viewWillAppear
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
    self.navigationController.navigationBar.tintColor = [UIColor whiteColor];

//    UIBarButtonItem *b1 = [[UIBarButtonItem alloc]initWithTitle:@"111" style:UIBarButtonItemStylePlain target:nil action:nil];
//    UIBarButtonItem *b2 = [[UIBarButtonItem alloc]initWithTitle:@"222" style:UIBarButtonItemStylePlain target:nil action:nil];
//    UIBarButtonItem *b3 = [[UIBarButtonItem alloc]initWithTitle:@"333" style:UIBarButtonItemStylePlain target:nil action:nil];
//    NSArray *a = [NSArray arrayWithObjects:b1,b2,b3, nil];
//    self.navigationItem.leftBarButtonItems = a;
    
}

- (void)initTabBar
{
    self.tabBarController.tabBar.hidden = YES;
}

//恢复成默认，一般在viewWillDisappear
- (void)resetNavigationBar
{
    [self.navigationController.navigationBar setBackgroundImage:nil
                                                    forBarMetrics:UIBarMetricsDefault];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


-(void)leftBarButtonItemAction:(UIBarButtonItem *)sender
{
    NSLog(@"pop");
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)cancelClicked:(UIBarButtonItem *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
