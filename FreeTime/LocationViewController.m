//
//  LocationViewController.m
//  FreeTime
//
//  Created by 周祺华 on 16/5/17.
//  Copyright © 2016年 周祺华. All rights reserved.
//

#import "LocationViewController.h"

#import "CinemaModel.h"

@interface LocationViewController () <UIWebViewDelegate>

@property (strong, nonatomic)CinemaLocationModel *cinemaLocationM;

@property (weak, nonatomic) IBOutlet UIWebView *webView;
@property (weak, nonatomic) IBOutlet UITextField *latitudeTextField;//纬度
@property (weak, nonatomic) IBOutlet UITextField *longitudeTextField;//经度

@end

@implementation LocationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    [self initData];
    [self initWebView];
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    self.cinemaLocationM.reloadCinemaItemsData = YES;
    
    NSString *latitude = self.latitudeTextField.text;
    if ([latitude isEqualToString:@""])
    {
        latitude = @"32.076269";
        self.cinemaLocationM.reloadCinemaItemsData = NO;
    }
    
    NSString *longitude = self.longitudeTextField.text;
    if ([longitude isEqualToString:@""])
    {
        longitude = @"118.790456";
        self.cinemaLocationM.reloadCinemaItemsData = NO;
    }
    
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

- (void)initWebView
{
    self.webView.delegate = self;
    NSURL * url = [NSURL URLWithString:@WEBVIEW_URL];
    NSURLRequest * request = [NSURLRequest requestWithURL:url];
    [self.webView loadRequest:request];
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

#pragma mark - UIWebViewDelegate
- (void)webViewDidFinishLoad: (UIWebView *) webView {
    NSLog(@"finish");
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"%@", [error description]);
}


@end
