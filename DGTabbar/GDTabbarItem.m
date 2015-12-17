//
//  GDTabbarItem.m
//  GDTabbarDemo
//
//  Created by xiaoyu on 15/12/8.
//  Copyright © 2015年 guoda. All rights reserved.
//

#import "GDTabbarItem.h"

@implementation GDTabbarItem
- (instancetype)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    
    if (self) {
        [self config];
    }
    
    return self;
}

- (instancetype)init {
    self = [super init];
    
    if (self) {
        [self config];
    }
    
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    
    if (self) {
        [self config];
    }
    
    return self;
}

- (void)config {
    self.imageView.contentMode = UIViewContentModeScaleAspectFit;
}
- (void)layoutSubviews {
    [super layoutSubviews];
    
    [self.titleLabel sizeToFit];
    CGSize titleSize = self.titleLabel.frame.size;
    
    CGSize imageSize = [self imageForState:UIControlStateNormal].size;
    

    if (imageSize.width != 0 && imageSize.height != 0) {
        CGFloat imageViewCenterY = CGRectGetHeight(self.frame) - 3 - titleSize.height - imageSize.height / 2 - 5;

        self.imageView.center = CGPointMake(CGRectGetWidth(self.frame) / 2, imageViewCenterY);
        
    } else {
        
        //        CGPoint imageViewCenter = self.imageView.center;
        //		imageViewCenter.x = CGRectGetWidth(self.frame) / 2;
        //		imageViewCenter.y = (CGRectGetHeight(self.frame) - titleSize.height) / 2;
        //		self.imageView.center = imageViewCenter;
    }
    
    CGPoint labelCenter = CGPointMake(CGRectGetWidth(self.frame) / 2, CGRectGetHeight(self.frame) - 3 - titleSize.height / 2);
    self.titleLabel.center = labelCenter;
    
    // 还有一种实现方式是设置 Edge Insets，Xcode 7.0.1 好像有点不开心，在 IB 里面更改一下属性的时候，经常崩溃。。。
    /* 位置还有一点不准确，推荐用上面的代码来设置
     
     [self.titleLabel sizeToFit];
     CGSize titleSize = self.titleLabel.frame.size;
     CGSize imageSize = [self imageForState:UIControlStateNormal].size;
     NSInteger titleTopInset = CGRectGetHeight(self.frame) - 3 - titleSize.height;
     CGFloat titleRightInset = (CGRectGetWidth(self.frame) - titleSize.width) / 2 + titleSize.width;
     [self setTitleEdgeInsets:UIEdgeInsetsMake(titleTopInset, 0, 3, titleRightInset)];
     CGFloat imageViewLeftRightInset = (CGRectGetWidth(self.frame) - imageSize.width) / 2;
     [self setImageEdgeInsets:UIEdgeInsetsMake(CGRectGetHeight(self.frame) - 3 - 5 - titleSize.height - imageSize.height, imageViewLeftRightInset, 3 + 5 + titleSize.height, imageViewLeftRightInset)];

     */
}
/**
 *  复写系统的高量实现，禁止按钮高亮
 *  此函数里不用写任何代码
 */
- (void)setHighlighted:(BOOL)highlighted{

}
#if 0
1、 init初始化不会触发layoutSubviews

2、 addSubview会触发layoutSubviews

3、 设置view的Frame会触发layoutSubviews，当然前提是frame的值设置前后发生了变化

4、 滚动一个UIScrollView会触发layoutSubviews

5、 旋转Screen会触发父UIView上的layoutSubviews事件

6、 改变一个UIView大小的时候也会触发父UIView上的layoutSubviews事件

1. 一个view是不能够自己调用layoutSubviews,如果要调用,需要调用 setNeedsLayout或者 layoutIfNeeded

2. 如果view的frame值为0,即使被添加了耶不会调用layoutSubviews

3. 如果一个view的frame值改变了,那么它的父类的layoutSubviews也会被执行


#endif
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
