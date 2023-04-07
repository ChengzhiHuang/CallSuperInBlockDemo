//
//  Child.m
//  demo
//
//  Created by ByteDance on 2023/2/14.
//

#import <Foundation/Foundation.h>

typedef int (^CommonBlock)(void);

@interface TestObj : NSObject

@property (nonatomic, copy) void(^captureSelf)(void);

@property (nonatomic, assign) BOOL capture;

@end

@implementation TestObj

- (instancetype)init {
    if (self = [super init]) {
//        self.captureSelf = ^() {
//            _capture = YES;
//        };
    }
    return self;
}

@end

@interface TestChildObj : TestObj

@end

@implementation TestChildObj


- (CommonBlock)simpleBlockOnStack {
    int a = 1, b = 2, c = 3, d = 4, e = 5;
    int (^theBlock)(void) = ^int {
        return a + b + c + d + e;
    };
    return theBlock;
}

- (instancetype)init {
    if (self = [super init]) {
        [self testSuperCapture];
        [self testSelfCapture];
        [self simpleBlockOnStack];
    }
    return self;
}

- (void)testSuperCapture {
    self.captureSelf = ^() {
        super.capture = YES;
    };

    self.captureSelf();
}

- (void)testSelfCapture {
    void (^captureSelfBlock)(void) = ^() {
        self.capture = YES;
    };

    captureSelfBlock();
}


@end
