//
//  GPUntil.m
//  DAY-07项目
//
//  Created by qianfeng on 16/1/11.
//  Copyright (c) 2016年 苏威. All rights reserved.
//

#import "GPUntil.h"
#import "GDataXMLNode.h"
@implementation GPUntil
+(UIImageView *)createImageViewFrame:(CGRect)frame imageName:(NSString *)imageName{
    UIImageView * imageView=[[UIImageView alloc]initWithFrame:frame];
    imageView.image=[UIImage imageNamed:imageName];
    return imageView;
}
+(UILabel *)createLableFrame:(CGRect)frame text:(NSString *)text font:(UIFont *)font{
    UILabel * lable=[[UILabel alloc]initWithFrame:frame];
    lable.text=text;
    lable.font=font;
    return lable;
    
}

+(UIButton *)createBtnFrame:(CGRect)frame title:(NSString *)title target:(id)target action:(SEL)action{
    UIButton * btn=[UIButton buttonWithType:UIButtonTypeCustom];
    btn.frame=frame;
    [btn setTitle:title forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor colorWithWhite:150.0/255.0f alpha:1.0f] forState:UIControlStateNormal];
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    return btn;
 }
+(NSString *)createDateStr:(NSString *)str{
    NSDateFormatter * sm=[[NSDateFormatter alloc]init];
    [sm setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate * date=[sm dateFromString:str];
    NSCalendar * cal=[[NSCalendar alloc]initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSInteger unit=NSCalendarUnitYear|NSCalendarUnitMonth|NSCalendarUnitDay|NSCalendarUnitHour|NSCalendarUnitMinute|NSCalendarUnitSecond;
    
    NSDateComponents * com=[cal components:unit fromDate:date toDate:[NSDate date] options:0];
    NSString * dateStr=@"";
    if ([com year]>0) {
        dateStr=[NSString stringWithFormat:@"%ld年前",[com year]];
    }else if([com month]>0){
        dateStr=[NSString stringWithFormat:@"%ld月前",[ com month]];
    }else if([com day]>0){
        dateStr=[NSString stringWithFormat:@"%ld天前",[com day]];
    }else if([com hour]>0){
        dateStr=[NSString stringWithFormat:@"%ld小时前",[com hour]];
    }else if([com minute]>0){
        dateStr=[NSString stringWithFormat:@"%ld分钟",[com minute]];
    }else if([com second]>0){
        dateStr=[NSString stringWithFormat:@"%ld秒前",[com second]];
    }else dateStr=@"刚刚";
    return dateStr;

}

+(NSArray *)creatArrayWithUrlString:(NSString *)str data:(NSData *)data{
    
    NSLog(@"%ld",data.length);
    GDataXMLDocument * doc=[[GDataXMLDocument alloc]initWithData:data options:0 error:nil];
    
    GDataXMLElement*element= [doc rootElement];
    NSMutableArray * mArr=[[NSMutableArray alloc]init];//声明一个用来装词典的数组
    //通过两层for循环得到字典，并且将字典加入到数组中；
    for (GDataXMLElement*tem1 in element.children) {
                if (tem1.children.count>1){
                       NSString * key=tem1.name;
            NSLog(@"%@",key);
            for (GDataXMLElement*tem2 in tem1.children) {
                NSMutableDictionary*mDic2=[NSMutableDictionary dictionary];
                if (tem2.children.count>1) {
                    for (GDataXMLElement*tem3 in tem2.children){
                        
                        NSString * key=tem3.name;
                                              NSString * value=tem3.stringValue ;
                        [mDic2 setObject:value forKey:key];
                                       }
                    [mArr addObject:mDic2];
                }
            }
        }
    }
    return mArr;
}
+(UIButton *)createBtnFrame:(CGRect)frame imageName:(NSString *)imageName title:(NSString *)tiele color:(UIColor *)color target:(id)target action:(SEL)action radus:(CGFloat)radus {
    UIButton * button=[UIButton buttonWithType:UIButtonTypeCustom];
    button.frame=frame;
    [button setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [button setBackgroundColor:color];
    button.layer.cornerRadius=radus;
    [button setTitle:tiele forState:UIControlStateNormal];
    button.layer.masksToBounds=YES;
    
    return button;
}
+(void)saveUserWithUid:(NSInteger)uid name:(NSString *)name{
    NSUserDefaults * su=[NSUserDefaults standardUserDefaults];
    [su setObject:[NSNumber numberWithInteger:uid] forKey:@"uid"];
    [su setObject:name forKey:@"name"];

}
+(NSInteger)fetchUserId{
    NSUserDefaults * su=[NSUserDefaults standardUserDefaults];
    NSNumber * n=[su objectForKey:@"uid"];
    return [n integerValue];
}
@end
