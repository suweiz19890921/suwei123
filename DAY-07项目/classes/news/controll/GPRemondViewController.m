//
//  GPRemondViewController.m
//  DAY-07项目
//
//  Created by qianfeng on 16/1/11.
//  Copyright (c) 2016年 苏威. All rights reserved.
//

#import "GPRemondViewController.h"
#import "NewsCell.h"
#import "BlogModel.h"
@interface GPRemondViewController ()

@end

@implementation GPRemondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)downLoad{
    NSString * strUrl=[NSString stringWithFormat:recomndList,self.curIndex];
    NSURL * url=[NSURL URLWithString:strUrl];
    
    
    NSURLRequest * request=[[NSURLRequest alloc]initWithURL:url];
    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {
        NSArray * arr=[GPUntil creatArrayWithUrlString:nil data:data];
        //NSLog(@"%@",arr);
        if (self.curIndex==0) {
            [self.dataArray removeAllObjects];
        }
        for (NSDictionary * dict in arr) {
            BlogModel * model=[BlogModel blogModelWithDict:dict];
            [self.dataArray addObject:model];
        }
        [self .tableView reloadData];
        [self.refreshControl endRefreshing];
        
        if (arr.count<20) {
            self.lastCell.status=LastCellStatusFinished;
        }else if(arr.count>=20)
            self.lastCell.status=LastCellStatusMore;
        self.lastCell.hidden=NO;
        self.isLoading=NO;
    }];
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataArray.count;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    BlogModel * model=self.dataArray[indexPath.row];
    NewsCell * cell=[NewsCell cellWithTableView:tableView];
    cell.model=model;
    
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    BlogModel * model= self.dataArray[indexPath.row];
    
    return model.maxH+5;
}

@end
