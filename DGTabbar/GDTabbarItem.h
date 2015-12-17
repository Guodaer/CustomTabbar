//
//  GDTabbarItem.h
//  GDTabbarDemo
//
//  Created by xiaoyu on 15/12/8.
//  Copyright © 2015年 guoda. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSUInteger, DGTabBarItemType) {
    GDTabBarItemNormal = 0, //正常
    GDTabBarItemRise, //特殊的item
};
@interface GDTabbarItem : UIButton

@property (nonatomic, assign) DGTabBarItemType tabbarItemType;

@end
