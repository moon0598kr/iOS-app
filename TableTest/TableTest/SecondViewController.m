//
//  SecondViewController.m
//  TableTest
//
//  Created by Ipageon_김태형 on 2022/10/07.
//

#import "SecondViewController.h"
#import "TableViewCell.h"
#import <NotificationCenter/NotificationCenter.h>

@interface SecondViewController ()
@property (weak, nonatomic) IBOutlet UITableView *tb;
@property (retain, nonatomic) NSString *naming;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _tb.delegate = self;
    _tb.dataSource = self;
    _name = [NSString stringWithFormat:@""];
    
    [NSNotificationCenter.defaultCenter addObserver:self selector:@selector(noti:) name:@"name" object:nil];
    
    
    [_tb registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:nil] forCellReuseIdentifier:@"tbcell"];
}

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
//    [_tb registerNib:[UINib nibWithNibName:@"TableViewCell" bundle:nil] forCellReuseIdentifier:@"tbcell"];
    
    TableViewCell *cell = (TableViewCell *)[tableView dequeueReusableCellWithIdentifier:@"tbcell"];
    [cell.label setText:_naming];
    
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (void)noti:(NSNotification *)notif{
    NSString *abc = [notif.userInfo objectForKey:@"name"];
    _naming = abc;
    
    dispatch_async(dispatch_get_main_queue(), ^{
        [self.tb reloadData];
    });
}


@end
