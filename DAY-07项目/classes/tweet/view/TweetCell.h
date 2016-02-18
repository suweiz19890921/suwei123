//
//  TweetCell.h
//  DAY-07项目
//
//  Created by qianfeng on 16/1/13.
//  Copyright (c) 2016年 苏威. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TweetModel.h"
@interface TweetCell : UITableViewCell
@property (strong ,nonatomic)TweetModel * model;
+(id)tweetCellWithTableView:(UITableView *)tableView;
@end
