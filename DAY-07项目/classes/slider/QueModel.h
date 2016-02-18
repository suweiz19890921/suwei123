//
//  QueModel.h
//  DAY-07项目
//
//  Created by qianfeng on 16/1/14.
//  Copyright (c) 2016年 苏威. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface QueModel : NSObject
@property (copy ,nonatomic)NSString * portrait;
@property (copy ,nonatomic)NSString * qid;
@property (copy ,nonatomic)NSString * author;
@property (copy ,nonatomic)NSString * authorid;
@property (copy ,nonatomic)NSString * title;
@property (copy ,nonatomic)NSString * body;
@property (assign ,nonatomic)NSInteger answerCount;
@property (assign ,nonatomic)NSInteger viewCount;
@property (copy ,nonatomic)NSString * pubDate;
@property (copy ,nonatomic)NSString * name;
@property (copy ,nonatomic)NSString * time;



@property (assign ,nonatomic)CGRect oneFrame;
@property (assign ,nonatomic)CGRect twoFrame;
@property (assign ,nonatomic)CGRect threeFrame;
@property (assign ,nonatomic)CGRect fourFrame;
@property (assign ,nonatomic)CGRect fiveFrame;
@property (assign ,nonatomic)CGRect sixFrame;
@property (assign ,nonatomic)CGFloat maxH;

+(id)queModelWithElemeng:(ONOXMLElement *)element;

@end
