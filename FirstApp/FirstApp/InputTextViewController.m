//
//  InputTextViewController.m
//  FirstApp
//
//  Created by Ipageon_김태형 on 2021/11/01.
//

#import "InputTextViewController.h"

@interface InputTextViewController ()

@end

@implementation InputTextViewController

- (void)viewDidLoad {
    [super viewDidLoad];
  
}



- (IBAction)onClickbtn:(id)sender {
    if(![_textField.text isEqualToString: @""]){
        [[NSNotificationCenter defaultCenter] postNotificationName:@"iOS" object:nil userInfo:@{
            @"txt" : _textField.text
        }];
    
    }
}

/*[NSNotificationCenter.defaultCenter postNotificationName:MSGID object:nil userInfo:@{
    @"MSGID" : MSGID
}];*/
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
