//
//  GPUntil.h
//  DAY-07项目
//
//  Created by qianfeng on 16/1/11.
//  Copyright (c) 2016年 苏威. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GPUntil : NSObject
//创建图片
+(UIImageView *)createImageViewFrame:(CGRect)frame imageName:(NSString *)imageName;
//创建label
+(UILabel *)createLableFrame:(CGRect)frame text:(NSString *)text font:(UIFont *)font;
//创建按钮
+(UIButton *)createBtnFrame:(CGRect)frame title:(NSString *)title target:(id)target action:(SEL)action;
+(NSString *)createDateStr:(NSString *)str;
+(NSArray *)creatArrayWithUrlString:(NSString *)str data:(NSData *)data;
+(UIButton *)createBtnFrame:(CGRect)frame imageName:(NSString *)imageName title:(NSString *)tiele color:(UIColor *)color target:(id)target action:(SEL)action radus:(CGFloat)radus;

+(void)saveUserWithUid:(NSInteger)uid name:(NSString *)name;
+(NSInteger)fetchUserId;
@end
