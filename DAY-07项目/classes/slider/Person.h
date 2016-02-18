//
//  Person.h
//  DAY-07项目
//
//  Created by qianfeng on 16/1/14.
//  Copyright (c) 2016年 苏威. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
@property (nonatomic,assign)NSInteger uid;
@property (nonatomic,copy)NSString *location;
@property (nonatomic,copy)NSString *name;

@property (nonatomic,assign)NSInteger followers;
@property (nonatomic,assign)NSInteger fans;
@property (nonatomic,assign)NSInteger score;

@property (nonatomic,copy)NSString *portrait;
@property (nonatomic,assign)NSInteger favoritecount;
@property (nonatomic,assign)NSInteger gender;



+(id)personModelWithElemeng:(ONOXMLElement *)element;
@end
