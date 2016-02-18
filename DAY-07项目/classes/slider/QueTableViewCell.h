//
//  QueTableViewCell.h
//  DAY-07项目
//
//  Created by qianfeng on 16/1/14.
//  Copyright (c) 2016年 苏威. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "QueModel.h"
@interface QueTableViewCell : UITableViewCell
@property (strong ,nonatomic)QueModel  *model;
+(id)queCellWithTabelView:(UITableView *)tableView;
@end
