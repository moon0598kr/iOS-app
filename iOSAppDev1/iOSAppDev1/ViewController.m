//
//  ViewController.m
//  iOSAppDev1
//
//  Created by Ipageon_김태형 on 2021/11/30.
//

#import "ViewController.h"
@class AppDelegate;
@interface ViewController (){
    
    int world123;
 //   NSString *hello;
    
}

@end

@implementation ViewController
@synthesize world;
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.

    world = 13132132;
    NSLog(@"%d",world);
    
    NSString *sample2 = [NSString stringWithFormat:@"nicehello"];
    
    NSLog(@"%@", sample2);

}
-(void)SampleMethodd;{
    hello = @"abcd";
    printf("hello");
    
//    world123 =[]
}
-(void)SampleMethod : (int) nice; {
    nice = 132;
}
@end


