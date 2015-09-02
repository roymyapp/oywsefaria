//
//  ZipData.h
//  OnYourWay
//
//  Created by Royi Reshef on 4/5/15.
//
//
#ifndef __ZIPDATA_H__
#define __ZIPDATA_H__
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

#import "GDataXMLNode.h"

#define MAX_CACHE 100

@interface ZipData : NSObject {

}

+ (GDataXMLDocument *)loadData:(NSString*)name printError:(BOOL)printError;
+ (NSDictionary *)loadJsonData:(NSString*)name printError:(BOOL)printError cache:(NSArray*) cache;

@end
#endif //__ZIPDATA_H__