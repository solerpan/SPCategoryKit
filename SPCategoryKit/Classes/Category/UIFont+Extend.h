//
//  UIFont+Extend.h
//  Created by 潘亮 on 2021/3/18.
//
//
//
#import <UIKit/UIKit.h>

@interface UIFont (Extend)

/**
 *  打印并显示所有字体
 */
+(void)showAllFonts;


/**
 *  宋体(字体缺失)
 */
+(UIFont *)songTypefaceFontOfSize:(CGFloat)size;





/**
 *  微软雅黑：正常字体
 */
+(UIFont *)microsoftYaHeiFontOfSize:(CGFloat)size;


/**
 *  微软雅黑：加粗字体(字体缺失)
 */
+(UIFont *)boldMicrosoftYaHeiFontOfSize:(CGFloat)size;


/**
 *  DroidSansFallback
 */
+(UIFont *)customFontNamedDroidSansFallbackWithFontOfSize:(CGFloat)size;


#pragma mark --- 字体自定义

+ (UIFont *)customFontOfSize:(CGFloat)size;
+ (UIFont *)customBoldFontOfSize:(CGFloat)size;
+ (UIFont *)customRegularFontOfSize:(CGFloat)size;


+ (UIFont *)customFontOfpx:(CGFloat)px;
+ (UIFont *)customBoldFontOfpx:(CGFloat)px;
+ (UIFont *)customRegularFontOfpx:(CGFloat)px;


@end
