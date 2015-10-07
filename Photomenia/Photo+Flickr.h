//
//  Photo+Flickr.h
//  Photomenia
//
//  Created by Eugenio Penate on 10/7/15.
//  Copyright © 2015 TimeSet. All rights reserved.
//

#import "Photo.h"

@interface Photo (Flickr)

+ (Photo *)photoWithFlickrInfo:(NSDictionary *)photoDictionary
        inManagedObjectContext:(NSManagedObjectContext *)context;
+(void) loadPhotosFromFlickrArray:(NSArray *)photos
         intoManagedObjectContext:(NSManagedObjectContext *)context;
@end
