//
//  MYDocumentHandler.h
//  Photomenia
//
//  Created by Eugenio Penate on 10/7/15.
//  Copyright © 2015 TimeSet. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void (^OnDocumentReady) (UIManagedDocument *document);


@interface MYDocumentHandler : NSObject

@property (strong, nonatomic) UIManagedDocument *document;

+ (MYDocumentHandler *)sharedDocumentHandler;
- (void)performWithDocument:(OnDocumentReady)onDocumentReady;


@end
