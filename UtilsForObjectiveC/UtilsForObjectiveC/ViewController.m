//
//  ViewController.m
//  UtilsForObjectiveC
//
//  Created by Ipageon_김태형 on 2021/12/27.
//

#import "ViewController.h"
@interface ViewController ()

@end

@implementation ViewController


//이메일 정규식
- (void)checkEmail {
    //이메일 정규식과 textfield에 입력된 userID를 정규식에 대입한 NSRange를 선언
    NSString *validEmailType = @"([0-9a-zA-Z_-]+)@([0-9a-zA-Z_-]+)(\\.[0-9a-zA-Z_-]+){1,2}";
    NSRange checkRange = [@"userId" rangeOfString:validEmailType options:NSRegularExpressionSearch];

    //Range의 메일 형식이 유효한지 체크 한 후 유효하지 않은 형식일 경우 Toast 발생
    if (NSNotFound == checkRange.location){
        //토스트 발생 메소드
        return;
    }
}


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


@end
