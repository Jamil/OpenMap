//
//  WBProjectParser.m
//  OpenMap
//
//  Created by Jamil Dhanani on 2014-05-09.
//  Copyright (c) 2014 Jamil Dhanani. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import "WBProjectParser.h"
#import "WBProject.h"

@implementation WBProjectParser

+(NSArray*)parseFile {
    // Array of WBProjects
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    
    NSData *jsonData = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://search.worldbank.org/api/v2/projects?format=json&source=IBRD&countryname_exact=Republic+of+India&rows=10&geocode=on&kw=N"]];
    
    NSError *error;
    NSDictionary *parsed = [NSJSONSerialization
                          JSONObjectWithData:jsonData
                          options:kNilOptions
                          error:&error];
    
    NSDictionary *allProjects = [parsed valueForKey:@"projects"];
    NSArray *projectIDs = [allProjects allKeys];
    NSArray *projectData = [allProjects allValues];
    for (int i = 0; i < [projectIDs count]; i++) {
        NSMutableArray *coords = [[NSMutableArray alloc] init];
        
        WBProject *project = [[WBProject alloc] init];
        NSLog(@"%@", projectIDs[i]);
        
        NSArray *latitudes = [[projectData[i] valueForKey:@"locations"] valueForKey:@"latitude"];
        NSArray *longitudes = [[projectData[i] valueForKey:@"locations"] valueForKey:@"longitude"];
        
        for (int i = 0; i < [latitudes count]; i++) {
            NSDictionary *coordinate = [[NSDictionary alloc] initWithObjectsAndKeys:latitudes[i],@"latitude",longitudes[i], @"longitude", nil];
            [coords addObject:coordinate];
        }
        project.locations = coords;
        [arr addObject:project];
    }
    return arr;
}

@end
