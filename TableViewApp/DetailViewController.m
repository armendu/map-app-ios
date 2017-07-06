//
//  DetailViewController.m
//  TableViewApp
//
//  Created by Armend Ukehaxhaj on 7/5/17.
//  Copyright © 2017 Armend Ukehaxhaj. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()

@end

@implementation DetailViewController

@synthesize mapViewDetails;

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _ReportIdLabel.text = _DetailModal[0];
    _OriginLatitudeLabel.text = _DetailModal[1];
    _OriginLongitudeLabel.text = _DetailModal[2];
    
    self.navigationItem.title = _DetailModal[0];
    
    double latitude = [_DetailModal[1] doubleValue];
    double longitude = [_DetailModal[2] doubleValue];
    
    MKCoordinateRegion region = { { 0.0, 0.0}, {0.0, 0.0}};
    region.center.latitude = latitude;
    region.center.longitude = longitude;
    region.span.longitudeDelta = 0.01f; //The zoom
    region.span.latitudeDelta = 0.01f;
    [mapViewDetails setRegion:region animated:YES];
    
    MKPointAnnotation *myAnnotation = [[MKPointAnnotation alloc] init];
    myAnnotation.coordinate = CLLocationCoordinate2DMake(latitude, longitude);
    myAnnotation.title = _DetailModal[0];
    [mapViewDetails addAnnotation:myAnnotation];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
