//
//  UIImage+CT.m
//  CTIMForiOS
//
//  Created by Linst on 16/7/4.
//  Copyright © 2016年 Mac. All rights reserved.
//

#import "UIImage+CT.h"

@implementation UIImage (CT)

+ (NSData *)compressImage:(UIImage *)image toByte:(NSUInteger)maxLength {
  // Compress by quality
  CGFloat compression = 1;
  NSData *data = UIImageJPEGRepresentation(image, compression);
  if (data.length < maxLength) return data;
  
  CGFloat max = 1;
  CGFloat min = 0;
  for (int i = 0; i < 6; ++i) {
    compression = (max + min) / 2;
    data = UIImageJPEGRepresentation(image, compression);
    if (data.length < maxLength * 0.9) {
      min = compression;
    } else if (data.length > maxLength) {
      max = compression;
    } else {
      break;
    }
  }
  if (data.length < maxLength) return data;
  
  UIImage *resultImage = [UIImage imageWithData:data];
  // Compress by size
  NSUInteger lastDataLength = 0;
  while (data.length > maxLength && data.length != lastDataLength) {
    lastDataLength = data.length;
    CGFloat ratio = (CGFloat)maxLength / data.length;
    CGSize size = CGSizeMake((NSUInteger)(resultImage.size.width * sqrtf(ratio)),
                             (NSUInteger)(resultImage.size.height * sqrtf(ratio))); // Use NSUInteger to prevent white blank
    UIGraphicsBeginImageContext(size);
    [resultImage drawInRect:CGRectMake(0, 0, size.width, size.height)];
    resultImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    data = UIImageJPEGRepresentation(resultImage, compression);
  }
  
  return data;
}

