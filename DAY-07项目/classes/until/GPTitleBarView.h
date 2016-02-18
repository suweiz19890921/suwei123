//
//  GPTitleBarView.h
//  DAY-07项目
//
//  Created by qianfeng on 16/1/11.
//  Copyright (c) 2016年 苏威. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface GPTitleBarView : UIView
@property (copy ,nonatomic)void (^titleBarSelectBlock)(NSInteger index,GPTitleBarView * titleView);
-(id)initWithTitleArray:(NSArray *)titleArray frame:(CGRect)frame;
@end
