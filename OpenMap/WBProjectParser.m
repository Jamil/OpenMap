//
//  WBProjectParser.m
//  OpenMap
//
//  Created by Jamil Dhanani on 2014-05-09.
//  Copyright (c) 2014 Jamil Dhanani. All rights reserved.
//

#import <CoreLocation/CoreLocation.h>
#import "WBContractorParser.h"
#import "WBProjectParser.h"
#import "WBProject.h"

@implementation WBProjectParser

+(NSArray*)parseFile {
    
    // Array of WBProjects
    NSMutableArray *arr = [[NSMutableArray alloc] init];
    
    NSData *jsonData = [NSData dataWithContentsOfURL:[NSURL URLWithString:@"http://search.worldbank.org/api/v2/projects?format=json&source=IBRD&countryname_exact=Republic+of+India&rows=500&geocode=on&kw=N"]];
    
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
        
        //NSLog(@"%@", projectData[i]);
        
        NSString *projname = [[projectData[i] valueForKey:@"project_name"] capitalizedString];
        NSString *abstract = [[projectData[i] valueForKey:@"project_abstract"] valueForKey:@"cdata"];
        
        NSArray *latitudes = [[projectData[i] valueForKey:@"locations"] valueForKey:@"latitude"];
        NSArray *longitudes = [[projectData[i] valueForKey:@"locations"] valueForKey:@"longitude"];
        NSArray *locNames = [[projectData[i] valueForKey:@"locations"] valueForKey:@"geoLocName"];
        
        NSString *yearCompleteStr = [[projectData[i] valueForKey:@"closingdate"] substringToIndex:4];
        NSInteger yearComplete = [yearCompleteStr integerValue];
        
        NSString *cost = [projectData[i] valueForKey:@"totalcommamt"];
        NSString *amt = [projectData[i] valueForKey:@"totalamt"];
        
        for (int i = 0; i < [latitudes count]; i++) {
            NSDictionary *coordinate = [[NSDictionary alloc] initWithObjectsAndKeys:latitudes[i],@"latitude",longitudes[i], @"longitude", locNames[i], @"name", nil];
            [coords addObject:coordinate];
        }
        
        project.PID = projectIDs[i];
        project.title = projname;
        project.locations = coords;
        project.cost = cost;
        project.amt = amt;
        project.abstract = abstract;
        project.yearComplete = yearComplete;
        
        [arr addObject:project];
    }
    
    [WBContractorParser getContractorsForArray:arr];
    
    return arr;
}

@end