//1.改变图像的尺寸，方便上传服务器
- (UIImage *)scaleFromImage:(UIImage *)image toSize:(CGSize)size
{
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

//2.保持原来的长宽比，生成一个缩略图
- (UIImage *)thumbnailWithImageWithoutScale:(UIImage *)image size:(CGSize)asize
{
    UIImage *newimage;
    if (nil == image) {
        newimage = nil;
    }
    else{
        CGSize oldsize = image.size;
        CGRect rect;
        if (asize.width/asize.height > oldsize.width/oldsize.height) {
            rect.size.width = asize.height*oldsize.width/oldsize.height;
            rect.size.height = asize.height;
            rect.origin.x = (asize.width - rect.size.width)/2;
            rect.origin.y = 0;
        }
        else{
            rect.size.width = asize.width;
            rect.size.height = asize.width*oldsize.height/oldsize.width;
            rect.origin.x = 0;
            rect.origin.y = (asize.height - rect.size.height)/2;
        }
        UIGraphicsBeginImageContext(asize);
        CGContextRef context = UIGraphicsGetCurrentContext();
        CGContextSetFillColorWithColor(context, [[UIColor clearColor] CGColor]);
        UIRectFill(CGRectMake(0, 0, asize.width, asize.height));//clear background
        [image drawInRect:rect];
        newimage = UIGraphicsGetImageFromCurrentImageContext();
        UIGraphicsEndImageContext();
    }
    return newimage;
}

- (UIImage *)resizedSquareImage:(CGFloat)length
{
    CGRect rect = CGRectMake(0, 0, length, length);
    
    // 开始上下文 目标大小是 这么大
    UIGraphicsBeginImageContext(rect.size);
    
    // 在指定区域内绘制图像
    [self drawInRect:rect];
    
    // 从上下文中获得绘制结果
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 关闭上下文返回结果
    UIGraphicsEndImageContext();
    
    return resultImage;
}

+ (UIImage *)resizedImage:(NSString *)name
{
    UIImage *image = [UIImage imageNamed:name];
    return [image stretchableImageWithLeftCapWidth:image.size.width * 0.5 topCapHeight:image.size.height * 0.5];
}

+(UIImage *)resizedImage:(NSString *)name left:(CGFloat)left top:(CGFloat)top
{
    UIImage *image=[UIImage imageNamed:name];
    image=[image stretchableImageWithLeftCapWidth:image.size.width*left topCapHeight:image.size.height*top];
    return image;
}

#pragma mark - item -

+ (UIImage *)createImageWithColor:(UIColor*)color {
    CGRect rect = CGRectMake(0.0f, 0.0f, 1.0f, 1.0f);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

+ (UIImage *)createImageWithColor:(UIColor *)color title:(NSString *)title frame:(CGRect)frame {
    CGRect rect = frame;
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    
    UIFont *font = [UIFont systemFontOfSize:12.f];
    NSMutableParagraphStyle *style = [[NSMutableParagraphStyle alloc] init];
    style.alignment = NSTextAlignmentCenter;
    NSDictionary *attrsDict = [NSDictionary dictionaryWithObjectsAndKeys:style,NSParagraphStyleAttributeName,font, NSFontAttributeName,[UIColor whiteColor],NSForegroundColorAttributeName, nil];
    
    CGSize titleSize = [title sizeWithAttributes:attrsDict];
    CGFloat titleX = 0.5 * (rect.size.width - titleSize.width);
    CGFloat titleY = 0.5 * (rect.size.height - titleSize.height);
    
    [title drawInRect:CGRectMake(titleX, titleY, titleSize.width, titleSize.height) withAttributes:attrsDict];
    
    UIImage *theImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return theImage;
}

#pragma mark 截屏
+(instancetype)renderView:(UIView *)renderView
{
    //应该给一个延迟的效果
    //获得图片上下文
    UIGraphicsBeginImageContextWithOptions(renderView.frame.size, NO, 0.0);
    //将控制器的view的layer渲染到图层
    [renderView.layer renderInContext:UIGraphicsGetCurrentContext()];
    //去除图片
    UIImage *newImage=UIGraphicsGetImageFromCurrentImageContext();
    ///Users/think_lion/Desktop
    //将新图片压缩成二进制文件
    return newImage;
    
}

#pragma mark 裁剪图拍你的芳芳
+(instancetype)clipWithImageName:(NSString *)name bordersW:(CGFloat)bordersW borderColor:(UIColor *)borderColor
{
    UIImage *oldImage=[UIImage imageNamed:name];
    CGFloat borberW=bordersW;
    CGFloat imageW=oldImage.size.width+borberW*2;
    CGFloat imageH=oldImage.size.height+borberW*2;
    CGSize  imageSize=CGSizeMake(imageW, imageH);
    UIGraphicsBeginImageContextWithOptions(imageSize, NO, 0.0);
    
    CGContextRef ref=UIGraphicsGetCurrentContext();
    //画一个大圆
    [borderColor set];
    CGFloat bigRadius=imageW*0.5;
    CGFloat bigX=imageW*0.5;
    CGFloat bigY=imageH*0.5;
    CGContextAddArc(ref, bigX, bigY, bigRadius, 0, M_PI*2, 0);
    //渲染到图层
    CGContextFillPath(ref);
    
    //画一个小圆
    CGFloat smallRadius=bigRadius-borberW;
    CGContextAddArc(ref, bigX, bigY, smallRadius, 0, M_PI*2, 0);
    //裁剪
    CGContextClip(ref);
    //画图
    [oldImage drawInRect:CGRectMake(borberW, borberW, oldImage.size.width, oldImage.size.height)];
    //去除图片
    UIImage *newImage=UIGraphicsGetImageFromCurrentImageContext();
    return newImage;
}
#pragma mark 图片加水印的方法
+(instancetype)waterWithBgName:(NSString *)bg waterLogo:(NSString *)water
{
    // 获得一张图片
    UIImage *bgName=[UIImage imageNamed:bg];
    //基于上下文 位图(bitmap) 将所有的东西绘制到一张新的图片上面去
    //1.创建一个基于位图的上下文
    //size 新图片的尺寸
    //opaque  YES 表示不透明 NO表示透明
    //运行这行代码后 旧相当于创建了一个新的bitmap  相当于创建了UIImage对象
    UIGraphicsBeginImageContextWithOptions(bgName.size, YES, 0.0);
    //2.话背景
    [bgName drawInRect:CGRectMake(0, 0, bgName.size.width, bgName.size.height)];
    //添加水印logo
    UIImage *logo=[UIImage imageNamed:water];
    CGFloat scale=ImageScale;
    CGFloat margin=LogoImageMargin;
    CGFloat logoW=logo.size.width*scale;;
    CGFloat logoH=logo.size.height*scale;
    CGFloat logoX=bgName.size.width-logoW-margin;
    CGFloat logoY=bgName.size.height-logoH-margin;
    
    [logo drawInRect:CGRectMake(logoX, logoY, logoW, logoH)];
    //4.从上下文去除获得的新图片对象
    UIImage *newImage=UIGraphicsGetImageFromCurrentImageContext();
    //5.结束上下次文
    UIGraphicsEndImageContext();
    //返回新创建的图片对象
    return newImage;
}

- (UIImage *)imageCropToRect:(CGRect)rect {
    rect.origin.x *= self.scale;
    rect.origin.y *= self.scale;
    rect.size.width *= self.scale;
    rect.size.height *= self.scale;
    if (rect.size.width <= 0 || rect.size.height <= 0) return nil;
    CGImageRef imageRef = CGImageCreateWithImageInRect(self.CGImage, rect);
    UIImage *image = [UIImage imageWithCGImage:imageRef scale:self.scale orientation:self.imageOrientation];
    CGImageRelease(imageRef);
    return image;
}

+ (UIImage*)getImage:(NSString *)imageName
{
    UIImage * image = [UIImage imageNamed:imageName];
    if (!image) {
#pragma clang diagnostic push
#pragma clang diagnostic ignored "-Wunused-variable"
        NSString * error = [NSString stringWithFormat:@"图片 %@ 丢失！",imageName];
        NSLog(@"%@",error);
#pragma clang diagnostic pop
    }
    return image;
}

- (UIImage *)scaleImageWithWidth:(CGFloat)width {
    if (self.size.width < width || width <= 0) {
        return self;
    }
    CGFloat scale = self.size.width/width;
    CGFloat height = self.size.height/scale;
    
    CGRect rect = CGRectMake(0, 0, width, height);
    
    // 开始上下文 目标大小是 这么大
    UIGraphicsBeginImageContext(rect.size);
    
    // 在指定区域内绘制图像
    [self drawInRect:rect];
    
    // 从上下文中获得绘制结果
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 关闭上下文返回结果
    UIGraphicsEndImageContext();
    return resultImage;
}

- (UIImage *)scaleImageWithWidthForChat:(CGFloat)width {
    if (self.size.width < width || width <= 0) {
        return self;
    }
    CGFloat scale = self.size.width/width;
    CGFloat height = self.size.height/scale;
    
    if (self.size.height < 35) {
        height = self.size.height;
    }
    
    CGRect rect = CGRectMake(0, 0, width, height);
    
    // 开始上下文 目标大小是 这么大
    UIGraphicsBeginImageContext(rect.size);
    
    // 在指定区域内绘制图像
    [self drawInRect:rect];
    
    // 从上下文中获得绘制结果
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 关闭上下文返回结果
    UIGraphicsEndImageContext();
    return resultImage;
}

- (UIImage *)squareImageWithLength:(CGFloat)length {
    CGFloat scale = 0.f;
    CGFloat height = 0.f;
    CGFloat width = 0.f;
    if (self.size.width > length && length > 0) {
        scale = self.size.width/length;
    } else if (self.size.height > length && length > 0) {
        
    }
    height = self.size.height/scale;
    
    CGRect rect = CGRectMake(0, 0, width, height);
    
    // 开始上下文 目标大小是 这么大
    UIGraphicsBeginImageContext(rect.size);
    
    // 在指定区域内绘制图像
    [self drawInRect:rect];
    
    // 从上下文中获得绘制结果
    UIImage *resultImage = UIGraphicsGetImageFromCurrentImageContext();
    
    // 关闭上下文返回结果
    UIGraphicsEndImageContext();
    return resultImage;
}
//群组头像
+ (UIImage *)imageFormColor:(UIColor *)color frame:(CGRect)frame{
    CGRect rect=CGRectMake(0, 0, frame.size.width, frame.size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context=UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, rect);
    UIImage *image=UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
}

- (UIImage *)imageWithTitle:(NSString *)title fontSize:(CGFloat)fontSize {
    //画布大小
    CGSize size=CGSizeMake(self.size.width,self.size.height);
    //创建一个基于位图的上下文
    UIGraphicsBeginImageContextWithOptions(size,NO,0.0);//opaque:NO  scale:0.0
    
    [self drawAtPoint:CGPointMake(0.0,0.0)];
    
    //文字居中显示在画布上
    NSMutableParagraphStyle* paragraphStyle = [[NSParagraphStyle defaultParagraphStyle] mutableCopy];
    paragraphStyle.lineBreakMode = NSLineBreakByCharWrapping;
    paragraphStyle.alignment=NSTextAlignmentCenter;//文字居中
    
    //计算文字所占的size,文字居中显示在画布上
    CGSize sizeText=[title boundingRectWithSize:self.size options:NSStringDrawingUsesLineFragmentOrigin
                                     attributes:@{NSFontAttributeName:[UIFont systemFontOfSize:fontSize]}context:nil].size;
    CGFloat width = self.size.width;
    CGFloat height = self.size.height;
    
    CGRect rect = CGRectMake((width-sizeText.width)/2, (height-sizeText.height)/2, sizeText.width, sizeText.height);
    
    //绘制文字
    [title drawInRect:rect withAttributes:@{ NSFontAttributeName:[UIFont systemFontOfSize:fontSize],NSForegroundColorAttributeName:[ UIColor whiteColor],NSParagraphStyleAttributeName:paragraphStyle}];
    
    //返回绘制的新图形
    UIImage *newImage= UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

- (UIImage *)drawEnvelopRect:(CGRect)rect triangleDirectionLeft:(BOOL)bLeft {
    rect.origin = CGPointZero;
    
    UIGraphicsBeginImageContext(rect.size);
    
    [self drawInRect:rect];
    
    CGFloat width = rect.size.width;
    CGFloat height = rect.size.height + 1;//莫名其妙会出现绘制底部有残留 +1像素遮盖
    // 简便起见，这里把圆角半径设置为长和宽平均值的1/10
    CGFloat radius = 6;
    CGFloat margin = 8;//留出上下左右的边距
    
    CGFloat triangleSize = 8;//三角形的边长
    CGFloat triangleMarginTop = 8;//三角形距离圆角的距离
    
    CGFloat borderOffset = 3;//阴影偏移量
    UIColor *borderColor = [UIColor blackColor];//阴影的颜色
    
    // 获取CGContext，注意UIKit里用的是一个专门的函数
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetRGBStrokeColor(context,0,0,0,1);//画笔颜色
    CGContextSetLineWidth(context, 1);//画笔宽度
    // 移动到初始点
    CGContextMoveToPoint(context, radius + margin, margin);
    // 绘制第1条线和第1个1/4圆弧
    CGContextAddLineToPoint(context, width - radius - margin, margin);
    CGContextAddArc(context, width - radius - margin, radius + margin, radius, -0.5 * M_PI, 0.0, 0);
    CGContextAddLineToPoint(context, width, margin + radius);
    CGContextAddLineToPoint(context, width, 0);
    CGContextAddLineToPoint(context, radius + margin,0);
    // 闭合路径
    CGContextClosePath(context);
    
    // 绘制第2条线和第2个1/4圆弧
    CGContextMoveToPoint(context, width - margin, margin + radius);
    CGContextAddLineToPoint(context, width, margin + radius);
    CGContextAddLineToPoint(context, width, height - margin - radius);
    CGContextAddLineToPoint(context, width - margin, height - margin - radius);
    
    float arcSize = 3;//角度的大小
    
    if (bLeft) {
        float arcStartY = margin + radius + triangleMarginTop + triangleSize - (triangleSize - arcSize / margin * triangleSize) / 2;//圆弧起始Y值
        float arcStartX = width - arcSize;//圆弧起始X值
        float centerOfCycleX = width - arcSize - pow(arcSize / margin * triangleSize / 2, 2) / arcSize;//圆心的X值
        float centerOfCycleY = margin + radius + triangleMarginTop + triangleSize / 2;//圆心的Y值
        float radiusOfCycle = hypotf(arcSize / margin * triangleSize / 2, pow(arcSize / margin * triangleSize / 2, 2) / arcSize);//半径
        float angelOfCycle = asinf(0.5 * (arcSize / margin * triangleSize) / radiusOfCycle) * 2;//角度
        //绘制右边三角形
        CGContextAddLineToPoint(context, width - margin , margin + radius + triangleMarginTop + triangleSize);
        CGContextAddLineToPoint(context, arcStartX , arcStartY);
        CGContextAddArc(context, centerOfCycleX, centerOfCycleY, radiusOfCycle, angelOfCycle / 2, 0.0 - angelOfCycle / 2, 1);
        CGContextAddLineToPoint(context, width - margin , margin + radius + triangleMarginTop);
    }
    
    
    CGContextMoveToPoint(context, width - margin, height - radius - margin);
    CGContextAddArc(context, width - radius - margin, height - radius - margin, radius, 0.0, 0.5 * M_PI, 0);
    CGContextAddLineToPoint(context, width - margin - radius, height);
    CGContextAddLineToPoint(context, width, height);
    CGContextAddLineToPoint(context, width, height - radius - margin);
    
    
    // 绘制第3条线和第3个1/4圆弧
    CGContextMoveToPoint(context, width - margin - radius, height - margin);
    CGContextAddLineToPoint(context, width - margin - radius, height);
    CGContextAddLineToPoint(context, margin, height);
    CGContextAddLineToPoint(context, margin, height - margin);
    
    
    CGContextMoveToPoint(context, margin, height-margin);
    CGContextAddArc(context, radius + margin, height - radius - margin, radius, 0.5 * M_PI, M_PI, 0);
    CGContextAddLineToPoint(context, 0, height - margin - radius);
    CGContextAddLineToPoint(context, 0, height);
    CGContextAddLineToPoint(context, margin, height);
    
    
    // 绘制第4条线和第4个1/4圆弧
    CGContextMoveToPoint(context, margin, height - margin - radius);
    CGContextAddLineToPoint(context, 0, height - margin - radius);
    CGContextAddLineToPoint(context, 0, radius + margin);
    CGContextAddLineToPoint(context, margin, radius + margin);
    
    if (!bLeft) {
        float arcStartY = margin + radius + triangleMarginTop + (triangleSize - arcSize / margin * triangleSize) / 2;//圆弧起始Y值
        float arcStartX = arcSize;//圆弧起始X值
        float centerOfCycleX = arcSize + pow(arcSize / margin * triangleSize / 2, 2) / arcSize;//圆心的X值
        float centerOfCycleY = margin + radius + triangleMarginTop + triangleSize / 2;//圆心的Y值
        float radiusOfCycle = hypotf(arcSize / margin * triangleSize / 2, pow(arcSize / margin * triangleSize / 2, 2) / arcSize);//半径
        float angelOfCycle = asinf(0.5 * (arcSize / margin * triangleSize) / radiusOfCycle) * 2;//角度
        //绘制左边三角形
        CGContextAddLineToPoint(context, margin , margin + radius + triangleMarginTop);
        CGContextAddLineToPoint(context, arcStartX , arcStartY);
        CGContextAddArc(context, centerOfCycleX, centerOfCycleY, radiusOfCycle, M_PI + angelOfCycle / 2, M_PI - angelOfCycle / 2, 1);
        CGContextAddLineToPoint(context, margin , margin + radius + triangleMarginTop + triangleSize);
    }
    CGContextMoveToPoint(context, margin, radius + margin);
    CGContextAddArc(context, radius + margin, margin + radius, radius, M_PI, 1.5 * M_PI, 0);
    CGContextAddLineToPoint(context, margin + radius, 0);
    CGContextAddLineToPoint(context, 0, 0);
    CGContextAddLineToPoint(context, 0, radius + margin);

    CGContextSetShadowWithColor(context, CGSizeMake(0, 0), borderOffset, borderColor.CGColor);//阴影
    CGContextSetBlendMode(context, kCGBlendModeClear);
    CGContextDrawPath(context, kCGPathFill);
    
    UIImage *newImage= UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return newImage;
}

@end
