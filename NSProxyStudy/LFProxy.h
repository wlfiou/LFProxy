//
//  LFProxy.h
//  NSProxyStudy
//
//  Created by 王鹭飞 on 2018/11/25.
//  Copyright © 2018年 王鹭飞. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface LFProxy : NSProxy
+(instancetype)ProxyWithObj:(NSObject *)obj;
@end
