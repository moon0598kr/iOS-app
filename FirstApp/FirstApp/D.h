//
//  D.h
//  FirstApp
//
//  Created by Ipageon_김태형 on 2021/11/08.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface D : UIViewController <UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property (strong, nonatomic) IBOutlet UIImageView *imgaeView;
@property (nonatomic, retain) NSString *hyeong;
- (IBAction)takePhoto:(UIButton *)sender
    
;
- (IBAction)selecPhoto:(UIButton *)sender;

@end

NS_ASSUME_NONNULL_END
