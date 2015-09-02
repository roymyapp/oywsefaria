//
//  Node.h
//  tableview
//
//  Created by g on 6/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "GDataXMLNode.h"

@interface Node : NSObject {
	NSString *_name;
	GDataXMLElement *_xmlelem;
	NSNumber *_chaps;
    NSNumber *_nid;
    NSNumber *_chap;
    NSNumber *_auto;
    NSString *_filename;
    NSString *_xmlIdPattern;
}

@property (nonatomic, copy) NSString *_name;
@property (nonatomic, copy) GDataXMLElement *_xmlelem;
@property (nonatomic, copy) NSNumber *_chaps;
@property (nonatomic, copy) NSNumber *_nid;
@property (nonatomic, copy) NSString *_filename;
@property (nonatomic, copy) NSNumber *_chap;
@property (nonatomic, copy) NSNumber *_auto;
@property (nonatomic, copy) NSString *_xmlIdPattern;


- (id)initWithName:(NSString *)name xmlelem:(GDataXMLElement *)xmlelem chaps:(NSNumber *)chaps chap:(NSNumber *)chap filename:(NSString *)filename xmlIdPattern:(NSString *)xmlIdPattern nid:(NSNumber *)nid autoday:(NSNumber *)autoday;

@end
