//
//  SystemSetTableViewController.m
//  OrderManage
//
//  Created by mac on 15/6/9.
//  Copyright (c) 2015年 感知. All rights reserved.
//

#import "SystemSetTableViewController.h"
#import "viewOtherDeal.h"
#import "BlueDeviceViewController.h"
#import "POSDeviceViewController.h"

#define CELL_HEIGHT 40

#define CHECK_BOX_BLUE_PRINT 10
#define CHECK_BOX_WEB_PRINT 11
#define CHECK_BOX_POS_PRINT 12


@interface SystemSetTableViewController () <QCheckBoxDelegate> {
    NSArray *_arrayMenus;  // 菜单条目
    NSArray *_arrayHeaderTitle; // 菜单头部标题
}

@end

@implementation SystemSetTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // 初始化
    _arrayHeaderTitle = @[@"选择打印机", @"参数配置"];
    _arrayMenus = @[@[@"蓝牙打印机", @"网络打印机", @"易pos打印机"],
                    @[@"蓝牙设备", @"易pos设备"]];
    
    // 设置Checkbox
    QCheckBox *check1 = [[QCheckBox alloc] initWithDelegate:self];
    check1.frame = CGRectMake(250, 0, 80, CELL_HEIGHT);
    [check1 setTitle:@"设置" forState:UIControlStateNormal];
    [check1 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [check1 setTitleColor:ColorMainSystem forState:UIControlStateHighlighted];
    [check1 setTitleColor:ColorMainSystem forState:UIControlStateSelected];
    [check1.titleLabel setFont:[UIFont boldSystemFontOfSize:13.0f]];
    [check1 setImage:[UIImage imageNamed:@"uncheck_icon.png"] forState:UIControlStateNormal];
    [check1 setImage:[UIImage imageNamed:@"check_icon.png"] forState:UIControlStateSelected];
    [check1 setChecked:YES];
    check1.tag = CHECK_BOX_BLUE_PRINT;
    self.ckBluePrint = check1;
    
    QCheckBox *check2 = [[QCheckBox alloc] initWithDelegate:self];
    check2.frame = CGRectMake(250, 0, 80, CELL_HEIGHT);
    [check2 setTitle:@"设置" forState:UIControlStateNormal];
    [check2 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [check2 setTitleColor:ColorMainSystem forState:UIControlStateHighlighted];
    [check2 setTitleColor:ColorMainSystem forState:UIControlStateSelected];
    [check2.titleLabel setFont:[UIFont boldSystemFontOfSize:13.0f]];
    [check2 setImage:[UIImage imageNamed:@"uncheck_icon.png"] forState:UIControlStateNormal];
    [check2 setImage:[UIImage imageNamed:@"check_icon.png"] forState:UIControlStateSelected];
    [check2 setChecked:NO];
    check2.tag = CHECK_BOX_WEB_PRINT;
    self.ckWebPrint = check2;
    
    QCheckBox *check3 = [[QCheckBox alloc] initWithDelegate:self];
    check3.frame = CGRectMake(250, 0, 80, CELL_HEIGHT);
    [check3 setTitle:@"设置" forState:UIControlStateNormal];
    [check3 setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [check3 setTitleColor:ColorMainSystem forState:UIControlStateHighlighted];
    [check3 setTitleColor:ColorMainSystem forState:UIControlStateSelected];
    [check3.titleLabel setFont:[UIFont boldSystemFontOfSize:13.0f]];
    [check3 setImage:[UIImage imageNamed:@"uncheck_icon.png"] forState:UIControlStateNormal];
    [check3 setImage:[UIImage imageNamed:@"check_icon.png"] forState:UIControlStateSelected];
    [check3 setChecked:NO];
    check3.tag = CHECK_BOX_POS_PRINT;
    self.ckPosPrint = check3;
    
}

#pragma mark - pulltableview 的代理方法实现
#pragma mark  设置有几个section
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return _arrayHeaderTitle.count;
}

#pragma mark 设置每个section中有几个cell
- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [_arrayMenus[section] count];
}

#pragma mark 设置每个cell的内容
- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    
    
    // 设置checkbox
    if (indexPath.section == 0) {
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        if(indexPath.row == 0) [cell addSubview:self.ckBluePrint];
        if(indexPath.row == 1) [cell addSubview:self.ckWebPrint];
        if(indexPath.row == 2) [cell addSubview:self.ckPosPrint];
    }
    
    // 设置cell右边的样式
    if (indexPath.section == 1) {
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.text = _arrayMenus[indexPath.section][indexPath.row];
    
    return cell;
}

#pragma mark 设置section头的标题
- (NSString *) tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return _arrayHeaderTitle[section];
}

#pragma mark 设置section的脚的标题
- (NSString *) tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return nil;
    
}

#pragma mark 当开始拖拽时调用的方法
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView {
}

#pragma mark 设置每个row的高度
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return CELL_HEIGHT;
}

#pragma mark  选中cell时响应方法
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 1) {
        if (indexPath.row == 0) {
            //切换到下一个界面  --- push
            BlueDeviceViewController  *viewControl = [self.storyboard instantiateViewControllerWithIdentifier:@"BlueDevice"];
            [self.navigationController pushViewController:viewControl animated:YES];
        }
        if (indexPath.row == 1) {
            //切换到下一个界面  --- push
            POSDeviceViewController  *viewControl = [self.storyboard instantiateViewControllerWithIdentifier:@"POSDevice"];
            [self.navigationController pushViewController:viewControl animated:YES];
        }
    }
    
}

#pragma mark 设置Header的高度
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 30;
}


#pragma mark - QCheckBoxDelegate

- (void)didSelectedCheckBox:(QCheckBox *)checkbox checked:(BOOL)checked {
    
    if (self.ckBluePrint.tag == checkbox.tag) {
        self.ckWebPrint.checked = NO;
        self.ckPosPrint.checked = NO;
    }
    if (self.ckWebPrint.tag == checkbox.tag) {
        self.ckBluePrint.checked = NO;
        self.ckPosPrint.checked = NO;
    }
    if (self.ckPosPrint.tag == checkbox.tag) {
        self.ckWebPrint.checked = NO;
        self.ckBluePrint.checked = NO;
    }
    
    if (checked) {
        checkbox.checked = YES;
        [checkbox setTitle:@"默认" forState:UIControlStateSelected];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
