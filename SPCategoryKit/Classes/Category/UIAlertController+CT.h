//
//  UIAlertController+CT.h
//  CTIMForiOS
//
//  Created by 潘亮 on 2021/3/18.
//

#import <UIKit/UIKit.h>

typedef void(^CTAlertActionHandler)(UIAlertAction * action);


@interface UIAlertController (CT)

+ (instancetype)alertControllerWithTitle:(NSString *)title message:(NSString *)message cancelButtonTitle:(NSString *)cancelButtonTitle;

+ (instancetype)alertControllerWithTitle:(NSString *)title message:(NSString *)message action:(UIAlertAction *)action;

+ (instancetype)alertControllerWithTitle:(NSString *)title message:(NSString *)message actions:(NSArray <UIAlertAction *> *)actions;

+ (instancetype)actionControllerWithTitle:(NSString *)title message:(NSString *)message actions:(NSArray <UIAlertAction *> *)actions;
@end
