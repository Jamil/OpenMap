//
//  WBProjectParser.h
//  OpenMap
//
//  Created by Jamil Dhanani on 2014-05-09.
//  Copyright (c) 2014 Jamil Dhanani. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum filterTypes {
    ClimateChange, 
} FilterTypes;

@interface WBProjectParser : NSObject

+(NSArray*)parseFile;

@end