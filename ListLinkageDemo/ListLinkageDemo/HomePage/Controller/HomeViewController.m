//
//  HomeViewController.m
//  ListLinkageDemo
//
//  Created by working on 2017/7/13.
//  Copyright © 2017年 hanbo. All rights reserved.
//

#import "HomeViewController.h"
#import "AYConstantValue.h"

#define LeftTable_Width 100  // 左侧tableView的宽度
#define Address_Height  80   // 地址视图高度
#define SendView_Height 40   // 派送次数视图高度
@interface HomeViewController ()<UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *leftTableView;
@property (nonatomic, strong) UITableView *rightTableView;
@property (nonatomic, strong) AYShippingAddressView *addressView;  // 地址视图
@property (nonatomic, strong) AYSendOpportunityView *sendView;     // 派送次数视图
@property (nonatomic, strong) NSMutableArray *dataArray; // 数据

@end

@implementation HomeViewController

#pragma mark - 懒加载
- (NSMutableArray *)dataArray {
    if (!_dataArray) {
        self.dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

#pragma mark - sysetem method
- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"列表联动";
    [self loadData];
    [self creatSubViews];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}
#pragma mark - accessory method

- (void)loadData {
    NSString *path = [[NSBundle mainBundle] pathForResource:@"vegetable" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:path];
    NSDictionary *dict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSArray *proprietaryArray = [AYCollectFoodModel mj_objectArrayWithKeyValuesArray:dict[@"farm_vegetable"]];
    [self.dataArray addObjectsFromArray:proprietaryArray];
}

- (void)creatSubViews {
    // 解决tableView偏移
     self.automaticallyAdjustsScrollViewInsets = NO;
    
    // 地址视图
    self.addressView = [[[NSBundle mainBundle] loadNibNamed:@"AYShippingAddressView" owner:self options:nil] firstObject];
    //    self.addressView.frame = CGRectMake(0, 0, kScreenWidth, 80);
    [self.view addSubview:self.addressView];
    [self.addressView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(64);
        make.left.right.mas_equalTo(0);
        make.height.mas_equalTo(Address_Height);
    }];
    
    // 派送次数视图
    self.sendView = [[[NSBundle mainBundle] loadNibNamed:@"AYSendOpportunityView" owner:self options:nil] firstObject];
    self.sendView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleRightMargin;
    //    self.sendView.frame = CGRectMake(0, Address_Height, kScreenWidth, SendView_Height);
    [self.view addSubview:self.sendView];
    [self.sendView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(0);
        make.top.mas_equalTo(self.addressView.mas_bottom);
        make.height.mas_equalTo(SendView_Height);
    }];

    
    // 左侧tableView
    self.leftTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, Address_Height + SendView_Height+64, LeftTable_Width, kScreenHeight - 64 - 50 - Address_Height - SendView_Height) style:UITableViewStylePlain];
    self.leftTableView.backgroundColor = KLightYellowColor;
    self.leftTableView.dataSource = self;
    self.leftTableView.delegate = self;
    [self.leftTableView registerNib:[UINib nibWithNibName:@"AYLeftPickTableViewCell" bundle:nil] forCellReuseIdentifier:@"AYLeftPickTableViewCell"];
    self.leftTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:self.leftTableView];
//    // 隐藏单元格分割线
    self.leftTableView.separatorStyle = UITableViewCellSelectionStyleNone;
    self.leftTableView.showsVerticalScrollIndicator = NO; // 隐藏滚动条
    [self.leftTableView selectRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0] animated:YES scrollPosition:UITableViewScrollPositionNone];
    
    self.rightTableView = [[UITableView alloc] initWithFrame:CGRectMake(LeftTable_Width, Address_Height + SendView_Height + 64, kScreenWidth - LeftTable_Width, kScreenHeight - 64 - 50 - Address_Height - SendView_Height) style:UITableViewStyleGrouped];
    self.rightTableView.backgroundColor = [UIColor clearColor];
    self.rightTableView.dataSource = self;
    self.rightTableView.delegate = self;
    [self.rightTableView registerNib:[UINib nibWithNibName:@"AYRightPickTableViewCell" bundle:nil] forCellReuseIdentifier:@"AYRightPickTableViewCell"];
    self.rightTableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
    [self.view addSubview:self.rightTableView];
}

