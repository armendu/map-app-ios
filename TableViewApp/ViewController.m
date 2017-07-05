//
//  ViewController.m
//  TableViewApp
//
//  Created by Armend Ukehaxhaj on 7/5/17.
//  Copyright © 2017 Armend Ukehaxhaj. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize mapView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //TODO: Document
    locationManager = [[CLLocationManager alloc] init];
    locationManager.delegate = self;
    locationManager.distanceFilter = kCLDistanceFilterNone;
    locationManager.desiredAccuracy = kCLLocationAccuracyBest;
    
    //Make request to acces location
    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 8.0)
        [self->locationManager requestWhenInUseAuthorization];
    [locationManager startUpdatingLocation];
    
    mapView.showsUserLocation = YES; //When the button is pressed
    [mapView setUserTrackingMode:MKUserTrackingModeFollow animated:YES];
    
    [locationManager stopUpdatingLocation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
 Impelenting the SetMap method
 */
-(IBAction)SetMap:(id)sender {
    switch (((UISegmentedControl *)sender).selectedSegmentIndex) {
        case 0:
            mapView.mapType = MKMapTypeStandard;
            break;
        case 1:
            mapView.mapType = MKMapTypeSatellite;
            break;
        case 2:
            mapView.mapType = MKMapTypeHybrid;
            break;
        default:
            break;
    }
}

/*
 Implementing the GetLocation method
 */
-(IBAction)GetLocation:(id)sender {
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"didUpdateToLocation: %@", newLocation);
    CLLocation *currentLocation = newLocation;
    
    if (currentLocation != nil) {
        MKCoordinateRegion region = { { 0.0, 0.0}, {0.0, 0.0}};
        region.center.latitude = currentLocation.coordinate.latitude;
        region.center.longitude = currentLocation.coordinate.longitude;
        region.span.longitudeDelta = 0.01f; //The zoom
        region.span.latitudeDelta = 0.01f;
        [mapView setRegion:region animated:YES];
    }
    // Stop Location Manager
    [locationManager stopUpdatingLocation];
}

@end
