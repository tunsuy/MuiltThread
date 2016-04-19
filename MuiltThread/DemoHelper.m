//
//  DemoHelper.m
//  MuiltThread
//
//  Created by tunsuy on 25/3/16.
//  Copyright © 2016年 tunsuy. All rights reserved.
//

#import "DemoHelper.h"

@implementation DemoHelper

- (void)globalQueueSync {
    [self setUp];
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_sync(queue, ^{
        [self operate];
    });
    [self tearDown];
}

- (void)globalQueueAsync {
    [self setUp];
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_async(queue, ^{
        [self operate];
    });
    [self tearDown];
}

- (void)mainQueueSync {
    [self setUp];
    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_sync(queue, ^{
        [self operate];
    });
    [self tearDown];
}

- (void)mainQueueAsync {
    [self setUp];
    dispatch_queue_t queue = dispatch_get_main_queue();
    dispatch_async(queue, ^{
        [self operate];
    });
    [self tearDown];
}

- (void)createSerialQueueSync {
    [self setUp];
    dispatch_queue_t queue = dispatch_queue_create("ts.com", DISPATCH_QUEUE_SERIAL);
    dispatch_sync(queue, ^{
        [self operate];
    });
    [self tearDown];
}

- (void)createSerialQueueAsync {
    [self setUp];
    dispatch_queue_t queue = dispatch_queue_create("ts.com", DISPATCH_QUEUE_SERIAL);
    dispatch_async(queue, ^{
        [self operate];
    });
    [self tearDown];
}

- (void)createConcurrentQueueSync {
    [self setUp];
    dispatch_queue_t queue = dispatch_queue_create("ts.com", DISPATCH_QUEUE_CONCURRENT);
    dispatch_sync(queue, ^{
        [self operate];
    });
    [self tearDown];
}

- (void)createConcurrentQueueAsync {
    [self setUp];
    dispatch_queue_t queue = dispatch_queue_create("ts.com", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        [self operate];
    });
    [self tearDown];
}

- (void)groupQueueAsync {
    dispatch_group_t group = dispatch_group_create();
    
    [self setUp];
    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        [self operate];
    });
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        [self tearDown];
    });
}

- (void)barrierSync {
    [self setUp];
//    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    dispatch_queue_t queue = dispatch_queue_create("ts.com", DISPATCH_QUEUE_CONCURRENT);
    dispatch_async(queue, ^{
        [self operate];
    });
    dispatch_barrier_sync(queue, ^{
        [self tearDown];
    });
    dispatch_sync(queue, ^{
        [self operate];
    });
}

- (void)setUp {
    NSLog(@"before - current thread is : %@", [NSThread currentThread]);
}

- (void)operate {
    for (int i=0; i<5; i++) {
        NSLog(@"current thread is : %@, i = %d", [NSThread currentThread], i);
    }
}

- (void)tearDown {
    NSLog(@"after - current thread is : %@", [NSThread currentThread]);
}

@end
