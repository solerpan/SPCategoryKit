//
//  UIButton+BackgroundColor.h
//
//  Created by 潘亮 on 2021/3/18.
//

#import <UIKit/UIKit.h>

@interface UIButton (BackgroundColor)
/**
 *  @brief  使用颜色设置按钮背景
 *
 *  @param backgroundColor 背景颜色
 *  @param state           按钮状态
 */
- (void)setBackgroundColor:(UIColor *)backgroundColor forState:(UIControlState)state;
@end
