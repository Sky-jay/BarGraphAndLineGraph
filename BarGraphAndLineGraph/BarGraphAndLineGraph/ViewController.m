//
//  ViewController.m
//  BarGraphAndLineGraph
//
//  Created by qingyun on 15/12/6.
//  Copyright (c) 2015年 Sky-jay. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) NSArray *VCs;

@end

@implementation ViewController
static NSString *identifier = @"cell";

- (void)viewDidLoad {
    [super viewDidLoad];
    _VCs = @[@"BarGraphVC", @"LineGraphVC"];
    self.tableView.rowHeight = 100;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _VCs.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    cell.textLabel.text = _VCs[indexPath.row];
    cell.textLabel.textAlignment = NSTextAlignmentCenter;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIViewController *VC = [NSClassFromString(_VCs[indexPath.row]) new];
    [self.navigationController pushViewController:VC animated:YES];
}
@end
