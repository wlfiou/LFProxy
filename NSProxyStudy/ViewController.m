//
//  ViewController.m
//  NSProxyStudy
//
//  Created by 王鹭飞 on 2018/11/25.
//  Copyright © 2018年 王鹭飞. All rights reserved.
//

#import "ViewController.h"
#import "Dog.h"
#import "LFProxy.h"
#import "classA.h"
#import "多继承/classB.h"
#import "多继承/ClassProxy.h"
#import "AOPProxy.h"
@interface ViewController ()

@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
//    [self analysis];
//    [self classInheritance];
    [self inspect];
    // Do any additional setup after loading the view, typically from a nib.
}
//AOP
-(void)inspect{
    NSMutableArray *targtArray = [AOPProxy proxyWithTarget:[NSMutableArray arrayWithCapacity:1]];
    [(AOPProxy *)targtArray inspectSelector:@selector(addObject:) preSelTask:^(id target, SEL selector) {
        [target addObject:@"-------"];
        NSLog(@"%@我加进来之前",target);
    } endSelTask:^(id target, SEL selector) {
        [target addObject:@"-------"];
        NSLog(@"%@我加进来之后",target);
    }];
    [targtArray addObject:@"我是一个元素"];
}
//多继承
-(void)classInheritance{
    classA *A = [[classA alloc]init];
    classB *B = [[classB alloc]init];
    ClassProxy *proxy = [ClassProxy alloc];
    [proxy handleTargets:@[A,B]];
    [proxy performSelector:@selector(infoA)];
    [proxy performSelector:@selector(infoB)];
    
    
}
//分析
-(void)analysis{
    Dog *dog = [LFProxy ProxyWithObj:[[Dog alloc] init]];
    [dog barking:4];
}
- (IBAction)ViewController2UnwindSegue:(UIStoryboardSegue *)unwindSegue {
    
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
