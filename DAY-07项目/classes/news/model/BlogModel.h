//
//  BlogModel.h
//  DAY-07项目
//
//  Created by qianfeng on 16/1/13.
//  Copyright (c) 2016年 苏威. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "NewsModel.h"
@interface BlogModel : NewsModel
@property (nonatomic,copy)NSString *authorname;
+(id)blogModelWithDict:(NSDictionary *)dict;
-(id)initWithDict:(NSDictionary *)dict;
@end
