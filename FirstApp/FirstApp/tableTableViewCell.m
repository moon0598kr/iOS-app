//
//  tableTableViewCell.m
//  FirstApp
//
//  Created by Ipageon_김태형 on 2021/11/03.
//

#import "tableTableViewCell.h"

@implementation tableTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];
    

    // Configure the view for the selected state
}
#pragma call icon과 video icon 눌렸을 때 URL

- (IBAction)callIconPressed:(UIButton *)sender {
    NSURL *callAppURL = [NSURL URLWithString:@"tel://010-8837-6487"];
    [[UIApplication sharedApplication] openURL:callAppURL];
    
}
- (IBAction)videoIconPressed:(UIButton *)sender {
    NSURL *youtubeURL = [NSURL URLWithString:@"https://www.youtube.com"];
    [[UIApplication sharedApplication] openURL:youtubeURL];
    
}

@end
