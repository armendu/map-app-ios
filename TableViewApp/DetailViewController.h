//
//  DetailViewController.h
//  TableViewApp
//
//  Created by Armend Ukehaxhaj on 7/5/17.
//  Copyright © 2017 Armend Ukehaxhaj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DetailViewController : UIViewController

@property (strong, nonatomic) IBOutlet UILabel *LatitudeLabel;
@property (strong, nonatomic) IBOutlet UILabel *LongitudeLabel;
@property (strong, nonatomic) IBOutlet UILabel *StatusLabel;

@property (strong, nonatomic) NSArray *DetailModal;

@end
