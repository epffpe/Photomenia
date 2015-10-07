//
//  Photographer+Create.m
//  Photomenia
//
//  Created by Eugenio Penate on 10/7/15.
//  Copyright © 2015 TimeSet. All rights reserved.
//

#import "Photographer+Create.h"

@implementation Photographer (Create)

+(Photographer *)photographerWithName:(NSString *)name
               inManagedObjectContext:(NSManagedObjectContext *)context
{
    Photographer *photographer = nil;
    
    if ([name length]) {
        NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Photographer"];
        request.predicate = [NSPredicate predicateWithFormat:@"name = %@", name];
        
        NSError *error;
        NSArray *matches = [context executeFetchRequest:request error:&error];
        
        if (!matches || ([matches count] > 1)) {
            
        }else if(![matches count]){
            photographer = [NSEntityDescription insertNewObjectForEntityForName:@"Photographer"
                                                         inManagedObjectContext:context];
            
            photographer.name = name;
        }else{
            photographer = [matches lastObject];
        }
    }
    
    return photographer;
}

@end
