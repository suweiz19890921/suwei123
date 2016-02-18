//
//  NewsModel.m
//  DAY-07项目
//
//  Created by qianfeng on 16/1/12.
//  Copyright (c) 2016年 苏威. All rights reserved.
//

#import "NewsModel.h"
#import "GDataXMLNode.h"
@implementation NewsModel
+(id)newModelWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}

-(id)initWithDict:(NSDictionary *)dict{
    if (self=[super init]) {
        [self setValuesForKeysWithDictionary:dict];
       //1.
        CGFloat fx=10;
        CGFloat fy=8;
        CGFloat mainW=[UIScreen mainScreen].bounds.size.width;

        NSDictionary * tepDict1=@{NSFontAttributeName:[UIFont systemFontOfSize:16]};
        CGSize size=[self.title boundingRectWithSize:CGSizeMake(350, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:tepDict1 context:nil].size;
        CGFloat fw=size.width;
        CGFloat fh=20;
        self.firstFrame=CGRectMake(fx, fy, fw, fh);
        
        //2.
        CGFloat sx=fx;
        CGFloat sy=CGRectGetMaxY(self.firstFrame)+5;
        NSDictionary * tepDict2=@{NSFontAttributeName:[UIFont systemFontOfSize:14]};
        size=[self.body boundingRectWithSize:CGSizeMake(350, CGFLOAT_MAX) options:NSStringDrawingUsesLineFragmentOrigin attributes:tepDict2 context:nil].size;
        CGFloat sw=size.width;
        CGFloat sh=size.height;
        self.secondFrame=CGRectMake(sx, sy, sw, sh);
        
        
        //3.
        CGFloat tx=10;
        CGFloat ty=CGRectGetMaxY(self.secondFrame)+5;
        size=[self.author boundingRectWithSize:CGSizeMake(200, 20) options:NSStringDrawingUsesLineFragmentOrigin attributes:tepDict2 context:nil].size;
        CGFloat tw=size.width;
        CGFloat th=size.height;
        self.thirdFrame=CGRectMake(tx, ty, tw, th);
        
        
        NSString * dateStr=[GPUntil createDateStr:_pubDate];
        
        
        
        CGFloat fourx=CGRectGetMaxX(self.thirdFrame)+15;
        CGFloat foury=ty;
        size=[dateStr boundingRectWithSize:CGSizeMake(200, 20) options:NSStringDrawingUsesLineFragmentOrigin attributes:tepDict2 context:nil].size;
        CGFloat fourw=size.width;
        CGFloat fourh=size.height;
        self.fourthFrame=CGRectMake(fourx, foury, fourw, fourh);
        
        
        //5.
        CGFloat fivex=mainW/2+50;
        CGFloat fivey=ty;
        size=[self.commentCount boundingRectWithSize:CGSizeMake(200, 20) options:NSStringDrawingUsesLineFragmentOrigin attributes:tepDict2 context:nil].size;
        CGFloat fivew=size.width;
        CGFloat fiveh=size.height;
        self.fiveFrame=CGRectMake(fivex, fivey, fivew, fiveh);
        
       self.maxH= MAX(CGRectGetMaxY(self.thirdFrame), CGRectGetMaxY(self.fiveFrame));
        
        
    }
    return self;
}


-(void)setValue:(id)value forUndefinedKey:(NSString *)key{
    if ([key isEqualToString:@"id"]) {
        self.ID=value;
    }
}
-(NSString *)description{
    return [NSString stringWithFormat:@"%@",_pubDate];
}
@end
