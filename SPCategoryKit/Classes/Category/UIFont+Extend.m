//
//  UIFont+Extend.m
//  Wifi
//
//  Created by 潘亮 on 2021/3/18.
//

#import "UIFont+Extend.h"

#define sizeScale 0.8
#define pxScale 0.5
#define iPhone45ScreenWidth 320
#define SCREEN_WIDTH [UIScreen mainScreen].bounds.size.width


@implementation UIFont (Extend)


#pragma mark  打印并显示所有字体
+(void)showAllFonts{
    NSArray *familyNames = [UIFont familyNames];
    for( NSString *familyName in familyNames ){
        printf( "Family: %s \n", [familyName UTF8String] );
        NSArray *fontNames = [UIFont fontNamesForFamilyName:familyName];
        for( NSString *fontName in fontNames ){
            printf( "\tFont: %s \n", [fontName UTF8String] );
        }
    }
}




#pragma mark  宋体
+(UIFont *)songTypefaceFontOfSize:(CGFloat)size{
    
    return [UIFont fontWithName:@"经典宋体简" size:size];
    
}





#pragma mark  微软雅黑
+(UIFont *)microsoftYaHeiFontOfSize:(CGFloat)size{
    return [UIFont fontWithName:@"MicrosoftYaHei" size:size];
}




#pragma mark  微软雅黑：加粗字体
+(UIFont *)boldMicrosoftYaHeiFontOfSize:(CGFloat)size{
    return [UIFont fontWithName:@"MicrosoftYaHei-Bold" size:size];
}




#pragma mark  DroidSansFallback
+(UIFont *)customFontNamedDroidSansFallbackWithFontOfSize:(CGFloat)size{
    return [UIFont fontWithName:@"DroidSansFallback" size:size];
}


#pragma mark --- 字体自定义

+ (UIFont *)customFontOfSize:(CGFloat)size {
    
    double version = [[UIDevice currentDevice].systemVersion doubleValue];
    if (version >= 9.0) {
        if (SCREEN_WIDTH == iPhone45ScreenWidth) {
            return [UIFont fontWithName:@"PingFangSC-Light" size:size * sizeScale];
        }else{
            
            return [UIFont fontWithName:@"PingFangSC-Light" size:size];
        }
    }else {
        if (SCREEN_WIDTH == iPhone45ScreenWidth) {
            return [UIFont systemFontOfSize:size * sizeScale];
        }else{
            return [UIFont systemFontOfSize:size];
        }
        
    }
}

+ (UIFont *)customBoldFontOfSize:(CGFloat)size {
    
    double version = [[UIDevice currentDevice].systemVersion doubleValue];
    
    if (version >= 9.0) {
        if (SCREEN_WIDTH == iPhone45ScreenWidth) {
            return [UIFont fontWithName:@"PingFangTC-Medium" size:size * sizeScale];
        }else{
            
            return [UIFont fontWithName:@"PingFangTC-Medium" size:size];
        }
    }else {
        if (SCREEN_WIDTH == iPhone45ScreenWidth) {
            return [UIFont boldSystemFontOfSize:size * sizeScale];
        }else{
            return [UIFont boldSystemFontOfSize:size];
        }
        
    }
    
    
}


+ (UIFont *)customRegularFontOfSize:(CGFloat)size {
    
    double version = [[UIDevice currentDevice].systemVersion doubleValue];
    
    if (version >= 9.0) {
        if (SCREEN_WIDTH == iPhone45ScreenWidth) {
            return [UIFont fontWithName:@"PingFangSC-Regular" size:size * sizeScale];
        }else{
            return [UIFont fontWithName:@"PingFangSC-Regular" size:size];
        }
    }else {
        if (SCREEN_WIDTH == iPhone45ScreenWidth) {
            return [UIFont systemFontOfSize:size  * sizeScale];
        }else{
            return [UIFont systemFontOfSize:size];
        }
        
    }
}

+ (UIFont *)customFontOfpx:(CGFloat)px{
    return [self customFontOfSize:px * pxScale];
}

+ (UIFont *)customBoldFontOfpx:(CGFloat)px{
    return [self customBoldFontOfSize:px * pxScale];
    
}

+ (UIFont *)customRegularFontOfpx:(CGFloat)px{
    return [self customRegularFontOfSize:px * pxScale];
}
















@end
