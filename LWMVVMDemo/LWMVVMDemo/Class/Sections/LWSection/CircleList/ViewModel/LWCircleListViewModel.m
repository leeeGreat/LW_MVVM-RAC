//
//  LWCircleListViewModel.m
//  LWMVVMDemo
//
//  Created by qianbaoeo on 2017/3/16.
//  Copyright © 2017年 qianbaoeo. All rights reserved.
//

#import "LWCircleListViewModel.h"
#import "LWCircleListColectionCellViewModel.h"
@interface LWCircleListViewModel()
@property (nonatomic,assign) NSUInteger currentPage;

@end

@implementation LWCircleListViewModel
//什么时候调用？
- (void)lw_initialize
{
    @weakify(self)
    [self.refreshDataCommand.executionSignals.switchToLatest subscribeNext:^(id x) {
        @strongify(self)
        
        NSMutableArray *alArray = [[NSMutableArray alloc] init];
        for (int i = 0; i<8; i++) {
            LWCircleListColectionCellViewModel *viewModel = [[LWCircleListColectionCellViewModel alloc] init];
            viewModel.headerImageStr = @"http://mmbiz.qpic.cn/mmbiz/XxE4icZUMxeFjluqQcibibdvEfUyYBgrQ3k7kdSMEB3vRwvjGecrPUPpHW0qZS21NFdOASOajiawm6vfKEZoyFoUVQ/640?wx_fmt=jpeg&wxfrom=5";
            viewModel.name = @"财税培训圈子";
            [alArray addObject:viewModel];

        }
        //包含collectionCellModel的数组给
        self.listHeaderViewModel.dataArray = alArray;
        
        NSMutableArray *reArray = [[NSMutableArray alloc] init];
        //以下为什么不是tableViewCellModel？
        for (int i = 0; i < 8; i++) {
            
            LWCircleListColectionCellViewModel *viewModel = [[LWCircleListColectionCellViewModel alloc] init];
            viewModel.headerImageStr = @"http://mmbiz.qpic.cn/mmbiz/XxE4icZUMxeFjluqQcibibdvEfUyYBgrQ3k7kdSMEB3vRwvjGecrPUPpHW0qZS21NFdOASOajiawm6vfKEZoyFoUVQ/640?wx_fmt=jpeg&wxfrom=5";
            viewModel.name = @"财税培训圈子";
            viewModel.articleNum = @"1568";
            viewModel.peopleNum = @"568";
            viewModel.topicNum = @"5749";
            viewModel.content = @"自己交保险是不是只能交养老和医疗，费用是多少?";
            [reArray addObject:viewModel];
        }
        
        //包含collectionCellModel给self
        self.dataArray = reArray;

        //发送消息给listHeaderView，让其执行block内 collectionView reloadData
        [self.listHeaderViewModel.refreshUISubject sendNext:nil];
        if ([x integerValue]==LWRefreshError) {
            [self.refreshEndSubject sendNext:@(LWRefreshError)];
        }
        else
        {
             [self.refreshEndSubject sendNext:@(LWFooterRefresh_HasMoreData)];
        }
        
//        DissmissHud();
    }];
    
    //下面这个订阅伽马用？ 跳过一次再执行一次？send两次吗？
//    [[[self.refreshDataCommand.executing skip:1] take:1] subscribeNext:^(id x) {
//        if ([x isEqualToNumber:@(YES)]) {
//            ShowMaskStatus(@"正在加载中啊");
//        }
//    }];
    
    //下一页，上啦刷新用   信号中的信号，x是传过来的dict  然后解析传给self.mArray，此处模拟数据
    [self.nextPageCommand.executionSignals.switchToLatest subscribeNext:^(id x) {
        @strongify(self);
        NSMutableArray *reArray = [[NSMutableArray alloc] initWithArray:self.dataArray];
        for (int i = 0; i < 8; i++) {
            
            LWCircleListColectionCellViewModel *viewModel = [[LWCircleListColectionCellViewModel alloc] init];
            viewModel.headerImageStr = @"http://mmbiz.qpic.cn/mmbiz/XxE4icZUMxeFjluqQcibibdvEfUyYBgrQ3k7kdSMEB3vRwvjGecrPUPpHW0qZS21NFdOASOajiawm6vfKEZoyFoUVQ/640?wx_fmt=jpeg&wxfrom=5";
            viewModel.name = @"财税培训圈子";
            viewModel.articleNum = @"1568";
            viewModel.peopleNum = @"568";
            viewModel.topicNum = @"5749";
            viewModel.content = @"自己交保险是不是只能交养老和医疗，费用是多少?";
            [reArray addObject:viewModel];
        }
        self.dataArray = reArray;
        //触发listView中 订阅者block执行，刷新collectionView根据传的值确定是 下拉还是上啦加载更多，或者错误等？
        [self.refreshEndSubject sendNext:@(LWFooterRefresh_HasMoreData)];
//        DissmissHud();
        
    }];
    
    
}

