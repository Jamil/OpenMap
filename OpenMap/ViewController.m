//
//  ViewController.m
//  OpenMap
//
//  Created by Jamil Dhanani on 2014-05-09.
//  Copyright (c) 2014 Jamil Dhanani. All rights reserved.
//

#import "ViewController.h"
#import "WBProjectViewViewController.h"
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
    GMSCameraPosition *camera = [GMSCameraPosition cameraWithLatitude:28.6139
                                                            longitude:77.2089
                                                                 zoom:8];
    self.mapView = [GMSMapView mapWithFrame:CGRectZero camera:camera];
    self.mapView.myLocationEnabled = YES;
    self.mapView.settings.rotateGestures = NO;
    self.view = self.mapView;
    self.mapView.delegate = self;
}

-(void)mapView:(GMSMapView *)mapView didTapInfoWindowOfMarker:(GMSMarker *)marker {
    // Find appropriate WBProject
    WBProject *proj = [self.projects valueForKey:marker.title];
    WBProjectViewViewController *wbpView = [self.storyboard instantiateViewControllerWithIdentifier:@"WBProj"];
    wbpView.wbp = proj;
    wbpView.loc = marker.snippet;
    [self presentViewController:wbpView animated:YES completion:nil];
    
}

-(void)insertPins:(NSArray*)projects {
    NSMutableDictionary *tempDict = [[NSMutableDictionary alloc] init];
    for (WBProject* currentProj in projects) {
        NSArray *locations = currentProj.locations;
        for (int j = 0; j < locations.count; j++) {
            
            GMSMarker *marker = [[GMSMarker alloc] init];
            float lat = [[locations[j] valueForKey:@"latitude"] floatValue];
            float lon = [[locations[j] valueForKey:@"longitude"] floatValue];
            NSString *locName = [locations[j] valueForKey:@"name"];
            
            marker.position = CLLocationCoordinate2DMake(lat, lon);
            marker.title = currentProj.title;
            marker.snippet = [NSString stringWithFormat:@"%@, $%@ US", locName, currentProj.cost];
            marker.map = self.mapView;
            
            NSDateComponents *components = [[NSCalendar currentCalendar] components:NSCalendarUnitDay | NSCalendarUnitMonth | NSCalendarUnitYear fromDate:[NSDate date]];
            NSInteger year = [components year];
            if (currentProj.yearComplete <= )
            
            marker.icon = [UIImage imageNamed:@"pin"];
        }
        
        // Add to dictionary
        [tempDict setValue:currentProj forKey:currentProj.title];
    }
    self.projects = [tempDict copy];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
