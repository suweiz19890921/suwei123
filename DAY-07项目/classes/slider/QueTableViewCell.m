//
//  QueTableViewCell.m
//  DAY-07项目
//
//  Created by qianfeng on 16/1/14.
//  Copyright (c) 2016年 苏威. All rights reserved.
//

#import "QueTableViewCell.h"
@interface QueTableViewCell()
@property (weak, nonatomic) IBOutlet UIImageView *headImage;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *bodyLabel;

@property (weak, nonatomic) IBOutlet UILabel *userLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *reviewLabel;

@end
@implementation QueTableViewCell
+(id)queCellWithTabelView:(UITableView *)tableView{
    NSString * className=NSStringFromClass([self class]);
    UINib * nib=[UINib nibWithNibName:className bundle:nil];
    [tableView registerNib:nib forCellReuseIdentifier:className];
    return [tableView dequeueReusableCellWithIdentifier:className];
}
- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
-(void)setModel:(QueModel *)model{
    _model=model;
    [self.headImage sd_setImageWithURL:[NSURL URLWithString:model.portrait] placeholderImage:[UIImage imageNamed:@"default－portrait"]];
    self.headImage.frame=model.oneFrame;
    
    
    self.titleLabel.frame=model.twoFrame;
    self.titleLabel.font=[UIFont boldSystemFontOfSize:16];
    self.titleLabel.numberOfLines=0;
    self.titleLabel.text=model.title;
    
    self.bodyLabel.frame=model.threeFrame;
    self.bodyLabel.numberOfLines=0;
    self.bodyLabel.text=model.body;
    self.bodyLabel.font=[UIFont systemFontOfSize:14];
    
    self.userLabel.frame=model.fourFrame;
    self.userLabel.numberOfLines=0;
    self.userLabel.text=model.name;
    self.userLabel.font=[UIFont systemFontOfSize:14];
    
    self.timeLabel.frame=model.fiveFrame;
    self.timeLabel.text=[GPUntil createDateStr:model.pubDate];
    self.timeLabel.numberOfLines=0;
    self.timeLabel.font=[UIFont systemFontOfSize:14];
    
    
    self.reviewLabel.text=[NSString stringWithFormat:@"%ld回\%ld阅",model.answerCount,model.viewCount];
    self.reviewLabel.numberOfLines=0;
    self.reviewLabel.font=[UIFont systemFontOfSize:14];
    self.reviewLabel.frame=model.sixFrame;
    
    
    
}
@end
