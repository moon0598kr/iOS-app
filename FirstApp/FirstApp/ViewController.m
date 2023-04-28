//
//  ViewController.m
//  FirstApp
//
//  Created by Ipageon_김태형 on 2021/10/29.
//

#import "ViewController.h"
#import "InputTextViewController.h"
#import "C.h"
#import "D.h"

@interface ViewController ()

@property (weak, nonatomic) IBOutlet UISlider *ad;

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
//    [_ad setMinimumValueImage:[UIImage  ]]
//    [_ad setMinimumTrackImage:@"스크린샷 2022-07-06 오전 9.47.01" forState:UIControlStateNormal];
    [_ad setMaximumTrackImage:[[NSBundle mainBundle]pathForResource:@"스크린샷 2022-07-06 오전 9.47.01" ofType:@"png"] forState:UIControlStateNormal];
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

- (IBAction)textFIeld:(id)sender {
}
- (IBAction)textField2:(id)sender {
   
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"gotoB"]) {
        InputTextViewController *conteroller = (InputTextViewController*)segue.destinationViewController;
        conteroller.name = @"asdfsdf";
    }
    else if ([segue.identifier isEqualToString:@"gotoC"]) {
        C *controller = (C*)segue.destinationViewController;
        controller.nickname = @"별명";
    }
    else if ([segue.identifier isEqualToString:@"gotoD"]) {
        D *controller = (D*)segue.destinationViewController;
        controller.hyeong = @"형";
    }
}

@end

