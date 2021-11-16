//
//  C.m
//  FirstApp
//
//  Created by Ipageon_김태형 on 2021/11/08.
//

#import "C.h"
#import "CCVC.h"
#import "ImageViewer.h"

@interface C (){
    NSArray *collectionArray;
}



@end

@implementation C

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    collectionArray = [NSArray arrayWithObjects:
             @{
                 @"url" : @"https://shopping-phinf.pstatic.net/main_2794445/27944457757.20210710234839.jpg?type=f640"
             },
             @{
                 @"url" : @"https://shopping-phinf.pstatic.net/main_2407151/24071512006.20200907184601.jpg?type=f640"
             },
             @{
                 @"url" : @"https://shopping-phinf.pstatic.net/main_2403050/24030506372.20200903215106.jpg?type=f640"
             },
             @{
                 @"url" : @"https://shopping-phinf.pstatic.net/main_2794445/27944457757.20210710234839.jpg?type=f640"
             }, nil ];
    
    
    NSLog(@"값은 %@", self.nickname);
    // Do any additional setup after loading the view.
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return collectionArray.count;
}
/*- (nonnull _kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    CCVC *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CCVcell" forIndexPath: indexPath];
    NSString *object = [collectionArray[indexPath.row]objectForKey:@"url"];
    NSURL *url = [NSURL URLWithString:object];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *img = [[UIImage alloc] initWithData:data];
    [cell.collectionImage setImage:img];
    return cell;
}*/

- (UIImage *)imageWithImage:(UIImage *)image convertToSize:(CGSize)size {
    UIGraphicsBeginImageContext(size);
    [image drawInRect:CGRectMake(0, 0, size.width, size.height)];
    UIImage *destImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return destImage;
}

- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    
    CCVC *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"CCVcell" forIndexPath: indexPath];
    NSString *object1 = [collectionArray[indexPath.row]objectForKey:@"url"];
    NSURL *url = [NSURL URLWithString:object1];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *img = [[UIImage alloc] initWithData:data];
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    float cellWidth = (screenWidth/3)-2;
    [cell.collectionImage setImage:[self imageWithImage:img convertToSize:CGSizeMake(cellWidth, cellWidth)]];
    
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    CGRect screenRect = [[UIScreen mainScreen] bounds];
    CGFloat screenWidth = screenRect.size.width;
    float cellWidth = screenWidth/3;
    return CGSizeMake(cellWidth, cellWidth);
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    
    if ([segue.identifier isEqualToString:@"gotoImage"]) {
        ImageViewer *controller = (ImageViewer*)segue.destinationViewController;
        controller.url = sender;
    }
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    
    NSString *object1 = [collectionArray[indexPath.row] objectForKey:@"url"];
    [self performSegueWithIdentifier:@"gotoImage" sender:object1];
    
}





/*- (IBAction)sendercollectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    
}*/
//- (IBAction)<#selector#>:(id)sender

//- (CGSize)

/*

- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    <#code#>
}


- (nonnull __kindof UICollectionViewCell *)collectionView:(nonnull UICollectionView *)collectionView cellForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    <#code#>
}


- (NSInteger)collectionView:(nonnull UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    <#code#>
}*/



/*
 #pragma mark - Navigation
 
 // - (void)encodeWithCoder:(nonnull NSCoder *)coder {
 <#code#>
 }
 
 - (void)traitCollectionDidChange:(nullable UITraitCollection *)previousTraitCollection {
 <#code#>
 }
 
 - (void)preferredContentSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
 <#code#>
 }
 
 - (CGSize)sizeForChildContentContainer:(nonnull id<UIContentContainer>)container withParentContainerSize:(CGSize)parentSize {
 <#code#>
 }
 
 - (void)systemLayoutFittingSizeDidChangeForChildContentContainer:(nonnull id<UIContentContainer>)container {
 <#code#>
 }
 
 - (void)viewWillTransitionToSize:(CGSize)size withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
 <#code#>
 }
 
 - (void)willTransitionToTraitCollection:(nonnull UITraitCollection *)newCollection withTransitionCoordinator:(nonnull id<UIViewControllerTransitionCoordinator>)coordinator {
 <#code#>
 }
 
 - (void)didUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context withAnimationCoordinator:(nonnull UIFocusAnimationCoordinator *)coordinator {
 <#code#>
 }
 
 - (void)setNeedsFocusUpdate {
 <#code#>
 }
 
 - (BOOL)shouldUpdateFocusInContext:(nonnull UIFocusUpdateContext *)context {
 <#code#>
 }
 
 - (void)updateFocusIfNeeded {
 <#code#>
 }
 
 In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */


@end
