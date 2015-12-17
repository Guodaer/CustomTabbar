//
//  GDTabbarView.m
//  GDTabbarDemo
//
//  Created by xiaoyu on 15/12/8.
//  Copyright © 2015年 guoda. All rights reserved.
//

#import "GDTabbarView.h"
#import "GDTabbarItem.h"

@implementation GDTabbarView

- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self config];
    }
    
    return self;
}
- (void)config {
    self.backgroundColor = [UIColor whiteColor];
    UIImageView *topLine = [[UIImageView alloc] initWithFrame:CGRectMake(0, -5, SCREEN_WIDTH, 5)];
    topLine.image = [UIImage imageNamed:@"tapbar_top_line"];
    [self addSubview:topLine];
}
- (void)setSelectedIndex:(NSInteger)index {
    for (GDTabbarItem *item in self.tabBarItems) {
        if (item.tag == index) {
            item.backgroundColor = [UIColor yellowColor];
//            [item setBackgroundColor:[UIColor yellowColor]];
            item.selected = YES;
        } else {
            item.backgroundColor = [UIColor whiteColor];

            item.selected = NO;
        }
    }
    
    UIWindow *keyWindow = [[[UIApplication sharedApplication] delegate] window];
    UITabBarController *tabBarController = (UITabBarController *)keyWindow.rootViewController;
    if (tabBarController) {
        tabBarController.selectedIndex = index;
    }
}

#pragma mark - Touch Event

- (void)itemSelected:(GDTabbarItem *)sender {
    if (sender.tabbarItemType != GDTabBarItemRise) {
        [self setSelectedIndex:sender.tag];
    } else {
        if (self.delegate) {
            if ([self.delegate respondsToSelector:@selector(tabBarDidSelectedRiseButton)]) {
                [self.delegate tabBarDidSelectedRiseButton];
            }
        }
    }
}

#pragma mark - Setter

- (void)setTabBarItems:(NSArray *)tabBarItems {
    _tabBarItems = tabBarItems;
    NSInteger itemTag = 0;
    for (id item in tabBarItems) {
        if ([item isKindOfClass:[GDTabbarItem class]]) {
            if (itemTag == 0) {
                ((GDTabbarItem *)item).selected = YES;
            }
            [((GDTabbarItem *)item) addTarget:self action:@selector(itemSelected:) forControlEvents:UIControlEventTouchDown];
            [self addSubview:item];
            if (((GDTabbarItem *)item).tabbarItemType != GDTabBarItemRise) {
                ((GDTabbarItem *)item).tag = itemTag;
                itemTag++;
            }
        }
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
