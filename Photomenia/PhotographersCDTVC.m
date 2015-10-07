//
//  PhotographersCDTVC.m
//  Photomenia
//
//  Created by Eugenio Penate on 10/7/15.
//  Copyright © 2015 TimeSet. All rights reserved.
//

#import "PhotographersCDTVC.h"
#import "Photographer+CoreDataProperties.h"
#import "PhotoDatabaseAvailability.h"

@implementation PhotographersCDTVC

-(void)awakeFromNib
{
    [[NSNotificationCenter defaultCenter]addObserverForName:PhotoDatabaseAvailabilityNotification
                                                     object:nil
                                                      queue:nil
                                                 usingBlock:^(NSNotification * _Nonnull note) {
                                                     self.managedObjectContext = note.userInfo[PhotoDatabaseAvailabilityContext];
                                                 }];
}

-(void)setManagedObjectContext:(NSManagedObjectContext *)managedObjectContext
{
    _managedObjectContext = managedObjectContext;
    
    NSFetchRequest *request = [NSFetchRequest fetchRequestWithEntityName:@"Photographer"];
    request.predicate = nil;
    request.sortDescriptors = @[[NSSortDescriptor sortDescriptorWithKey:@"name"
                                                              ascending:YES
                                                               selector:@selector(localizedStandardCompare:)]];
//    request.fetchLimit = 100;
    
    self.fetchedResultsController = [[NSFetchedResultsController alloc]initWithFetchRequest:request
                                                                       managedObjectContext:managedObjectContext
                                                                         sectionNameKeyPath:nil
                                                                                  cacheName:nil];
    
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.tableView dequeueReusableCellWithIdentifier:@"Photographer Cell"];
    
    Photographer *photographer = [self.fetchedResultsController objectAtIndexPath:indexPath];
    
    cell.textLabel.text = photographer.name;
    cell.detailTextLabel.text = [NSString stringWithFormat:@"%lu photos", [photographer.photos count]];
    return cell;
}

@end
