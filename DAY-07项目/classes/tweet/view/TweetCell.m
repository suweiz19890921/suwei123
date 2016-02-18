//
//  TweetCell.m
//  DAY-07项目
//
//  Created by qianfeng on 16/1/13.
//  Copyright (c) 2016年 苏威. All rights reserved.
//

#import "TweetCell.h"
@interface TweetCell()
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *bodyLabel;
@property (weak, nonatomic) IBOutlet UIImageView *bigImageView;
@property (weak, nonatomic) IBOutlet UILabel *likeLabel;

@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;

@end
@implementation TweetCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

+(id)tweetCellWithTableView:(UITableView *)tableView{
    NSString * className=NSStringFromClass([self class]);
    UINib * nib=[UINib nibWithNibName:className bundle:nil];
    [tableView registerNib:nib forCellReuseIdentifier:className];
    return [tableView dequeueReusableCellWithIdentifier:className];
}
-(void)setModel:(TweetModel *)model{
    _model=model;
    [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(change:) name:@"needDay" object:nil];
    [self.headImageView sd_setImageWithURL:[NSURL URLWithString:model.portrait] placeholderImage:[UIImage imageNamed:@"123.jpg"]];
    self.headImageView.frame=model.oneFrame;
    
    //self.nameLabel.text=model.author;
    self.nameLabel.font=[UIFont systemFontOfSize:14];
    self.nameLabel.numberOfLines=0;
    self.nameLabel.frame=model.twoFrame;
    NSMutableAttributedString * aStr=[[NSMutableAttributedString alloc]initWithString:model.author];
    NSDictionary * dict1=@{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName:[UIColor greenColor]};
    [aStr setAttributes:dict1 range:NSMakeRange(0, model.author.length)];
    self.nameLabel.attributedText=aStr;
    
    
    self.bodyLabel.text=model.body;
    self.bodyLabel.numberOfLines=0;
    self.bodyLabel.font=[UIFont systemFontOfSize:15];
    self.bodyLabel.frame=model.threeFrame;
    
    [self.bigImageView sd_setImageWithURL:[NSURL URLWithString:model.imgBig]];
    self.bigImageView.frame=model.fourFrame;
    
  
        self.likeLabel.font=[UIFont systemFontOfSize:14];
    self.likeLabel.frame=model.fiveFrame;
    self.likeLabel.numberOfLines=0;
    self.likeLabel.text=model.name;
//    if (model.name) {
//        NSMutableAttributedString * aStr2=[[NSMutableAttributedString alloc]initWithString:model.name];
//        NSDictionary * dict2=@{NSFontAttributeName:[UIFont systemFontOfSize:14],NSForegroundColorAttributeName:[UIColor redColor]};
//        [aStr setAttributes:dict2 range:NSMakeRange(0, model.name.length)];
//        self.likeLabel.attributedText=aStr2;
//    }

    
    
    
    self.timeLabel.text=model.pubDate;
    self.timeLabel.frame=model.sixFrame;
    self.timeLabel.font=[UIFont systemFontOfSize:14];
    self.timeLabel.numberOfLines=0;
    
    NSString *clientStr = @"";
    if (model.appclient == 2) {
        clientStr = @"iPhone";
    }else if (model.appclient == 3){
        clientStr = @"Android";
    }else clientStr=@"其他NB客户端";
    
        self.phoneLabel.text=clientStr;
    self.phoneLabel.frame=model.sevenFrame;
    self.phoneLabel.font=[UIFont systemFontOfSize:14];
    self.phoneLabel.numberOfLines=0;
    
    
    
    
    
}

-(void)change:(NSNotification *)noti{
    NSLog(@"***************************");
    BOOL isNight=[noti.userInfo[@"isNight"]boolValue];
    if (isNight) {
        self.contentView.backgroundColor=[UIColor blackColor];
    }else {
        self.contentView.backgroundColor=[UIColor whiteColor];
    }
}
@end
