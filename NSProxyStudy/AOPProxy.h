//
//  AOPProxy.h
//  NSProxyStudy
//
//  Created by 王鹭飞 on 2018/12/28.
//  Copyright © 2018 王鹭飞. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^proxyBlock)(id target,SEL selector);

NS_ASSUME_NONNULL_BEGIN

@interface AOPProxy : NSProxy
+(instancetype)proxyWithTarget:(id)target;
-(void)inspectSelector:(SEL)selector preSelTask:(proxyBlock)preTask endSelTask:(proxyBlock)endTask;
@end

NS_ASSUME_NONNULL_END
