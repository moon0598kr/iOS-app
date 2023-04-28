//
//  SecondViewController.h
//  TableTest
//
//  Created by Ipageon_김태형 on 2022/10/07.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SecondViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>


@property (retain, nonatomic) NSString *name;
@end

NS_ASSUME_NONNULL_END
