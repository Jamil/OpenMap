//
//  WBProjectViewViewController.h
//  OpenMap
//
//  Created by Jamil Dhanani on 2014-05-10.
//  Copyright (c) 2014 Jamil Dhanani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WBProject.h"
#import "JBBarChartView.h"

@interface WBProjectViewViewController : UIViewController <JBBarChartViewDelegate, JBBarChartViewDataSource>

@property (nonatomic, retain) WBProject *wbp;
@property (nonatomic, retain) NSString *loc;

@property (nonatomic, retain) IBOutlet UILabel              *titleLabel;
@property (nonatomic, retain) IBOutlet UILabel              *regionLabel;
@property (nonatomic, retain) IBOutlet UILabel              *contractorLabel;
@property (nonatomic, retain) IBOutlet UITextView           *detailedDescriptionLabel;
@property (nonatomic, retain) IBOutlet JBBarChartView       *barChart;

-(IBAction)dismissPress;
-(IBAction)fileRTI;
-(IBAction)moreInfo;
-(void)setupLabels;
-(void)setupGraph;

@end
