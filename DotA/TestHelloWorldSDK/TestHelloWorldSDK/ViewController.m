//
//  ViewController.m
//  TestHelloWorldSDK
//
//  Created by 蔡志文 on 1/12/23.
//

#import "ViewController.h"
#import "HelloWorld.h"
#import "Logger.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [HelloWorld helloworld];
    [Logger print];
}


@end
