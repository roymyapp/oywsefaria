//
//  Node.m
//  tableview
//
//  Created by g on 6/13/11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Node.h"


@implementation Node

@synthesize _name = _name;
@synthesize _xmlelem = _xmlelem;
@synthesize _chaps = _chaps;
@synthesize _chap = _chap;
@synthesize _nid = _nid;
@synthesize _filename = _filename;
@synthesize _xmlIdPattern = _xmlIdPattern;
@synthesize _auto = _auto;

- (id)initWithName:(NSString *)name xmlelem:(GDataXMLElement *)xmlelem chaps:(NSNumber *)chaps chap:(NSNumber *)chap filename:(NSString *)filename xmlIdPattern:(NSString *)xmlIdPattern nid:(NSNumber *)nid autoday:(NSNumber *)autoday {
	if ((self = [super init])) {
		self._name = name;
		self._xmlelem = xmlelem;
		self._chaps = chaps;	
		self._chap = chap;	
        self._nid = nid;
        self._filename = filename;	
        self._xmlIdPattern = xmlIdPattern;
        self._auto = autoday;

	}
	return self;
}

- (void) dealloc {
	self._name = nil;
	self._xmlelem = nil;
	self._chaps = nil;
	self._chap = nil;    
    self._nid = nil;
    self._filename = nil;
	self._xmlIdPattern = nil;
    self._auto = nil;
}

@end
