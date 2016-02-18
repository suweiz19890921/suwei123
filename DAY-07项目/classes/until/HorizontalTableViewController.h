//
//  HorizontalTableViewController.h
//  DAY-07项目
//
//  Created by qianfeng on 16/1/11.
//  Copyright (c) 2016年 苏威. All rights reserved.
//

#import <UIKit/UIKit.h>
@class GPTitleBarView;
@interface HorizontalTableViewController : UITableViewController
@property (nonatomic,strong)NSArray * ctrlArray;
-(id)initWithArray:(NSArray *)array titleView:(GPTitleBarView *)titleView;
-(void)changeFlag:(NSInteger)flag view1:(GPTitleBarView *)view1;
@end
