//
//  ViewController.m
//  OpenMap
//
//  Created by Jamil Dhanani on 2014-05-09.
//  Copyright (c) 2014 Jamil Dhanani. All rights reserved.
//

#import "ViewController.h"
#import "WBProject.h"
#import "WBProjectParser.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self setupMap];
    
    NSArray *projects = [WBProjectParser parseFile];
    [self insertPins:projects];
}

- (void)setupMap
{
    // Do any additional setup after loading the view, typically from a nib.
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:23.281719
                                                            longitude:81.386719              zoom:4];
    self.mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    self.mapView.myLocationEnabled = YES;
    self.view = self.mapView;
    
    /*
     // Creates a marker in the center of the map.
     GMSMarker *marker = [[GMSMarker alloc] init];
     marker.position = CLLocationCoordinate2DMake(-33.86, 151.20);
     marker.title = @"Sydney";
     marker.snippet = @"Australia";
     marker.map = self.mapView;
     */
}

-(void)insertPins:(NSArray*)projects {
    for (int i = 0; i < projects.count; i++) {
        NSArray *locations = ((WBProject*)projects[i]).locations;
        for (int j = 0; j < locations.count; j++) {
            
            NSLog(@"%@", locations[j]);
            
            GMSMarker *marker = [[GMSMarker alloc] init];
            float lat = [[locations[j] valueForKey:@"latitude"] floatValue];
            float lon = [[locations[j] valueForKey:@"longitude"] floatValue];
            marker.position = CLLocationCoordinate2DMake(lat, lon);
            marker.title = @"Sydney";
            marker.snippet = @"Australia";
            marker.map = self.mapView;
            
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
