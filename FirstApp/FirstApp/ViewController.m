//
//  ViewController.m
//  FirstApp
//
//  Created by Ipageon_김태형 on 2021/10/29.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [NSNotificationCenter.defaultCenter addObserver:self
                                           selector:@selector(iOS:)
                                               name:@"iOS"
                                             object:nil];
    
    // Do any additional setup after loading the view.
    [_imageView setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"Tree 0" ofType:@"pdf"]]];
    
}

- (void)iOS:(NSNotification *)notif {
    NSString *object = [[notif userInfo] objectForKey:@"txt"];
    [_textView2 setText: object];
}

- (IBAction)buttonTouch:(id)sender {
    NSString *str=[_textField text];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:str]];
    [_webView loadRequest:request];
}

- (IBAction)btnpressed:(UIButton *)sender {
}
- (IBAction)inputTextToTextView:(id)sender {
    [_textView setText:[_textField text]];
}

- (IBAction)switchTouch:(id)sender {
    if([_switchButton isOn]){
        [_imageView setAlpha:1.0f];
    }
    else{
        [_imageView setAlpha:0.0f];
    }
}
- (IBAction)textFIeld:(id)sender {
}
- (IBAction)textField2:(id)sender {
   
}
@end
