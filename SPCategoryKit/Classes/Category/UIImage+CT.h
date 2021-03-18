//
//  UIImage+CT.h
//  Created by 潘亮 on 2021/3/18.

#import <UIKit/UIKit.h>

#define ImageScale 0.2
#define LogoImageMargin 5

@interface UIImage (CT)

+ (NSData *)compressImage:(UIImage *)image toByte:(NSUInteger)maxLength;
- (UIImage *)scaleFromImage:(UIImage *)image toSize:(CGSize)size;
- (UIImage *)thumbnailWithImageWithoutScale:(UIImage *)image size:(CGSize)asize;
- (UIImage *)resizedSquareImage:(CGFloat)length;
+(UIImage *)resizedImage:(NSString *)name;
+(UIImage *)resizedImage:(NSString *)name left:(CGFloat)left top:(CGFloat)top;
//纯色图片
+ (UIImage *)createImageWithColor:(UIColor*)color;
+ (UIImage *)createImageWithColor:(UIColor *)color title:(NSString *)title frame:(CGRect)frame;
//取颜色color背景图片
+ (UIImage *)imageFormColor:(UIColor *)color frame:(CGRect)frame;
//带居中文字的图片
- (UIImage *)imageWithTitle:(NSString *)title fontSize:(CGFloat)fontSize;
//截屏方法
+(instancetype)renderView:(UIView *)renderView;
//图片家水印
+(instancetype)waterWithBgName:(NSString *)bg waterLogo:(NSString *)water;
//裁剪图片为园
+(instancetype)clipWithImageName:(NSString*)name bordersW:(CGFloat)bordersW borderColor:(UIColor *)borderColor;
//读取本地图片
+ (UIImage*)getImage:(NSString *)imageName;
/** 把图片缩小到指定的宽度范围内为止 */
- (UIImage *)scaleImageWithWidth:(CGFloat)width;
- (UIImage *)scaleImageWithWidthForChat:(CGFloat)width;
- (UIImage *)imageCropToRect:(CGRect)rect;
- (UIImage *)drawEnvelopRect:(CGRect)rect triangleDirectionLeft:(BOOL)bLeft;


@end
