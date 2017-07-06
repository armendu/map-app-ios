//
//  ReportObject.h
//  TableViewApp
//
//  Created by Armend Ukehaxhaj on 7/5/17.
//  Copyright © 2017 Armend Ukehaxhaj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ReportObject : NSObject

-(instancetype)initWithId:(int)Id OriginLatitude:(NSString *)originlatitude DestinationLatitude:(NSString *)destinationlatitude OriginLongitude:(NSString *)originlongitude DestinationLongitude:(NSString *)destinationlongitude Status:(NSString *)status TimeOfReport:(NSString *)timeofreport;
@property (nonatomic) int Id;
@property (nonatomic, strong) NSString *originlatitude;
@property (nonatomic, strong) NSString *destinationlatitude;
@property (nonatomic, strong) NSString *originlongitude;
@property (nonatomic, strong) NSString *destinationlongitude;
@property (nonatomic, strong) NSString *status;
@property (nonatomic, strong) NSString *timeofreport;

@end