#pragma mark - table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (self.leftTableView == tableView) {
        return 1;
    } else {
        return self.dataArray.count;
    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.leftTableView == tableView) {
        return self.dataArray.count;
    } else {
        AYCollectFoodModel *model = self.dataArray[section];
        return model.farmvegetable.count;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (tableView == self.leftTableView) {
        return 50;
    } else {
        return 100;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (tableView == self.leftTableView) {
        return 0;
    } else {
        return 30;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (tableView == self.leftTableView) {
        return CGFLOAT_MIN;
    } else {
        return CGFLOAT_MIN;
    }
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    if (tableView == self.leftTableView) {
        return @"";
    } else {
        return @"我的蔬菜";
    }
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    if (tableView == _leftTableView) {
        return nil;
    } else {
        UIView *headView = [UIView new];
        headView.backgroundColor = RGBA(254.f, 230.f, 206.f, 1);
        
        UILabel *headLabel = [UILabel new];
        [headView addSubview:headLabel];
        headLabel.textColor = kOrangeTextColor;
        headLabel.font = kkFont16;
        
        AYCollectFoodModel *model = self.dataArray[section];
        headLabel.text = model.vegname;
        [headLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.mas_equalTo(headView);
            make.left.mas_equalTo(20);
        }];
        return headView;
    }
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (self.leftTableView == tableView) {
        AYLeftPickTableViewCell *leftCell = [tableView dequeueReusableCellWithIdentifier:@"AYLeftPickTableViewCell" forIndexPath:indexPath];
        AYCollectFoodModel *model = self.dataArray[indexPath.row];
        leftCell.titleLabel.text = model.vegname;
        leftCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return leftCell;
    } else {
        AYRightPickTableViewCell *rightCell = [tableView dequeueReusableCellWithIdentifier:@"AYRightPickTableViewCell" forIndexPath:indexPath];
        AYCollectFoodModel *collectModel = self.dataArray[indexPath.section];
        AYvegetableModel *model = collectModel.farmvegetable[indexPath.row];
        rightCell.model = model;
//        rightCell.delegate = self;
        rightCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return rightCell;
    }
}

#pragma mark - table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    if (_leftTableView == tableView) {
        AYLeftPickTableViewCell *leftCell = [tableView cellForRowAtIndexPath:indexPath];
        leftCell.contentView.backgroundColor = KLightYellowColor;
        
        NSArray *array = [tableView visibleCells];
        for (AYLeftPickTableViewCell *leftCell in array) {
            // 不打对勾
            leftCell.titleLabel.textColor = [UIColor blackColor];
        }
        // 打对勾
        leftCell.titleLabel.textColor = kOrangeTextColor;
        [_rightTableView scrollToRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:indexPath.row] atScrollPosition:UITableViewScrollPositionTop animated:YES];
    }
}

#pragma mark - scrollView delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    // 滑动视图上移动画
    [self viewUpAnimationWihtScrollView:scrollView];
    if (scrollView == self.rightTableView) {
        //取出当前显示的最顶部的cell的indexpath
        //当前tableview页面可见的分区属性 indexPathsForVisibleRows
        // 取出显示在 视图 且最靠上 的 cell 的 indexPath
        // 判断tableView是否滑动到最底部
        CGFloat height = scrollView.frame.size.height;
        CGFloat contentOffsetY = scrollView.contentOffset.y;
        CGFloat bottomOffset = scrollView.contentSize.height - contentOffsetY;
        if (bottomOffset <= height) {
            NSIndexPath *bottomIndexPath = [[self.rightTableView indexPathsForVisibleRows] lastObject];
            NSIndexPath *moveIndexPath = [NSIndexPath indexPathForRow:bottomIndexPath.section inSection:0];
            [self.leftTableView selectRowAtIndexPath:moveIndexPath animated:NO scrollPosition:UITableViewScrollPositionMiddle];
        } else {
            NSIndexPath *topIndexPath = [[self.rightTableView indexPathsForVisibleRows]firstObject];
            NSIndexPath *moveIndexPath = [NSIndexPath indexPathForRow:topIndexPath.section inSection:0];
            [self.leftTableView selectRowAtIndexPath:moveIndexPath animated:NO scrollPosition:UITableViewScrollPositionMiddle];
        }
    }else{
        return;
    }
}

#pragma mark - 滑动视图上移动画
- (void)viewUpAnimationWihtScrollView:(UIScrollView *)scrollView {
    if (scrollView.contentOffset.y > 0) {
        [self.addressView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.top.mas_equalTo(-Address_Height+64);
            make.height.mas_equalTo(Address_Height);
        }];
        
        [UIView animateWithDuration:0.2 animations:^{
            [self.view layoutIfNeeded];
            self.rightTableView.frame = CGRectMake(LeftTable_Width, SendView_Height+64, kScreenWidth - LeftTable_Width, kScreenHeight - 64 - 50 - SendView_Height);
            self.leftTableView.frame = CGRectMake(0,  SendView_Height+64, LeftTable_Width, kScreenHeight - 64 - 50 - SendView_Height);
        } completion:^(BOOL finished) {
            nil;
        }];
    } else {
        [self.addressView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.top.mas_equalTo(64);
            make.height.mas_equalTo(Address_Height);
        }];
        
        [UIView animateWithDuration:0.2 animations:^{
            [self.view layoutIfNeeded];
            self.rightTableView.frame = CGRectMake(LeftTable_Width, Address_Height + SendView_Height+64, kScreenWidth - LeftTable_Width, kScreenHeight - 64 - 50 - Address_Height - SendView_Height);
            self.leftTableView.frame = CGRectMake(0, Address_Height + SendView_Height+64, LeftTable_Width, kScreenHeight - 64 - 50 - Address_Height - SendView_Height);
        } completion:^(BOOL finished) {
            nil;
        }];
    }
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
