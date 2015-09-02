//
//  NodesParser.m
//  tableview
//
//  Created by g on 6/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//


#import "NodesParser.h"


@implementation NodesParser

+ (NSString *)dataFilePath {
	return [[NSBundle mainBundle] pathForResource:@"tanach" ofType:@"xml"];
}

+ (NSArray *)loadNodes {
    
	NSString *filepath = [self dataFilePath];
	NSData *xmlData = [[NSMutableData alloc] initWithContentsOfFile:filepath];
    //NSString *s =  [[NSString alloc] initWithContentsOfFile:filepath];
    //NSLog(@"%@",s);
	NSError *error;
	GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithData:xmlData
						options:0 error:&error];
	if (doc == nil) {
        NSLog(@"could not load xml file");
		return nil;
	}
	//NSLog(@"%@", doc.rootElement);
	return (NSArray*) doc;	
}

@end
