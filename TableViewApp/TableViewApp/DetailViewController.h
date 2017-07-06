//
//  DetailViewController.h
//  TableViewApp
//
//  Created by Armend Ukehaxhaj on 7/5/17.
//  Copyright © 2017 Armend Ukehaxhaj. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h> //Import he MapKit after it was added to the framework

@interface DetailViewController : UIViewController {
    MKMapView *mapViewDetails;
}

@property (nonatomic, retain) IBOutlet MKMapView *mapViewDetails;
@property (strong, nonatomic) IBOutlet UILabel *ReportIdLabel;
@property (strong, nonatomic) IBOutlet UILabel *OriginLabel;
@property (strong, nonatomic) IBOutlet UILabel *DestinationLabel;
@property (strong, nonatomic) IBOutlet UILabel *StatusLabel;
@property (strong, nonatomic) IBOutlet UILabel *TimeOfReport;

@property (strong, nonatomic) NSArray *DetailModal;

@end
