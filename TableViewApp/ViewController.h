//
//  ViewController.h
//  TableViewApp
//
//  Created by Armend Ukehaxhaj on 7/5/17.
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

@end
