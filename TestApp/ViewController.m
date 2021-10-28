//
//  ViewController.m
//  TestApp
//
//  Created by ios-dev on 2021/10/27.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the all views.
//    모든 뷰가 업로드(모든 이미지가 그려짐)후에 진입하는 함수
    NSLog(@"모든 뷰가 업로드(모든 이미지가 그려짐)후에 진입하는 함수");
}


- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//   앞으로 보여질거야
    NSLog(@"앞으로 보여질거야");
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
//    앞으로 사라질거야
    NSLog(@"앞으로 사라질거야");
}


@end
