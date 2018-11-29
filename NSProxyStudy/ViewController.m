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
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    Dog *dog = [LFProxy ProxyWithObj:[Dog alloc]];
    [dog barking:4];
    // Do any additional setup after loading the view, typically from a nib.
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
