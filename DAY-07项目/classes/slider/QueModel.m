//
//  QueModel.m
//  DAY-07项目
//
//  Created by qianfeng on 16/1/14.
//  Copyright (c) 2016年 苏威. All rights reserved.
//

#import "QueModel.h"

@implementation QueModel
+(id)queModelWithElemeng:(ONOXMLElement *)element{
//    @property (copy ,nonatomic)NSString * portrait;
//    @property (copy ,nonatomic)NSString * qid;
//    @property (copy ,nonatomic)NSString * author;
//    @property (copy ,nonatomic)NSString * authorid;
//    @property (copy ,nonatomic)NSString * title;
//    @property (copy ,nonatomic)NSString * body;
//    @property (copy ,nonatomic)NSString * asnwerCount;
//    @property (copy ,nonatomic)NSString * viewCount;
//    @property (copy ,nonatomic)NSString * pubDate;
//    @property (copy ,nonatomic)NSString * name;
//    @property (copy ,nonatomic)NSString * time;

    QueModel * model=[[QueModel alloc]init];
    model.qid=[[element firstChildWithTag:@"id"]stringValue];
    model.portrait=[[element firstChildWithTag:@"portrait"]stringValue];
    model.author=[[element firstChildWithTag:@"author"]stringValue];

    model.authorid=[[element firstChildWithTag:@"authorid"]stringValue];
    model.title=[[element firstChildWithTag:@"title"]stringValue];
    model.body=[[element firstChildWithTag:@"body"]stringValue];
    model.answerCount=[[[element firstChildWithTag:@"answerCount"]numberValue]integerValue];
    
    model.viewCount=[[[element firstChildWithTag:@"viewCount"]numberValue]integerValue];
    model.pubDate=[[element firstChildWithTag:@"pubDate"]stringValue];
    ONOXMLElement * ele=[element firstChildWithTag:@"answer"];
    
    
    
    model.name=[[ele firstChildWithTag:@"name"]stringValue];
    model.time=[[ele firstChildWithTag:@"time"]stringValue];

    
    
    
    CGFloat oneX=8;
    CGFloat oneY=8;
    CGFloat oneW=50;
    CGFloat oneH=50;
    model.oneFrame=CGRectMake(oneX, oneY, oneW, oneH);
    //2.
    CGFloat twoX=CGRectGetMaxX(model.oneFrame)+5;
    CGFloat twoY=oneY;
    CGSize size=CGSizeMake(340, CGFLOAT_MAX);
    NSDictionary * dict1=@{NSFontAttributeName:[UIFont systemFontOfSize:16]};
    size=[model.title boundingRectWithSize:size options:NSStringDrawingUsesLineFragmentOrigin attributes:dict1 context:nil].size;
    CGFloat twoW=size.width;
    CGFloat twoH=size.height;
    model.twoFrame=CGRectMake(twoX, twoY, twoW, twoH);
    //3.
    CGFloat threeX=CGRectGetMaxX(model.oneFrame)+4;
    CGFloat threeY=CGRectGetMaxY(model.twoFrame)+4;
    
    NSDictionary * dict2=@{NSFontAttributeName:[UIFont systemFontOfSize:14]};
    size=[model.body boundingRectWithSize:CGSizeMake(300, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict2 context:nil].size;
    CGFloat threeW=size.width;
    CGFloat threeH=size.height;
    model.threeFrame=CGRectMake(threeX, threeY, threeW, threeH);
   //4.
    CGFloat fourX=threeX;
    CGFloat fourY=CGRectGetMaxY(model.threeFrame)+5;
    size=[model.name boundingRectWithSize:CGSizeMake(200, 20) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict2 context:nil].size;
    CGFloat fourW=size.width;
    CGFloat fourH=20;
     model.fourFrame=CGRectMake(fourX, fourY, fourW, fourH);
    
    
    NSString * dateStr=[GPUntil createDateStr:model.pubDate];
    
    CGFloat fiveX=CGRectGetMaxX(model.fourFrame)+3;
    CGFloat fiveY=fourY;
    size =[dateStr boundingRectWithSize:CGSizeMake(200, 20) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict2 context:nil].size;
    CGFloat fiveW=size.width;
    CGFloat fiveH=size.height;
    model.fiveFrame=CGRectMake(fiveX, fiveY, fiveW, fiveH);
    
    
    //6.
    NSString * str1=[NSString stringWithFormat:@"%ld回\%ld阅",model.answerCount,model.viewCount];
    CGFloat sixX=CGRectGetMaxX(model.fiveFrame)+3;
    CGFloat sixY=fiveY;
    size=[str1 boundingRectWithSize:CGSizeMake(200, 20) options:NSStringDrawingUsesLineFragmentOrigin attributes:dict2 context:nil].size;
    CGFloat sixW=size.width;
    CGFloat sixH=20;
    model.sixFrame=CGRectMake(sixX, sixY, sixW, sixH);
    
    
    
    
    
    
    model.maxH=MAX(CGRectGetMaxY(model.sixFrame), CGRectGetMaxY(model.fiveFrame));

    
    
    
    
    

    
    
    return model;
}
@end
