//
//  NewsCell.m
//  DAY-07项目
//
//  Created by qianfeng on 16/1/12.
//  Copyright (c) 2016年 苏威. All rights reserved.
//

#import "NewsCell.h"
@interface NewsCell()
@property (weak, nonatomic) IBOutlet UILabel *firstLabel;

@property (weak, nonatomic) IBOutlet UILabel *secondLabel;
@property (weak, nonatomic) IBOutlet UILabel *thirdLabel;
@property (weak, nonatomic) IBOutlet UILabel *fourthLabel;
@property (weak, nonatomic) IBOutlet UILabel *fiveLabel;

@end
@implementation NewsCell
+(id)cellWithTableView:(UITableView *)tableView{
    NSString * className=NSStringFromClass([self class]);
    UINib * nib=[UINib nibWithNibName:className bundle:nil];
    [tableView registerNib:nib forCellReuseIdentifier:className];
    return [tableView dequeueReusableCellWithIdentifier:className];
}

-(void)setModel:(id)model{
    _model=model;
    NSString * className=NSStringFromClass([model class]);
    if ([className isEqualToString:@"NewsModel"]) {
        
       NewsModel * newsModel=(NewsModel *)model;
        self.firstLabel.text=newsModel.title;
        self.firstLabel.numberOfLines=0;
        self.firstLabel.font=[UIFont systemFontOfSize:16];
        self.firstLabel.frame=newsModel.firstFrame;
        
        self.secondLabel.text=newsModel.body;
        self.secondLabel.font=[UIFont systemFontOfSize:14];
        self.secondLabel.numberOfLines=0;
        self.secondLabel.frame=newsModel.secondFrame;
        
        self.thirdLabel.text=newsModel.author;
        self.thirdLabel.numberOfLines=0;
        self.thirdLabel.font=[UIFont systemFontOfSize:14];
        self.thirdLabel.frame=newsModel.thirdFrame;
        
        self.fourthLabel.text=[GPUntil createDateStr:newsModel.pubDate];
        self.fourthLabel.numberOfLines=0;
        self.fourthLabel.font=[UIFont systemFontOfSize:14];
        self.fourthLabel.frame=newsModel.fourthFrame;
        
        self.fiveLabel.text=newsModel.commentCount;
        self.fiveLabel.numberOfLines=0;
        self.fiveLabel.font=[UIFont systemFontOfSize:14];
        self.fiveLabel.frame=newsModel.fiveFrame;
    }else if([className isEqualToString:@"BlogModel"]){
        BlogModel * blogModel=(BlogModel *)model;
        self.firstLabel.text=blogModel.title;
        self.firstLabel.numberOfLines=0;
        self.firstLabel.font=[UIFont systemFontOfSize:16];
        self.firstLabel.frame=blogModel.firstFrame;
        
        self.secondLabel.text=blogModel.body;
        self.secondLabel.font=[UIFont systemFontOfSize:14];
        self.secondLabel.numberOfLines=0;
        self.secondLabel.frame=blogModel.secondFrame;
        
        self.thirdLabel.text=blogModel.authorname;
        self.thirdLabel.numberOfLines=0;
        self.thirdLabel.font=[UIFont systemFontOfSize:14];
        self.thirdLabel.frame=blogModel.thirdFrame;
        
        self.fourthLabel.text=[GPUntil createDateStr:blogModel.pubDate];
        self.fourthLabel.numberOfLines=0;
        self.fourthLabel.font=[UIFont systemFontOfSize:14];
        self.fourthLabel.frame=blogModel.fourthFrame;
        
        self.fiveLabel.text=blogModel.commentCount;
        self.fiveLabel.numberOfLines=0;
        self.fiveLabel.font=[UIFont systemFontOfSize:14];
        self.fiveLabel.frame=blogModel.fiveFrame;
    }
    
    

}



- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
