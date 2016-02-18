//
//  TweetModel.h
//  DAY-07项目
//
//  Created by qianfeng on 16/1/13.
//  Copyright (c) 2016年 苏威. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface TweetModel : NSObject
@property (copy ,nonatomic)NSString * ID;
@property (copy ,nonatomic)NSString * portrait;
@property (copy ,nonatomic)NSString * author;

@property (copy ,nonatomic)NSString * authorid;
@property (copy ,nonatomic)NSString * body;
@property (copy ,nonatomic)NSString * attach;
@property (assign ,nonatomic)NSInteger  appclient;

@property (copy ,nonatomic)NSString * commentCount;
@property (copy ,nonatomic)NSString * pubDate;
@property (copy ,nonatomic)NSString * imgSmall;
@property (copy ,nonatomic)NSString * imgBig;
@property (copy ,nonatomic)NSString * likeCount;
@property (copy ,nonatomic)NSString * isLike;

@property (strong ,nonatomic)NSString * name;
@property (copy ,nonatomic)NSString * uid;
@property (copy ,nonatomic)NSString * userPortrait;



@property  (assign,nonatomic)CGRect oneFrame;
@property  (assign,nonatomic)CGRect twoFrame;
@property  (assign,nonatomic)CGRect threeFrame;

@property  (assign,nonatomic)CGRect fourFrame;

@property  (assign,nonatomic)CGRect fiveFrame;

@property  (assign,nonatomic)CGRect sixFrame;

@property  (assign,nonatomic)CGRect sevenFrame;
@property (assign ,nonatomic)CGFloat maxH;


+(id)tweetModelWithDict:(NSDictionary *)dict;
-(id)initWithDict:(NSDictionary *)dict;
+(TweetModel *)tweetModelWith:(ONOXMLElement *)element;
@end

@interface User : NSObject
@property (copy ,nonatomic)NSString * name;
@property (assign ,nonatomic)NSInteger uid;
@property (copy ,nonatomic)NSString * portrait;

@end
