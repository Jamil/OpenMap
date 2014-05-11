//
//  WBProject.h
//  OpenMap
//
//  Created by Jamil Dhanani on 2014-05-10.
//  Copyright (c) 2014 Jamil Dhanani. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface WBProject : NSObject

@property (nonatomic, retain)   NSString *PID;
@property (nonatomic, retain)   NSString *title;
@property (nonatomic, retain)   NSString *cost;
@property (nonatomic, retain)   NSString *amt;
@property (nonatomic, retain)   NSString *abstract;
@property (nonatomic, retain)   NSString *contractorName;
@property (nonatomic)           NSInteger yearComplete;
@property (nonatomic, retain)   NSArray *locations;
@property (nonatomic, retain)   NSDictionary *sectors;

@end