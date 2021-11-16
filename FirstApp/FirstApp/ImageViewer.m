//
//  ImageViewer.m
//  FirstApp
//
//  Created by Ipageon_김태형 on 2021/11/09.
//

#import "ImageViewer.h"

@interface ImageViewer ()

@end

@implementation ImageViewer

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSLog(@"%@", _url);
    
    NSURL *url1 = [NSURL URLWithString:_url];
    NSData *data = [NSData dataWithContentsOfURL:url1];
    UIImage *img = [[UIImage alloc] initWithData:data];
    [_selectImage setImage:img];
    
  //r  [[self navigationController] setNavigationBarHidden:YES animated:YES];
    
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
