//
//  NSString+MRExt.h
//  TogetherFortune
//
//  Created by ChunGuo on 15/12/11.
//  Copyright © 2016年 huxijun. All rights reserved.
//


//MD5加密
@interface NSString (MD5)

- (NSString*) MD5;

@end



//SHA加密
@interface NSString (SHA)

- (NSString*) SHA1;
- (NSString*) SHA256;

@end



//HMAC_MD5加密
@interface NSString (HMAC_MD5)

+ (NSString *)HMAC_MD5:(NSString *)key Value:(NSString *)value;

@end



//HMAC_SHA加密
@interface NSString (HMAC_SHA)

+ (NSString *)HMAC_SHA1:(NSString *)key Value:(NSString *)value;
+ (NSString *)HMAC_SHA256:(NSString *)key Value:(NSString *)value;

@end



//UTF8编码
@interface NSString (OAURLEncodingAdditions)

//编码NSString为UTF8（主要处理中文）
//比如处理前：http://zs.tb360.org/恒时灯(宽屏）.mp4
//   处理后：http://zs.tb360.org/%E6%81%92%E6%97%B6%E7%81%AF(%E5%AE%BD%E5%B1%8F%EF%BC%89.mp4
- (NSString *)URLEncodeString;

//编码NSString为UTF8（处理中文＋"!*'();:@&=+$,/?%#[]"）
//比如处理前：http://zs.tb360.org/恒时灯(宽屏）.mp4
//   处理后：http%3A%2F%2Fzs.tb360.org%2F%E6%81%92%E6%97%B6%E7%81%AF%28%E5%AE%BD%E5%B1%8F%EF%BC%89.mp4
- (NSString *)URLEncodeStringByLegalCharacters;

//解码UTF8为NSString（对上面两种进行解码）
- (NSString *)URLDecodeString;


#pragma mark ------ Alen 添加 ---------
// https://www.17shanyuan.com/mobile/index.php?act=help&op=help_activity_detail&project_id=741099
// https%3A%2F%2Fwww.17shanyuan.com%2Fmobile%2Findex.php%3Fact%3Dhelp%26op%3Dhelp_activity_detail%26project_id%3D741099
+ (NSString*)encodeString:(NSString*)unencodedString;

//URLDEcode
- (NSString *)decodeString:(NSString*)encodedString;
@end



//
@interface NSString (Common)

- (NSString *)trim;
- (BOOL)isEmpty;
- (BOOL)myContainsString:(NSString *)other;

@end



//yyyy-MM-dd HH:mm:ss 或 yyyy-MM-dd HH:mm:ss SSS
@interface NSString (TimeShow)

- (NSString *)getFormatTimeShow;

@end



//yyyy-MM-dd
@interface NSString (Birthday)

- (NSString *)getAfterYear;         //得到几零后
- (NSString *)getConstellation;     //得到星座
- (NSInteger)getAge;                //得到年龄

@end

@interface NSString (Json)

- (NSDictionary *)strToDict;
- (NSDictionary *)strToDict1;

@end

