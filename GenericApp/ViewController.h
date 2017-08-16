//
//  ViewController.h
//  GenericApp
//
//  Created by Royi Reshef on 5/26/15.
//  Copyright (c) 2015 Royi Reshef. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MMDrawerController.h"
#import "NodesParser.h"
#import "Node.h"
#import "GDataXMLNode.h"

@interface ViewController : UIViewController<UIPickerViewDelegate,UIGestureRecognizerDelegate,UIWebViewDelegate, UISearchBarDelegate, UIActionSheetDelegate, UIPickerViewDataSource,UIScrollViewDelegate,UIDocumentInteractionControllerDelegate,UITableViewDataSource,UITableViewDelegate,UIPickerViewDataSource>
@property (nonatomic,strong) MMDrawerController * drawerController;
@property (nonatomic, retain) UIActivityIndicatorView *activityView;
@property (nonatomic, retain) UIView *loadingView;
@property (strong, nonatomic) IBOutlet UIWebView *webView;
@property (retain,nonatomic) GDataXMLElement *dataelem;
@property (retain,nonatomic) NSMutableArray *books;
@property (retain,nonatomic) NSMutableArray *sections;
@property (retain,nonatomic) NSMutableArray *chaps;
@property (retain,nonatomic) NSMutableArray *halachs;
@property (retain,nonatomic) NSMutableArray *pickerdata;
@property (retain,nonatomic) UINavigationBar *navbar;
@property (retain,nonatomic) NSMutableArray *mefsarray;
@property (retain,nonatomic) NSMutableArray *pasuksarray;
@property (retain,nonatomic) UIDatePicker *datePicker;
@property (retain,nonatomic) UIWebView *webViewMulti;
@property (retain,nonatomic) NSNumber *currentMef;
@property (retain,nonatomic) NSNumber *nid;
@property (retain,nonatomic) NSNumber *currentps;
@property (retain,nonatomic) NSNumber *startps;
@property (retain,nonatomic) NSNumber *range;
@property (retain,nonatomic) UIToolbar *toolbar;
@property (retain,nonatomic) GDataXMLDocument *doc;
@property (retain,nonatomic) GDataXMLDocument *doctoc;
@property (retain,nonatomic) NSMutableString *htmlstring;
@property (retain)UIDocumentInteractionController *documentController;
@property (nonatomic,strong) UITableView * lefttableView;
@property (retain,nonatomic) NSMutableArray *index;
@property (retain,nonatomic) NSNumber *lastindex;
@property (retain,nonatomic) NSMutableArray *indexinside;
@property (retain,nonatomic) NSArray *toc;
@property (retain,nonatomic) NSString *tocname;
@property (retain,nonatomic) NSDictionary *config;
@property (retain,nonatomic) NSNumber *indexDepth;
@property (retain,nonatomic) NSDictionary *jsonFile;
@property (retain,nonatomic) NSNumber *jsonLen;
@property (retain,nonatomic) NSArray *jsonHE;
@property (retain,nonatomic) NSArray *jsonEN;
@property (retain,nonatomic) NSArray *jsonSchema;
@property (retain,nonatomic) NSDictionary *jsonREF;
@property (retain,nonatomic) NSMutableArray *sectionsName;
@property (retain,nonatomic) NSArray *subindexarray;
@property (retain,nonatomic) NSMutableArray *history;
@property (retain,nonatomic) NSMutableArray *bookmarks;
@property (nonatomic, retain) NSNumber * is_bavli;
@property (nonatomic, retain) NSNumber * is_bavli_up;
@property (retain,nonatomic) NSMutableArray *cache;
@property (retain,nonatomic) NSMutableArray *jsonKeys;
@property (retain,nonatomic) NSMutableDictionary *emptycache;

@end

