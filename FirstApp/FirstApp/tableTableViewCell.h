//
//  tableTableViewCell.h
//  FirstApp
//
//  Created by Ipageon_김태형 on 2021/11/03.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface tableTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *addressLabel;;
@property (weak, nonatomic) IBOutlet UILabel *numLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *cellImageLabel;
@property (weak, nonatomic) IBOutlet UIButton *callIcon;
- (IBAction)callIconPressed:(UIButton *)sender;


@property (weak, nonatomic) IBOutlet UIButton *videoIcon;
- (IBAction)videoIconPressed:(UIButton *)sender;



@end

NS_ASSUME_NONNULL_END
