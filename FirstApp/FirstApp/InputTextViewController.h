//
//  InputTextViewController.h
//  FirstApp
//
//  Created by Ipageon_김태형 on 2021/11/01.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface InputTextViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (nonatomic, retain) NSString *name;

@end

NS_ASSUME_NONNULL_END
