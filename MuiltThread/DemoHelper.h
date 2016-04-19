//
//  DemoHelper.h
//  MuiltThread
//
//  Created by tunsuy on 25/3/16.
//  Copyright © 2016年 tunsuy. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DemoHelper : NSObject

- (void)globalQueueSync;
- (void)globalQueueAsync;
- (void)mainQueueSync;
- (void)mainQueueAsync;
- (void)createSerialQueueSync;
- (void)createSerialQueueAsync;
- (void)createConcurrentQueueSync;
- (void)createConcurrentQueueAsync;
- (void)groupQueueAsync;
- (void)barrierSync;

@end
