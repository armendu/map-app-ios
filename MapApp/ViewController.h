//
//  ViewController.h
//  MapApp
//
//  Created by Armend Ukehaxhaj on 7/2/17.
//  Copyright © 2017 Armend Ukehaxhaj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h> //Import he MapKit after it was added to the framework

@interface ViewController : UIViewController <CLLocationManagerDelegate> {
    MKMapView *mapView;
    CLLocationManager *locationManager;
}
@property (nonatomic, retain) IBOutlet MKMapView *mapView;

-(IBAction)SetMap:(id)sender;

-(IBAction)GetLocation:(id)sender;

-(IBAction)Direction:(id)sender;

@end

