//
//  SecondViewController.m
//  NSProxyStudy
//
//  Created by 王鹭飞 on 2018/12/27.
//  Copyright © 2018 王鹭飞. All rights reserved.
//

#import "SecondViewController.h"
#import "WeakProxy.h"
@interface SecondViewController ()
@property(nonatomic,strong)NSTimer *timer;
@end

@implementation SecondViewController

-(void)viewDidLoad{
    [super viewDidLoad];
    self.timer = [NSTimer timerWithTimeInterval:1
                                         target:[WeakProxy proxyWithTarget:self]
                                       selector:@selector(invoked:)
                                       userInfo:nil
                                        repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
}
- (void)invoked:(NSTimer *)timer{
    NSLog(@"1");
}
- (void)dealloc{
    [_timer invalidate];
    _timer = nil;
    NSLog(@"Dealloc");
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
