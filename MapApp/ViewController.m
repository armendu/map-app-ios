//
//  ViewController.m
//  MapApp
//
//  Created by Armend Ukehaxhaj on 7/2/17.
//  Copyright © 2017 Armend Ukehaxhaj. All rights reserved.
//

#import "ViewController.h"
#import "MapPin.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize mapView;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
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

-(IBAction)Direction:(id)sender {
    
    NSString *urlString = @"http://maps.apple.com/maps=daddr=40.707184,-73.978392";
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:urlString] options:@{} completionHandler:nil];
}

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
        
        MapPin *annotation = [[MapPin alloc] init];
        annotation.title = @"Pin";
        annotation.subtitle = @"TestPin";
        annotation.coordinate = region.center;
        [mapView addAnnotation:annotation];
    }
    // Stop Location Manager
    [locationManager stopUpdatingLocation];
}

@end
