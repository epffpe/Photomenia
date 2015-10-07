//
//  Photographer+Create.h
//  Photomenia
//
//  Created by Eugenio Penate on 10/7/15.
//  Copyright © 2015 TimeSet. All rights reserved.
//

#import "Photographer.h"

@interface Photographer (Create)

+(Photographer *)photographerWithName:(NSString *)name
               inManagedObjectContext:(NSManagedObjectContext *)context;

@end
