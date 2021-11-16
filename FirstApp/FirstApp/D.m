//
//  D.m
//  FirstApp
//
//  Created by Ipageon_김태형 on 2021/11/08.
//

#import "D.h"
#import <AVFoundation/AVFoundation.h>



@interface D ()

@end

@implementation D

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    if (![UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        
            UIAlertView *myAlertView = [[UIAlertView alloc] initWithTitle:@"Error"
                                                            message:@"Device has no camera"
                                                            delegate:nil
                                                            cancelButtonTitle:@"OK"
                                                            otherButtonTitles: nil];
            
            [myAlertView show];
            
        }
   
    
    AVAuthorizationStatus status = [AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo];
    
    switch (status) {
        case AVAuthorizationStatusNotDetermined: {
            NSLog(@"권한 요청 전");
            
            [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
                if (granted) {
                    NSLog(@"권한 허용");
                }
                else {
                    NSLog(@"권한 거부");
                }
            }];
        };
            break;
        
        case AVAuthorizationStatusAuthorized :
            NSLog(@"권한 허용 상태");
            break;
            
        case AVAuthorizationStatusDenied :
            NSLog(@"권한 거부 상태");
            break;
            
        case AVAuthorizationStatusRestricted :
            NSLog(@"액세스 불가 상태");
            break;
            
            
    }
    
    NSLog(@"김태%@", self.hyeong);
    // Do any additional setup after loading the view.
    
  /*  {
        UIImagePickerController* picker = [[UIImagePickerController alloc] init];

        picker.delegate = self;

        picker.allowsEditing = YES;

        picker.sourceType = UIImagePickerControllerSourceTypeCamera;

        [self presentViewController:picker animated:YES completion:nil];//간단한 카메라
    }*/
    
}
/*- (void) imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info

{

    NSString *mediaType = [info objectForKey: UIImagePickerControllerMediaType];

    UIImage *originalImage, *editedImage;

    

    if (CFStringCompare ((CFStringRef) mediaType, kUTTypeImage, 0) == kCFCompareEqualTo)

    {

        editedImage = (UIImage *) [info objectForKey:UIImagePickerControllerEditedImage];

        originalImage = (UIImage *) [info objectForKey:UIImagePickerControllerOriginalImage];

        

        if (editedImage) { image = editedImage; }

        else { image = originalImage; }

        

    }

    

    [[picker parentViewController] dismissViewControllerAnimated:YES completion:nil];

    [picker dismissViewControllerAnimated:YES completion:nil];

    [self performSelector:@selector(cameraActionWithImage:) withObject:self.pickImage afterDelay:0.5f];

    

    


}*/




/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)selecPhoto:(UIButton *)sender {
    
    
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
        [self presentViewController:picker animated:YES completion:NULL];
}

- (IBAction)takePhoto:(UIButton *)sender {
    UIImagePickerController *picker = [[UIImagePickerController alloc] init];
        picker.delegate = self;
        picker.allowsEditing = YES;
        picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        
        [self presentViewController:picker animated:YES completion:NULL];
}

- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info {
    
    UIImage *chosenImage = info[UIImagePickerControllerEditedImage];
    self.imgaeView.image = chosenImage;
    
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker {
 
    [picker dismissViewControllerAnimated:YES completion:NULL];
    
}
@end
