//
//  ViewController.h
//  FirstApp
//
//  Created by Ipageon_김태형 on 2021/10/29.
//

#import <UIKit/UIKit.h>
#import <WebKit/WebKit.h>

@interface ViewController : UIViewController
- (IBAction)btnpressed:(UIButton *)sender;
- (IBAction)buttonTouch:(id)sender;


@property (weak, nonatomic) IBOutlet WKWebView *webView;


- (IBAction)textField2:(id)sender;
@property (weak, nonatomic) IBOutlet UITextView *textView2;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UITextView *textView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;
@property (weak, nonatomic) IBOutlet UISwitch *switchButton;
- (IBAction)switchTouch:(id)sender;

- (IBAction)inputTextToTextView:(id)sender;

@end

