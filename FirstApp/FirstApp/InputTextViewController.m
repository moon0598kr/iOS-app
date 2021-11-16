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
    
    NSLog(@"who am i : %@", self.name);
    
    [NSNotificationCenter.defaultCenter addObserver:self
                                           selector:@selector(keyboardWillHide:)
                                               name:UIKeyboardDidHideNotification
                                             object:self.view.window];
    
    [NSNotificationCenter.defaultCenter addObserver:self
                                           selector:@selector(keyboardWillShow:)
                                               name:UIKeyboardDidShowNotification
                                             object:self.view.window];
  
}
- (void)keyboardWillHide:(NSNotification *)notif {
 //   self.view.window.y = 0;
}

- (void)keyboardWillShow:(NSNotification *)notif {
 //   self.view.frame.origin.y = -150;
}
- (IBAction)TextField:(id)sender {
    
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
