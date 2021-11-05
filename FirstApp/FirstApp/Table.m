//
//  Table.m
//  FirstApp
//
//  Created by Ipageon_김태형 on 2021/11/03.
//

#import "Table.h"
#import "tableTableViewCell.h"

@interface Table(){
    NSArray *array;
}//선언

@end

@implementation Table

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
//초기화 NSArray
    array = [NSArray arrayWithObjects:
             @{
                 @"txt1" : @"jin",
                 @"txt2" : @"01071834672",
             },
             @{
                 @"txt1" : @"김태형",
                 @"txt2" : @"0456",
             },
             @{
                 @"txt1" : @"이태형",
                 @"txt2" : @"123",
             },
             @{
                 @"txt1" : @"박태형",
                 @"txt2" : @"013",
             }, nil ];

}

- (NSInteger)numberOfSecionsInTableView:(UITableView *)tableView{
    return 1;
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    tableTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier: @"cell"];
    NSString *object1 = [array[indexPath.row]objectForKey:@"txt1"];
    NSString *object2 = [array[indexPath.row]objectForKey:@"txt2"];
    [cell.addressLabel setText: object1];
    [cell.numLabel setText: object2];
//    []
    return cell;
    //사용
}


- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return array.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 77.7;
}
- (void)tableV

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSString *object1 = [array[indexPath.row]objectForKey:@"txt1"];
    NSString *object2 = [array[indexPath.row]objectForKey:@"txt2"];
    NSLog(@"%@",[NSString stringWithFormat:@"지금 %@가 전화번호 %@로 클릭 되었습니다.",object1,object2]);
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
