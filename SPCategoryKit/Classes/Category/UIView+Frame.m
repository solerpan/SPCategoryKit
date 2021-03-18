//
//  UIView+Frame.m
//  Created by 潘亮 on 2021/3/18.
//

#import "UIView+Frame.h"

@implementation UIView (Frame)

- (void)setX:(CGFloat)x
{
    CGRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (CGFloat)x
{
    return self.frame.origin.x;
}

- (void)setY:(CGFloat)y
{
    CGRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (CGFloat)y
{
    return self.frame.origin.y;
}

- (void)setWidth:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (CGFloat)width
{
    return self.frame.size.width;
}

- (void)setHeight:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)height
{
    return self.frame.size.height;
}

- (void)setBottom:(CGFloat)bottom
{
    CGRect frame = self.frame;
    frame.origin.y = bottom - frame.size.height;
    self.frame = frame;
}

- (CGFloat)bottom
{
    return CGRectGetMaxY(self.frame);
}

- (CGFloat)tail
{
    return CGRectGetMaxX(self.frame);
}

- (void)setTail:(CGFloat)tail
{
    CGRect frame = self.frame;
    frame.origin.x = tail - frame.size.width;
    self.frame = frame;
}

- (void)setMiddleX:(CGFloat)middleX
{
    CGRect frame = self.frame;
    frame.origin.x = middleX - frame.size.width / 2;
    self.frame = frame;
}

- (CGFloat)middleX
{
    return CGRectGetMidX(self.frame);
}

- (void)setMiddleY:(CGFloat)middleY
{
    CGRect frame = self.frame;
    frame.origin.y = middleY - frame.size.height / 2 ;
    self.frame = frame;
}

- (CGFloat)middleY
{
    return CGRectGetMidY(self.frame);
}

#pragma mark --- alen添加

- (CGFloat)ak_width
{
    return self.frame.size.width;
}

- (void)setAk_width:(CGFloat)width
{
    CGRect frame = self.frame;
    frame.size.width = width;
    self.frame = frame;
}

- (void)setAk_height:(CGFloat)height
{
    CGRect frame = self.frame;
    frame.size.height = height;
    self.frame = frame;
}

- (CGFloat)ak_height
{
    return self.frame.size.height;
}

- (void)setAk_centerX:(CGFloat)centerX
{
    CGPoint center = self.center;
    center.x = centerX;
    self.center = center;
}

- (CGFloat)ak_centerX
{
    return self.center.x;
}

- (void)setAk_centerY:(CGFloat)centerY
{
    CGPoint center = self.center;
    center.y = centerY;
    self.center = center;
}

- (CGFloat)ak_centerY
{
    return self.center.y;
}

- (void)setAk_origin:(CGPoint)origin
{
    CGRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

- (CGPoint)ak_origin
{
    return self.frame.origin;
}

- (void)setAk_size:(CGSize)size
{
    CGRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (CGSize)ak_size
{
    return self.frame.size;
}

- (void)setAk_x:(CGFloat)ak_x
{
    CGRect frame = self.frame;
    frame.origin.x = ak_x;
    self.frame = frame;
}

- (CGFloat)ak_x
{
    return self.frame.origin.x;
}

- (void)setAk_y:(CGFloat)ak_y
{
    CGRect frame = self.frame;
    frame.origin.y = ak_y;
    self.frame = frame;
}

- (CGFloat)ak_y
{
    return self.frame.origin.y;
}
- (CGFloat)ak_left
{
    return self.frame.origin.x;
}

- (void)setAk_left:(CGFloat)ak_left
{
    CGRect frame = self.frame;
    frame.origin.x = ak_left;
    self.frame = frame;
}

- (CGFloat)ak_top
{
    return self.frame.origin.y;
}

- (void)setAk_top:(CGFloat)ak_top
{
    CGRect frame = self.frame;
    frame.origin.y = ak_top;
    self.frame = frame;
}

- (CGFloat)ak_right {
    return self.frame.origin.x + self.frame.size.width;
}

- (void)setAk_right:(CGFloat)ak_right {
    CGRect frame = self.frame;
    frame.origin.x = ak_right - frame.size.width;
    self.frame = frame;
}

- (CGFloat)ak_bottom {
    return self.frame.origin.y + self.frame.size.height;
}

- (void)setAk_bottom:(CGFloat)ak_bottom {
    CGRect frame = self.frame;
    frame.origin.y = ak_bottom - frame.size.height;
    self.frame = frame;
}


@end
