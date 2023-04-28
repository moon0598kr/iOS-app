//
//  ViewController.m
//  TableTest
//
//  Created by Ipageon_김태형 on 2022/10/07.
//

#import "ViewController.h"
#import <NotificationCenter/NotificationCenter.h>
#import "SecondViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UITextField *tFiled;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.tFiled.delegate = self;
}

- (void)textFieldDidEndEditing:(UITextField *)textField{


    
}

- (IBAction)onClickButton:(id)sender {
//    UIViewController *uv = [[UIViewController alloc] initWithNibName:@"SecondViewController" bundle:NSBundle.mainBundle];
    
//    SecondViewController* uv =[self.storyboard instantiateViewControllerWithIdentifier:@"SecondViewController"];
//    svc.anotherString = self.originalString;
//    [self presentViewController:svc animated:YES completion:nil];

    
//    [self presentViewController:uv animated:YES completion:nil];
    
    
}
- (IBAction)qqqq:(id)sender {
//    SecondViewController* uv =[self.storyboard instantiateViewControllerWithIdentifier:@"SecondViewController"];
//    svc.anotherString = self.originalString;
//    [self presentViewController:svc animated:YES completion:nil];
    
        NSString *name = self.tFiled.text;

        [NSNotificationCenter.defaultCenter postNotificationName:@"name"
                                                          object:nil
                                                        userInfo:@{
            @"name" : name
        }];
    
//    [self presentViewController:uv animated:YES completion:nil];
    
}

@end
