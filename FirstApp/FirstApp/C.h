//
//  C.h
//  FirstApp
//
//  Created by Ipageon_김태형 on 2021/11/08.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface C : UIViewController<UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout>

//@interface CCVC 

@property (nonatomic, retain) NSString *nickname;

@end

NS_ASSUME_NONNULL_END
