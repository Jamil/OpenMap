//
//  ContractsViewController.m
//  OpenMap
//
//  Created by Jamil Dhanani on 2014-05-10.
//  Copyright (c) 2014 Jamil Dhanani. All rights reserved.
//

#import "ContractsViewController.h"
#import "JBBarChartView.h"

@interface ContractsViewController ()

@end

@implementation ContractsViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (NSUInteger)numberOfBarsInBarChartView:(JBBarChartView *)barChartView
{
    return 10; // number of bars in chart
}

- (CGFloat)barChartView:(JBBarChartView *)barChartView heightForBarViewAtAtIndex:(NSUInteger)index
{
    return index; // height of bar at index
}

-(void)loadView {
    [super loadView];
    self.jbc = [[JBBarChartView alloc] init];
    self.jbc.delegate = self;
    self.jbc.dataSource = self;
    [self.view addSubview:self.jbc];
    self.jbc.frame = self.view.bounds;
    self.jbc.backgroundColor = [UIColor blackColor];
    [self.jbc reloadData];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    
}

-(void)setupGraphs {
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
