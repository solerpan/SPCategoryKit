//
//  UIColor+Hex.h
//  小V咖
//
//  Created by solerliang on 2017/5/15.
//  Copyright © 2017年 Veeca. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Hex)

+ (UIColor *)colorWithHex:(uint)hex;
+ (UIColor *)colorWithHexString:(NSString *)color alpha:(CGFloat)alpha;//默认alpha为1
+ (UIColor *)colorWithHexString:(NSString *)color;
+(UIColor *)generateDynamicColor:(UIColor *)lightColor darkColor:(UIColor *)darkColor;
@end
