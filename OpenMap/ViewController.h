//
//  ViewController.h
//  OpenMap
//
//  Created by Jamil Dhanani on 2014-05-09.
//  Copyright (c) 2014 Jamil Dhanani. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <GoogleMaps/GoogleMaps.h>

@interface ViewController : UIViewController <GMSMapViewDelegate, UITextFieldDelegate>

@property (nonatomic, retain) GMSMapView *mapView;
@property (nonatomic, retain) NSDictionary *projects;
@property (nonatomic, retain) IBOutlet UITextField *addressField;

@end
