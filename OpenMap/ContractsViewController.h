//
//  ContractsViewController.h
//  OpenMap
//
//  Created by Jamil Dhanani on 2014-05-10.
//  Copyright (c) 2014 Jamil Dhanani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "JBBarChartView.h"

@interface ContractsViewController : UIViewController <JBBarChartViewDataSource, JBBarChartViewDelegate>

@property (nonatomic, retain) JBBarChartView *jbc;

@end
