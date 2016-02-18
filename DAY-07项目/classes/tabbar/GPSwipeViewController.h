//
//  GPSwipeViewController.h
//  DAY-07项目
//
//  Created by qianfeng on 16/1/11.
//  Copyright (c) 2016年 苏威. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GPSwipeViewController : UIViewController
/*
 1.主标题
 2.子标题数组
 3.控制器数组
 
 */

-(id)initWithTitle:(NSString *)title subTitles:(NSArray *)subTitles controllers:(NSArray *)controllers;
@end
