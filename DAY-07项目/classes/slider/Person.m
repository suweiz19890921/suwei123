//
//  Person.m
//  DAY-07项目
//
//  Created by qianfeng on 16/1/14.
//  Copyright (c) 2016年 苏威. All rights reserved.
//

#import "Person.h"

@implementation Person
+(id)personModelWithElemeng:(ONOXMLElement *)element{
    Person * person=[[Person alloc]init];
    person.uid=[[[element firstChildWithTag:@"uid"]numberValue] integerValue];
    person.location=[[element firstChildWithTag:@"location"]stringValue];
    person.name=[[element firstChildWithTag:@"name"]stringValue];
    person.followers=[[[element firstChildWithTag:@"followers"]numberValue] integerValue] ;
    person.fans=[[[element firstChildWithTag:@"fans"]numberValue] integerValue] ;
    person.score=[[[element firstChildWithTag:@"score"]numberValue] integerValue];
    person.portrait=[[element firstChildWithTag:@"portrait"]stringValue];
    person.favoritecount=[[[element firstChildWithTag:@"favoritecount"]numberValue] integerValue];
    person.gender=[[[element firstChildWithTag:@"gender"]numberValue] integerValue];
    
    
    
    
    
    
    
    
    return person;
}

@end
