//
//  LoadingPage.m
//  FirstApp
//
//  Created by Ipageon_김태형 on 2021/11/08.
//

#import "LoadingPage.h"

@interface LoadingPage ()

@end

@implementation LoadingPage

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self performSelector:@selector(gjgchghjg:) withObject:@"12341234" afterDelay:3];
}

- (void)gjgchghjg:(NSString*) aa{
    [self performSegueWithIdentifier:@"gotoname" sender:self];
    NSLog(@"%@", aa);
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
