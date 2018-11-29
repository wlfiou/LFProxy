//
//  Dog.m
//  NSProxyStudy
//
//  Created by 王鹭飞 on 2018/11/25.
//  Copyright © 2018年 王鹭飞. All rights reserved.
//

#import "Dog.h"

@implementation Dog
-(NSString *)barking:(NSInteger)mouths
{
    return mouths>3?@"wang wang":@"eng eng";
}
@end
