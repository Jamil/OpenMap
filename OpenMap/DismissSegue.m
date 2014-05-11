//
//  DismissSegue.m
//  OpenMap
//
//  Created by Jamil Dhanani on 2014-05-10.
//  Copyright (c) 2014 Jamil Dhanani. All rights reserved.
//

#import "DismissSegue.h"

@implementation DismissSegue

- (void)perform {
    UIViewController *sourceViewController = self.sourceViewController;
    [sourceViewController.presentingViewController dismissViewControllerAnimated:YES completion:nil];
}

@end