//
//  NewsModel.h
//  DAY-07项目
//
//  Created by qianfeng on 16/1/12.
//  Copyright (c) 2016年 苏威. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NewsModel : NSObject
@property (copy ,nonatomic)NSString * title;
@property(nonatomic,copy)NSString * ID;
@property (copy ,nonatomic)NSString * body;
@property (copy ,nonatomic)NSString * commentCount;
@property (copy ,nonatomic)NSString * author;
@property(nonatomic,assign)NSInteger authorid;
@property (strong ,nonatomic)NSString * pubDate;
@property (copy ,nonatomic)NSString * url;
@property (strong ,nonatomic)NSString * newstype;

@property (assign ,nonatomic)CGRect firstFrame;
@property (assign ,nonatomic)CGRect secondFrame;
@property (assign ,nonatomic)CGRect thirdFrame;
@property (assign ,nonatomic)CGRect fourthFrame;
@property (assign ,nonatomic)CGRect fiveFrame;
@property (assign ,nonatomic)CGFloat maxH;

+(id)newModelWithDict:(NSDictionary *)dict;
-(id)initWithDict:(NSDictionary *)dict;
+(NSArray *)arrayWithUrlString:(NSString *)str data:(NSData *)data;
@end
