//
//  GPBaseViewController.h
//  DAY-07项目
//
//  Created by qianfeng on 16/1/11.
//  Copyright (c) 2016年 苏威. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LastCell.h"
@interface GPBaseViewController : UITableViewController
@property (strong ,nonatomic)LastCell * lastCell;
@property (strong ,nonatomic)NSMutableArray * dataArray;
@property (assign ,nonatomic)NSInteger curIndex;
@property (assign ,nonatomic)BOOL isLoading;



@end
