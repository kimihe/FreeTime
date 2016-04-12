//
//  Kimi_CinemaNavigationController.m
//  FreeTime
//
//  Created by 周祺华 on 16/5/12.
//  Copyright © 2016年 周祺华. All rights reserved.
//

#import "Kimi_CinemaNavigationController.h"

@interface Kimi_CinemaNavigationController ()
{
    UIColor *prev_naviBar_tintColor;
}

@end

@implementation Kimi_CinemaNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated
{
    NSUInteger index = self.viewControllers.count;
    switch (index)
    {
        case 0:
        {
            self.navigationBar.barTintColor = [UIColor colorWithRed:90.0/255.0 green:90.0/255.0 blue:90.0/255.0 alpha:1];
            break;
        }
        case 1:
        {
            /* 自动显示和隐藏tabbar */
            viewController.hidesBottomBarWhenPushed = YES;
            
            self.navigationBar.barTintColor = [UIColor colorWithRed:90.0/255.0 green:90.0/255.0 blue:90.0/255.0 alpha:1];
            self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
            self.navigationBar.tintColor = [UIColor whiteColor];
            
            break;
        }
        case 2:// 这时push进来的控制器viewController，是ChatRoomVC
        {
            [self.navigationBar setBackgroundImage:[UIImage new]
                                                          forBarMetrics:UIBarMetricsDefault];
            self.navigationBar.shadowImage = [UIImage new];
            self.navigationBar.translucent = YES;
            
            
//            self.view.backgroundColor = [UIColor clearColor];
//            self.navigationBar.backgroundColor = [UIColor clearColor];
            //self.navigationController.navigationBar.alpha = 0.8;
            
            
            self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor whiteColor]};
            
//            viewController.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"返回" style:UIBarButtonItemStylePlain target:self action:@selector(leftBarButtonItemAction:)];
//            //解决自定义了leftBarbuttonItem左滑返回手势失效了的问题
//            self.interactivePopGestureRecognizer.delegate = (id<UIGestureRecognizerDelegate>)self;
            
            //self.navigationItem.leftItemsSupplementBackButton = YES;
            self->prev_naviBar_tintColor = self.navigationBar.tintColor;
            self.navigationBar.tintColor = [UIColor whiteColor];
            
            break;
        }
        case 3:
        {
            break;
        }
        default:
        {
            break;
        }
    }
    
    [super pushViewController:viewController animated:animated];
}

-(void)leftBarButtonItemAction:(UIBarButtonItem *)sender
{
    NSLog(@"pop");
    // 因为self本来就是一个导航控制器，self.navigationController这里是nil的
    [self popViewControllerAnimated:YES];
    
    [self.navigationBar setBackgroundImage:nil forBarMetrics:UIBarMetricsDefault];
    
    self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName : [UIColor blackColor]};
    
    self.navigationBar.tintColor = self->prev_naviBar_tintColor;
}

@end
