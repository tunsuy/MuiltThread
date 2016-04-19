//
//  main.m
//  MuiltThread
//
//  Created by tunsuy on 25/3/16.
//  Copyright © 2016年 tunsuy. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DemoHelper.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        
        DemoHelper *demoHelper = [[DemoHelper alloc] init];
//        [demoHelper globalQueueSync];
//        一：同步执行，阻塞当前线程（main主线程）。将一个任务放到系统的一个全局队列（并行队列）中，由于是同步执行，即使是并行队列也不会开启新的线程，但是由于是在一个并行队列中，所以系统会直接从该队列中取出该任务放到主线程中执行，完成之后再继续执行主队列中的任务。
        
//        [demoHelper globalQueueAsync];
//        二：异步执行，单独启用一个线程来执行这个并行队列中的任务，跟主线程中的任务同步执行
        
//        [demoHelper mainQueueSync];
//        三：同步执行，阻塞当前线程（main主线程）。同时将一个任务放到该主队列中，由于是同步执行，因为是同步执行，且都是在主队列中，遵循FIFO原则，会造成死锁
        
//        [demoHelper mainQueueAsync];
//        四：异步执行，但是由于是主队列，所有不会开启新线程，由于是异步，所以不会死锁
        
//        [demoHelper createSerialQueueSync];
//        五：同一
        
//        [demoHelper createSerialQueueAsync];
//        六：同二，只是这个单独开启的线程中是串行执行的
        
//        [demoHelper groupQueueAsync];
        
        [demoHelper barrierSync];
//        只对自己创建的并行队列 才会阻塞该队列（是阻塞队列，而不是阻塞线程），也就是需要等barrier之前放进该队列的任务执行完成之后，才会开始执行barrier中定义的任务，barrier中定义的任务执行完之后才会继续执行该队列之后的任务。
        
//        利用同步串行队列实现数据同步
//        利用barrier实现数据同步
        
    }
    
    return 0;
}


