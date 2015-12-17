//
//  GDTabbarController.m
//  GDTabbarDemo
//
//  Created by xiaoyu on 15/12/8.
//  Copyright © 2015年 guoda. All rights reserved.
//

#import "GDTabbarController.h"
#import "GDTabbarItem.h"
#import "GDTabbarView.h"
@interface GDTabbarController ()

@end

@implementation GDTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    GDOneViewController *one = [[GDOneViewController alloc] init];
    GDTwoViewController *two = [[GDTwoViewController alloc] init];
    GDThreeViewController *three = [[GDThreeViewController alloc] init];
    GDFourViewController *four = [[GDFourViewController alloc] init];
    GDFiveViewController *five = [[GDFiveViewController alloc] init];
    
    UINavigationController *nav1 = [[UINavigationController alloc] initWithRootViewController:one];
    UINavigationController *nav2 = [[UINavigationController alloc] initWithRootViewController:two];
    UINavigationController *nav3 = [[UINavigationController alloc] initWithRootViewController:three];
    UINavigationController *nav4 = [[UINavigationController alloc] initWithRootViewController:four];
    UINavigationController *nav5 = [[UINavigationController alloc] initWithRootViewController:five];
    
//    UITabBarController *tabbarController = [[UITabBarController alloc] init];
    self.viewControllers = @[nav1,nav2,nav3,nav4,nav5];
    [self.tabBar setBackgroundImage:[[UIImage alloc] init]];
//    [[UITabBar appearance] setBackgroundImage:[[UIImage alloc] init]];
    [self.tabBar setShadowImage:[[UIImage alloc] init]];

    GDTabbarView  * tabBar = [[GDTabbarView alloc] initWithFrame:self.tabBar.bounds];
    
    CGFloat normalButtonWidth = (SCREEN_WIDTH /5);
    
    CGFloat tabBarHeight = CGRectGetHeight(tabBar.frame);
    CGFloat publishItemWidth = (SCREEN_WIDTH / 5);

    GDTabbarItem *homeItem = [self tabBarItemWithFrame:CGRectMake(0, 0, normalButtonWidth, tabBarHeight)
                                                 title:@"首页"
                                       normalImageName:@"home_normal"
                                     selectedImageName:@"home_highlight" tabBarItemType:GDTabBarItemNormal];
    GDTabbarItem *sameCityItem = [self tabBarItemWithFrame:CGRectMake(normalButtonWidth, 0, normalButtonWidth, tabBarHeight)
                                                     title:@"同城"
                                           normalImageName:@"mycity_normal"
                                         selectedImageName:@"mycity_highlight" tabBarItemType:GDTabBarItemNormal];
    
    GDTabbarItem *publishItem = [self tabBarItemWithFrame:CGRectMake(normalButtonWidth * 2, 0, publishItemWidth, tabBarHeight)
                                                    title:@"发布"
                                          normalImageName:@"post_normal"
                                        selectedImageName:@"post_normal" tabBarItemType:GDTabBarItemNormal];//LLTabBarItemRise
    
    GDTabbarItem *messageItem = [self tabBarItemWithFrame:CGRectMake(normalButtonWidth * 2 + publishItemWidth, 0, normalButtonWidth, tabBarHeight)
                                                    title:@"消息"
                                          normalImageName:@"message_normal"
                                        selectedImageName:@"message_highlight" tabBarItemType:GDTabBarItemNormal];
    GDTabbarItem *mineItem = [self tabBarItemWithFrame:CGRectMake(normalButtonWidth * 3 + publishItemWidth, 0, normalButtonWidth, tabBarHeight)
                                                 title:@"我的"
                                       normalImageName:@"account_normal"
                                     selectedImageName:@"account_highlight" tabBarItemType:GDTabBarItemNormal];
    
    tabBar.tabBarItems = @[homeItem, sameCityItem, publishItem, messageItem, mineItem];
//    tabBar.delegate = self;
    
    [self.tabBar addSubview:tabBar];

    
    
    
}
- (GDTabbarItem *)tabBarItemWithFrame:(CGRect)frame title:(NSString *)title normalImageName:(NSString *)normalImageName selectedImageName:(NSString *)selectedImageName tabBarItemType:(DGTabBarItemType)tabBarItemType {
    GDTabbarItem *item = [[GDTabbarItem alloc] initWithFrame:frame];
    [item setTitle:title forState:UIControlStateNormal];
    [item setTitle:title forState:UIControlStateSelected];
    item.titleLabel.font = [UIFont systemFontOfSize:8];
    UIImage *normalImage = [UIImage imageNamed:normalImageName];
    UIImage *selectedImage = [UIImage imageNamed:selectedImageName];
    [item setImage:normalImage forState:UIControlStateNormal];
    [item setImage:selectedImage forState:UIControlStateSelected];
    [item setImage:selectedImage forState:UIControlStateHighlighted];
    [item setTitleColor:[UIColor colorWithWhite:51 / 255.0 alpha:1] forState:UIControlStateNormal];
    [item setTitleColor:[UIColor colorWithWhite:51 / 255.0 alpha:1] forState:UIControlStateSelected];
    item.tabbarItemType = tabBarItemType;
    
    return item;
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
