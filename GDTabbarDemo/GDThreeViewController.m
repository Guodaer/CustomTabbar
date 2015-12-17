//
//  GDThreeViewController.m
//  GDTabbarDemo
//
//  Created by xiaoyu on 15/12/8.
//  Copyright © 2015年 guoda. All rights reserved.
//

#import "GDThreeViewController.h"
#import "GDTabbarView.h"
@interface GDThreeViewController ()

@end

@implementation GDThreeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"Three";

    UIImageView *imageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
    imageView.backgroundColor = [UIColor grayColor];
    [self.view addSubview:imageView];
    
    
#if 0
    CGRect frame = CGRectMake(0,0, SCREEN_WIDTH - 100,SCREEN_HEIGHT-49 - 64);
//    frame.size = [UIImage imageNamed:@"llrisedemo.gif"].size;
    // 读取gif图片数据
    NSData *gif = [NSData dataWithContentsOfFile: [[NSBundle mainBundle] pathForResource:@"llrisedemo" ofType:@"gif"]];
    // view生成
    UIWebView *webView = [[UIWebView alloc] initWithFrame:frame];
    webView.userInteractionEnabled = NO;//用户不可交互
    [webView loadData:gif MIMEType:@"image/gif" textEncodingName:@"" baseURL:[NSURL URLWithString:@""]];
    [self.view addSubview:webView];
#endif
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

@end
