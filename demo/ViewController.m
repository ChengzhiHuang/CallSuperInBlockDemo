//
//  ViewController.m
//  demo
//
//  Created by ByteDance on 2022/11/29.
//

#import "ViewController.h"

#import <objc/message.h>

#import "extobjc.h"


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

- (instancetype)init {
    if (self = [super init]) {
        [self testCapture];
    }
    return self;
}

- (void)testCapture {
    self.captureSelf = ^() {
        super.capture = YES;
    };
    
    self.captureSelf(); // only for into block
}

@end


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSObject *childObj = [[TestChildObj alloc] init];
}
@end



