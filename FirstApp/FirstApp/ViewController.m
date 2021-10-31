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
    // Do any additional setup after loading the view.
    [_imageView setImage:[UIImage imageWithContentsOfFile:[[NSBundle mainBundle]pathForResource:@"Tree 0" ofType:@"pdf"]]];
}


- (IBAction)buttonTouch:(id)sender {
    NSString *str=[_textField text];
    NSURLRequest *request = [NSURLRequest requestWithURL:[NSURL URLWithString:str]];
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
@end
