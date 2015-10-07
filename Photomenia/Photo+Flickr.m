//
//  Photo+Flickr.m
//  Photomenia
//
//  Created by Eugenio Penate on 10/7/15.
//  Copyright © 2015 TimeSet. All rights reserved.
//

#import "Photo+Flickr.h"

@implementation Photo (Flickr)


+ (Photo *)photoWithFlickrInfo:(NSDictionary *)photoDictionary
        inManagedObjectContext:(NSManagedObjectContext *)context
{
    Photo *photo = nil;
    
    NSString *unique = 
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Photo"];
    request.predicate = [NSPredicate predicateWithFormat:@"unique = @@", unique];
    
    return photo;
}
+(void)loadPhotosFromFlickrArray:(NSArray *)photos
         intoManagedObjectContext:(NSManagedObjectContext *)context
{
    
}


@end