- (LWCircleListHeaderViewModel *)listHeaderViewModel
{
    if (!_listHeaderViewModel) {
        _listHeaderViewModel = [[LWCircleListHeaderViewModel alloc] init];
        _listHeaderViewModel.title = @"已经加入的圈子";
        //传值为啥？用的时候在_listHeaderViewModel初始化不行吗？
        _listHeaderViewModel.cellClickSubject = self.cellClickSubject;
    }
    return _listHeaderViewModel;
}

- (RACSubject *)cellClickSubject
{
    if (!_cellClickSubject) {
        _cellClickSubject = [RACSubject subject];
    }
    return _cellClickSubject;
}

- (RACCommand *)refreshDataCommand
{
    if (!_refreshDataCommand) {
        @weakify(self)
        _refreshDataCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input)
                               {
                                   @strongify(self)
                                   
                                   return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber)
                                   {
                                       @strongify(self)
                                       self.currentPage = 1;
                                       [self.request POST:REQUEST_URL parameters:nil success:^(CMRequest *request, NSString *responseString)
                                       {
                                           NSLog(@"baidu--responseString--%@",responseString);
                                           //示范而已，responseString是html格式的，解析出来是null
                                           NSDictionary *dict = [responseString objectFromJSONString];
                                           NSLog(@"baidu--dict--%@",dict);
                                           [subscriber sendNext:dict];
                                           [subscriber sendCompleted];
                                           //数据返回后，sendNext
                                           
                                       } failure:^(CMRequest *request, NSError *error)
                                       {
                                           ShowErrorStatus(@"网络连接失败");
                                           [subscriber sendNext:@(LWRefreshError)];
                                           [subscriber sendCompleted];
                                       }];
                                       //这里一般写nil
                                       return nil;
                                   }];
                                   
                                   
                               }];
    }
    return _refreshDataCommand;
}

- (RACCommand *)nextPageCommand
{
    if (!_nextPageCommand) {
        _nextPageCommand = [[RACCommand alloc] initWithSignalBlock:^RACSignal *(id input) {
            @weakify(self);
            return [RACSignal createSignal:^RACDisposable *(id<RACSubscriber> subscriber) {
                @strongify(self);
                //模拟网络请求
                self.currentPage++;
                [self.request POST:REQUEST_URL parameters:nil success:^(CMRequest *request, NSString *responseString) {
                    
                    NSDictionary *dict = [responseString objectFromJSONString];
                    //
                    [subscriber sendNext:dict];
                    [subscriber sendCompleted];
                    
                    
                } failure:^(CMRequest *request, NSError *error) {
                    @strongify(self);
                    self.currentPage--;
                    ShowErrorStatus(@"网络连接失败");
                    [subscriber sendCompleted];
                }];
                
                return nil;
            }];
        }];
    }
    return _nextPageCommand;
}

- (RACSubject *)refreshEndSubject
{
    if (!_refreshEndSubject) {
        _refreshEndSubject = [RACSubject subject];
    }
    return _refreshEndSubject;
}

- (LWCircleListSectionHeaderViewModel *)sectionHeaderViewModel
{
    if (!_sectionHeaderViewModel) {
        _sectionHeaderViewModel = [[LWCircleListSectionHeaderViewModel alloc] init];
        _sectionHeaderViewModel.title = @"推荐";
    }
    return _sectionHeaderViewModel;
}
@end
