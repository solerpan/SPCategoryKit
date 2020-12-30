//
//  UIBarButtonItem+Extension.m
//  CrazyNumber
//
//  Created by Alen on 16/5/3.
//  Copyright © 2016年 AKAAlenKing. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"
#import "UIView+Frame.h"

@implementation UIBarButtonItem (Extension)
/**
 *  创建一个item
 *
 *  @param target    点击item后调用哪个对象的方法
 *  @param action    点击item后调用target的哪个方法
 *  @param image     图片
 *  @param highImage 高亮的图片
 *
 *  @return 创建完的item
 */
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage
{
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    // 设置图片
    [btn setBackgroundImage:[UIImage imageNamed:image] forState:UIControlStateNormal];
    [btn setBackgroundImage:[UIImage imageNamed:highImage] forState:UIControlStateHighlighted];
    // 设置尺寸
    btn.ak_size = btn.currentBackgroundImage.size;
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
}


/**
 *  创建一个item
 *
 *  @param target 点击item后调用哪个对象的方法
 *  @param action 点击item后调用target的哪个方法
 *  @param image  图片
 *  @param title  标题
 *
 *  @return 创建完的item
 */
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(UIImage*)image titleColor:(UIColor *)titleColor title:(NSString *)title {
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    // 设置图片
    btn.titleLabel.font =[UIFont fontWithName:@"" size:15];
    [btn setImage:image forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:@"navigationbar_back_pre"] forState:UIControlStateHighlighted];

    [btn setTitle:title forState:UIControlStateNormal];
    // 设置button内容与左边的内边距
//    btn.contentEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);
//    btn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 20);
    
    // 设置button内部文字与左边图片的内边距
//    btn.titleEdgeInsets = UIEdgeInsetsMake(0, 10, 0, 0);
    // 设置button内部图片与文字的的内边距，结合上边的内容边距来调
//    btn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 0);

    [btn setTitleColor:titleColor forState:UIControlStateNormal];
    
    // 设置尺寸(使用这个方法只适合button内部只有图片的时候，计算button的大小
//    btn.size = btn.currentBackgroundImage.size;
    // 这个方法适合button内部的无论是图片还是文字的时候的，自动计算button的尺寸
//    [btn sizeToFit];
    // 一般是两个文字，因此宽度可以设置为固定的。label有属性可以根据文字的大小和多少来自动设置宽高
    [btn sizeToFit];
    btn.frame = CGRectMake(0, 0, 60, 30);
    btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentRight;
    return [[UIBarButtonItem alloc] initWithCustomView:btn];
    
}

#pragma 导航栏中间的titleView
+ (UIBarButtonItem *)itemWithTitleView:(NSString *)title{
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    titleLabel.text = title;
    titleLabel.font = [UIFont systemFontOfSize:18.f];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = [UIColor whiteColor];
    return titleLabel;
}

- (void)setNavigationItemWithViewController:(UIViewController *)vc title:(NSString *)title{
    UILabel *titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 100, 44)];
    titleLabel.text = title;
    titleLabel.font = [UIFont systemFontOfSize:18.f];
    titleLabel.textAlignment = NSTextAlignmentCenter;
    titleLabel.textColor = [UIColor whiteColor];
    vc.navigationItem.titleView = titleLabel;
}



@end
