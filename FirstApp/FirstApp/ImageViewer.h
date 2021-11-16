//
//  ImageViewer.h
//  FirstApp
//
//  Created by Ipageon_김태형 on 2021/11/09.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface ImageViewer : UIViewController

@property (nonatomic, retain) NSString *url;
@property (weak, nonatomic) IBOutlet UIImageView *selectImage;

@end

NS_ASSUME_NONNULL_END
