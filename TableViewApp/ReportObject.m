//
//  ReportObject.m
//  TableViewApp
//
//  Created by Armend Ukehaxhaj on 7/5/17.
//  Copyright © 2017 Armend Ukehaxhaj. All rights reserved.
//

#import "ReportObject.h"

@implementation ReportObject

-(instancetype)initWithId:(int)Id OriginLatitude:(NSString *)originlatitude DestinationLatitude:(NSString *)destinationlatitude OriginLongitude:(NSString *)originlongitude DestinationLongitude:(NSString *)destinationlongitude Status:(NSString *)status TimeOfReport:(NSString *)timeofreport   {
    self=[super init];
    if(self){
        self.Id = Id;
        self.originlatitude = originlatitude;
        self.destinationlatitude = destinationlatitude;
        self.originlongitude = originlongitude;
        self.destinationlongitude = destinationlongitude;
        self.status = status;
        self.timeofreport = timeofreport;
    }
    return self;
}

@end
