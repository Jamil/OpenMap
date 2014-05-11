//
//  WBProjectViewViewController.m
//  OpenMap
//
//  Created by Jamil Dhanani on 2014-05-10.
//  Copyright (c) 2014 Jamil Dhanani. All rights reserved.
//

#import "WBProjectViewViewController.h"

@interface WBProjectViewViewController ()

@end

@implementation WBProjectViewViewController

-(IBAction)fileRTI {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"http://www.onlinerti.com/apply"]];
}

-(IBAction)moreInfo {
    
}

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

-(void)dismissPress {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self setupLabels];
    [self setupGraph];
}

-(void)viewDidAppear:(BOOL)animated {
    [self.barChart setState:JBChartViewStateExpanded animated:YES];
}

- (void)setupLabels {
    self.titleLabel.text = self.wbp.title;
    self.regionLabel.text = self.loc;
    self.detailedDescriptionLabel.text = self.wbp.abstract;
    self.contractorLabel.text = self.wbp.contractorName;
}

-(void)setupGraph {
    self.barChart = [[JBBarChartView alloc] initWithFrame:CGRectMake(10.0f, 10.0f,self.view.bounds.size.width - 20.0f, 250.0f)];
    self.barChart.delegate = self;
    self.barChart.dataSource = self;
    [self.view addSubview:self.barChart];
    [self.barChart reloadData];
}

- (NSUInteger)numberOfBarsInBarChartView:(JBBarChartView *)barChartView
{
    return 2;
}

- (CGFloat)barChartView:(JBBarChartView *)barChartView heightForBarViewAtAtIndex:(NSUInteger)index
{
    return index ? (CGFloat)[self.wbp.amt floatValue] : (CGFloat)[self.wbp.cost floatValue];
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
