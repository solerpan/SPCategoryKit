//
//  UIBarButtonItem+Extension.h
//  CrazyNumber
//
//  Created by Alen on 16/5/3.
//  Copyright © 2016年 AKAAlenKing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage;

+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(UIImage*)image titleColor:(UIColor *)titleColor title:(NSString *)title;


+ (UIBarButtonItem *)itemWithTitleView:(NSString *)title;


@end

