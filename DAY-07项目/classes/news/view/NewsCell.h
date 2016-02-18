//
//  NewsCell.h
//  DAY-07项目
//
//  Created by qianfeng on 16/1/12.
//  Copyright (c) 2016年 苏威. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewsModel.h"
#import "BlogModel.h"
@interface NewsCell : UITableViewCell
@property (strong ,nonatomic)id  model;
+(id)cellWithTableView:(UITableView *)tableView;
@end
