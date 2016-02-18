//
//  GPLeftViewController.m
//  DAY-07项目
//
//  Created by qianfeng on 16/1/14.
//  Copyright (c) 2016年 苏威. All rights reserved.
//

#import "GPLeftViewController.h"
#import "QueModel.h"
#import "QueTableViewCell.h"
@interface GPLeftViewController ()

@end

@implementation GPLeftViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)downLoad{
    
    
    NSString * strUrl=[NSString stringWithFormat:KquestionUrl,self.cIndex,self.curIndex];
    NSURL * url=[NSURL URLWithString:strUrl];
    NSLog(@"%@",url);
    __weak typeof(self) weakSelf = self;
    AFHTTPRequestOperationManager * manager=[[AFHTTPRequestOperationManager alloc]init];
    manager.responseSerializer=[AFOnoResponseSerializer serializer];
    [manager GET:strUrl parameters:nil success:^(AFHTTPRequestOperation *operation, ONOXMLDocument * doc) {
        ONOXMLElement * posts=[doc.rootElement firstChildWithTag:@"posts"];
        
        NSArray * arr=[posts childrenWithTag:@"post"];
        if (self.curIndex==0) {
            [self.dataArray removeAllObjects];
        }
        for (ONOXMLElement * ele in arr) {
            QueModel * model=[QueModel queModelWithElemeng:ele];
            [weakSelf.dataArray addObject:model];
            //NSLog(@"name********%@",model.name);
        }
        
        [weakSelf .tableView reloadData];
        [weakSelf.refreshControl endRefreshing];
        
        
        if (arr.count<20) {
            self.lastCell.status=LastCellStatusFinished;
        }else if(arr.count>=20){
            self.lastCell.status=LastCellStatusMore;
        }
        weakSelf.isLoading=NO;
        
        
        //self.lastCell.status=LastCellStatusMore;
        weakSelf.lastCell.hidden=NO;
        
        
        
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        [weakSelf.refreshControl endRefreshing];
        
        weakSelf.lastCell.status = LastCellStatusError;
        weakSelf.isLoading = NO;
    }];
    
    
    
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    return self.dataArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    QueModel * model=self.dataArray[indexPath.row];
    QueTableViewCell * cell=[QueTableViewCell queCellWithTabelView:tableView];
    cell.model=model;
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    QueModel * model=self.dataArray[indexPath.row];
    return model.maxH+5;
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
