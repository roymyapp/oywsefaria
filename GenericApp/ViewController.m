//
//  ViewController.m
//  GenericApp
//
//  Created by Royi Reshef on 5/26/15.
//  Copyright (c) 2015 Royi Reshef. All rights reserved.
//

#import "ViewController.h"
#import "MMDrawerController.h"
#import "MMDrawerBarButtonItem.h"
#import "MMSideDrawerTableViewCell.h"
#import <MMSideDrawerSectionHeaderView.h>
#import "ZipData.h"
#import "iToast.h"
#include "GAI.h"
#include "GAIDictionaryBuilder.h"


@interface ViewController ()

@end

@implementation ViewController

#define TAG_SEGMENTED_CONTORL              9995551
#define TAG_PICKER_PS                      9995552
#define TAG_PICKER_CHAP                    9995553
#define TAG_PICKER_SECTION                 9995554
#define TAG_PICKER_BOOK                    9995555
#define TAG_PICKER_DATE                    9995556
#define TAG_PICKER_DATE_BAR                9995557
#define TAG_POPUP_ABOUT                    9995558
#define TAG_SEGMENTED_CONTORL_INTER_LANG   9995559
#define TAG_SEGMENTED_CONTORL_INTER_ALLIGN 9995560
#define TAG_SEGMENTED_CONTORL_INTER_ARROW  9995561
#define TAG_DOWN_ARROW                     9995562
#define TAG_SEGMENTED_CONTORL_2            9995563
#define TAG_PICKER_LANG                    9995564
#define TAG_TOOLBAR                        9995565
#define TAG_PICKER_RANGE                   9995566
#define TAG_TOC                            9995567
#define TAG_HISTORY                        9995568
#define TAG_MERFARESH                      9995569
#define TAG_SETTINGS                       9995570
#define TAG_CELL_ICON                      9995571
#define TAG_BOOKMARKS                      9995572


#define TAG_FIRST_CELL                     9999000
#define TAG_CELL_MEFARES                   9999001
#define TAG_CELL_MEFARES_SPLIT             9999002
#define TAG_CELL_TOGGLE_NIGHT              9999003
#define TAG_CELL_INCREASE_FONT             9999004
#define TAG_CELL_DECREASE_FONT             9999005
#define TAG_CELL_DISABLE_GESTURES          9999006
#define TAG_CELL_PRINT                     9999007
#define TAG_CELL_NOTIFICATION              9999008
#define TAG_CELL_LANGUAGE                  9999009
#define TAG_CELL_OPEN_IN                   9999010
#define TAG_CELL_ABOUT                     9999011
#define TAG_CELL_ABOUT_SEFARIA             9999012
#define TAG_CELL_BACK                      9999013

#define TAG_LAST_CELL                      9999999







#define MAX_RANGE    20
#define MAX_HISTORY  20


- (UIView *)viewWithTagNotCountingSelf:(NSInteger)tag view:(UIView *)view
{
    UIView *toReturn = nil;
    
    for (UIView *subView in view.subviews) {
        toReturn = [subView viewWithTag:tag];
        
        if (toReturn) {
            break;
        }
    }
    return toReturn;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];
    cell.tag = 0;
    //_lefttableView.tintColor =  [UIColor blackColor];
    UIColor * unselectedColor = [UIColor
                                 colorWithRed:79.0/255.0
                                 green:93.0/255.0
                                 blue:102.0/255.0
                                 alpha:1.0];
    [cell.textLabel setTextColor:unselectedColor];
    UILabel *button = [[UILabel alloc] initWithFrame:CGRectMake(240.0, 5.0, 30, 30)];
    button.text = @"\uf054";
    button.backgroundColor = [UIColor clearColor];
    //button.tintColor = [UIColor blueColor];
    button.textColor = [UIColor grayColor];
    button.font = [UIFont fontWithName:@"FontAwesome" size:18];
    button.tag = TAG_CELL_ICON;
    id old = [self viewWithTagNotCountingSelf:TAG_CELL_ICON view:cell];
    [old removeFromSuperview];
    //cell.accessoryView = button;

    if (tableView.tag!=TAG_BOOKMARKS) {
        [cell.contentView addSubview:button];
    }
    UIButton* btn = [UIButton buttonWithType:UIButtonTypeRoundedRect];

    NSMutableArray *arr = [NSMutableArray alloc] ;
    NSInteger ind = indexPath.row;
    switch (tableView.tag) {
        case TAG_SETTINGS:
            if (0==ind) {
                [cell.textLabel setText:NSLocalizedString(@"back", @"")];
                button.text = @"\uf053";
                cell.tag = TAG_CELL_BACK;
                return cell;
            }
            if (1==ind) {
                if ([[NSUserDefaults standardUserDefaults] boolForKey:@"NightMode"]) {
                    [cell.textLabel setText:NSLocalizedString(@"day", @"")];
                    button.text = @"\uf185";
                }
                else {
                    [cell.textLabel setText:NSLocalizedString(@"night", @"")];
                    button.text = @"\uf186";
                }
                cell.tag = TAG_CELL_TOGGLE_NIGHT;
                return cell;
            }
            if (2==ind) {
                [cell.textLabel setText:NSLocalizedString(@"increase font", @"")];
                button.text = @"\uf065";
                cell.tag = TAG_CELL_INCREASE_FONT;
                return cell;
            }
            if (3==ind) {
                [cell.textLabel setText:NSLocalizedString(@"decrease font", @"")];
                button.text = @"\uf066";
                cell.tag = TAG_CELL_DECREASE_FONT;
                return cell;
            }
            if (4==ind) {
                NSString* lockgesture = NSLocalizedString(@"disable gestures", @"");
                NSString* lockimage = @"\uf023";
                if ([[NSUserDefaults standardUserDefaults] boolForKey:@"LockScreen"]) {
                    lockgesture = NSLocalizedString(@"enable gestures", @"");
                    lockimage = @"\uf09c";
                }

                [cell.textLabel setText:lockgesture];
                button.text = lockimage;
                cell.tag = TAG_CELL_DISABLE_GESTURES;
                return cell;
            }
            if (5==ind) {
                [cell.textLabel setText:NSLocalizedString(@"print page", @"")];
                button.text = @"\uf02f";
                cell.tag = TAG_CELL_PRINT;
                return cell;
            }
            if (6==ind) {
                [cell.textLabel setText:NSLocalizedString(@"open in", @"")];
                button.text = @"\uf0c7";
                cell.tag = TAG_CELL_OPEN_IN;
                return cell;
            }
            if (7==ind) {
                [cell.textLabel setText:NSLocalizedString(@"handle notifications", @"")];
                button.text = @"\uf0a2";
                cell.tag = TAG_CELL_NOTIFICATION;
                return cell;
            }
            if (8==ind) {
                [cell.textLabel setText:NSLocalizedString(@"change language", @"")];
                button.text = @"\uf1ab";
                cell.tag = TAG_CELL_LANGUAGE;
                return cell;
            }
            if (9==ind) {
                [cell.textLabel setText:NSLocalizedString(@"about", @"")];
                button.text = @"\uf129";
                cell.tag = TAG_CELL_ABOUT;
                return cell;
            }
            if (10==ind) {
                [cell.textLabel setText:NSLocalizedString(@"about sefaria short", @"")];
                button.text = @"\uf129";
                cell.tag = TAG_CELL_ABOUT_SEFARIA;
                return cell;
            }
            

        case TAG_TOC:
            switch (indexPath.section) {
                case 0:
                    switch (indexPath.row) {
                        case 0:
                            [cell.textLabel setText:NSLocalizedString(@"settings", @"")];
                            button.text = @"\uf013";
                            break;
                        case 1:
                            [cell.textLabel setText:NSLocalizedString(@"history", @"")];
                            button.text = @"\uf1da";
                            break;
                        case 2:
                            [cell.textLabel setText:NSLocalizedString(@"bookmarks", @"")];
                            button.text = @"\uf02e";
                            break;
                        case 3:
                            [cell.textLabel setText:NSLocalizedString(@"mefarshim", @"")];
                            button.text = @"\uf075";
                            cell.tag = TAG_CELL_MEFARES;
                            break;
                        case 4:
                            [cell.textLabel setText:NSLocalizedString(@"back", @"")];
                            button.text = @"\uf053";
                            break;
                        default:
                            break;
                    }
                    break;
                case 1:
                    if (_jsonLen) {
                        int l = (int)indexPath.row+1;
                        if (_is_bavli.boolValue) {
                            l = l + 2;
                        }
                        [cell.textLabel setText:[self getLocalizedindex:l]];
                        break;
                    }
                    [cell.textLabel setText:[[_toc objectAtIndex:indexPath.row] attributeForName:@"en"].stringValue];
                    if ([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"he"]) {
                        [cell.textLabel setText:[[_toc objectAtIndex:indexPath.row] attributeForName:@"n"].stringValue];
                    }
                    break;
            }
            break;
        case TAG_HISTORY:
            if (0==indexPath.row) {
                [cell.textLabel setText:NSLocalizedString(@"back", @"")];
                button.text = @"\uf053";
                cell.tag = TAG_CELL_BACK;
                [cell.contentView addSubview:button];
                break;
            }
            arr = [arr initWithArray:[_history objectAtIndex:indexPath.row-1] copyItems:YES];
            [arr removeLastObject];
            [cell.textLabel setText:[self getArrayName:arr]];
            break;
        case TAG_BOOKMARKS:
            if (0==indexPath.row) {
                [cell.textLabel setText:NSLocalizedString(@"back", @"")];
                cell.tag = TAG_CELL_BACK;
                button.text = @"\uf053";
                [cell.contentView addSubview:button];
                break;
            }
            btn.frame = CGRectMake(235.0f, 6.0f, 45.0f, 25.0f);
            btn.backgroundColor = [UIColor whiteColor];
            [btn setTitle:@"\uf00d" forState:UIControlStateNormal];
            btn.titleLabel.font = [UIFont fontWithName:@"FontAwesome" size:18];
            btn.tag = indexPath.row-1;
            [btn addTarget:self action:@selector(deleteBookmark:) forControlEvents:UIControlEventTouchUpInside];
            [cell.contentView addSubview:btn];
            arr = [arr initWithArray:[_bookmarks objectAtIndex:indexPath.row-1] copyItems:YES];
            [arr removeLastObject];
            [cell.textLabel setText:[self getArrayName:arr]];
            break;
        case TAG_MERFARESH:
            switch (indexPath.section) {
                case 0:
                    if (0==indexPath.row) {
                        [cell.textLabel setText:NSLocalizedString(@"back", @"")];
                        button.text = @"\uf053";
                        break;
                    }
                    if (1==indexPath.row) {
                        [cell.textLabel setText:NSLocalizedString(@"show all", @"")];
                        button.text = @"\uf06e";
                        break;
                    }
                    if (2==indexPath.row) {
                        [cell.textLabel setText:NSLocalizedString(@"hide all", @"")];
                        button.text = @"\uf070";
                        break;
                    }
                    if (3==indexPath.row) {
                        [cell.textLabel setText:NSLocalizedString(@"hide ref", @"")];
                        button.text = @"\uf070";
                        if ([[NSUserDefaults standardUserDefaults] boolForKey:@"mefref"]) {
                            [cell.textLabel setText:NSLocalizedString(@"show ref", @"")];
                            button.text = @"\uf06e";
                        }
                        break;
                    }
                case 1:
                    [cell.textLabel setText:[[_config[@"commentary_description"] objectAtIndex: ((NSNumber*)([_mefsarray objectAtIndex:indexPath.row])).intValue] objectAtIndex:0]];
                    if ([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"he"]) {
                        [cell.textLabel setText:[[_config[@"commentary_description"] objectAtIndex: ((NSNumber*)([_mefsarray objectAtIndex:indexPath.row])).intValue] objectAtIndex:1]];
                    }
                    button.text = @"\uf070";
                    if ([[NSUserDefaults standardUserDefaults] boolForKey:[[NSString alloc] initWithFormat: @"par%d",((NSNumber*)([_mefsarray objectAtIndex:indexPath.row])).intValue]]) {
                        button.text = @"\uf06e";
                    }
                    break;
            }
            break;
    
        default:
            [cell.textLabel setText:@"error"];
            break;
    }
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    id<GAITracker> tracker = [[GAI sharedInstance] defaultTracker];
    NSString* galabel = [self getArrayName:_index];
    int l = (int)indexPath.row;


    if (cell.tag > TAG_FIRST_CELL && cell.tag < TAG_LAST_CELL) {
        if (TAG_CELL_BACK == cell.tag) {
            tableView.tag = TAG_TOC;
            [tableView reloadData];
            return;
        }
        if (TAG_CELL_MEFARES == cell.tag) {
            tableView.tag = TAG_MERFARESH;
            [tableView reloadData];
            [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"menu" action:@"mefarshim" label:galabel                                                                              value:nil]build]];
            return;
        }
        if (TAG_CELL_MEFARES_SPLIT == cell.tag) {
            //tableView.tag = TAG_MERFARESH;
            [tableView reloadData];
            [self toggleSplit];
            [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"menu" action:@"split" label:galabel                                                                              value:nil]build]];
            [self.drawerController closeDrawerAnimated:YES completion:nil];
            return;
        }
        if (TAG_CELL_TOGGLE_NIGHT == cell.tag) {
            [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"menu" action:@"night" label:galabel                                                                              value:nil]build]];
            [self toogleNightView];
            [self.drawerController closeDrawerAnimated:YES completion:nil];
            return;
        }
        if (TAG_CELL_INCREASE_FONT == cell.tag) {
            [self increaseFont:self];
            [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"menu" action:@"increase" label:galabel                                                                              value:nil]build]];
            return;
        }
        if (TAG_CELL_DECREASE_FONT == cell.tag) {
            [self dereaseFont:self];
            [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"menu" action:@"decrease" label:galabel                                                                              value:nil]build]];
            return;
        }
        if (TAG_CELL_DISABLE_GESTURES == cell.tag) {
            [self toogleLock];
            [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"menu" action:@"lock" label:galabel                                                                              value:nil]build]];
            [self.drawerController closeDrawerAnimated:YES completion:nil];
            return;
        }
        if (TAG_CELL_PRINT == cell.tag) {
            [self printCont];
            [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"menu" action:@"print" label:galabel value:nil]build]];
            [self.drawerController closeDrawerAnimated:YES completion:nil];
            return;
        }
        if (TAG_CELL_OPEN_IN == cell.tag) {
            [self openIn];
            [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"menu" action:@"openin" label:galabel value:nil]build]];
            [self.drawerController closeDrawerAnimated:YES completion:nil];
            return;
        }
        if (TAG_CELL_NOTIFICATION == cell.tag) {
            [self chooseTime];
            [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"menu" action:@"notification" label:galabel                                                                              value:nil]build]];
            [self.drawerController closeDrawerAnimated:YES completion:nil];
            return;
        }
        if (TAG_CELL_LANGUAGE == cell.tag) {
            [ self changeLanguage];
            [self.drawerController closeDrawerAnimated:YES completion:nil];
            return;
        }
        if (TAG_CELL_ABOUT == cell.tag) {
            [self.drawerController closeDrawerAnimated:YES completion:nil];
            [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"menu" action:@"about" label:galabel                                                                              value:nil]build]];
            [ self showPopup:NSLocalizedString(@"about text",@"") animated:YES];
            return;
        }
        
        if (TAG_CELL_ABOUT_SEFARIA == cell.tag) {
            [ self showPopup:NSLocalizedString(@"about sefaria", @"") animated:YES];
            [tracker send:[[GAIDictionaryBuilder createEventWithCategory:@"menu" action:@"about sefaria" label:galabel                                                                              value:nil]build]];
            [self.drawerController closeDrawerAnimated:YES completion:nil];
            return;
        }
        NSLog(@"unknown cell tag");
        return;
        
        
    }
    int scrolly = 0;
    NSMutableArray* arr = nil;
    
    switch (tableView.tag) {
        case TAG_MERFARESH:
            switch (indexPath.section) {
                case 0:
                    if (indexPath.row==0) {
                        tableView.tag = TAG_TOC;
                        [tableView reloadData];
                        return;
                    }
                    if (indexPath.row==1) {
                        [self mefarshimToggle:NO];
                        [self.drawerController closeDrawerAnimated:YES completion:nil];
                        [self loadPage];
                        [tableView reloadData];
                        return;
                    }
                    if (indexPath.row==2) {
                        [self mefarshimToggle:YES];
                        [self.drawerController closeDrawerAnimated:YES completion:nil];
                        [self loadPage];
                        [tableView reloadData];
                        return;
                    }
                    if (indexPath.row==3) {
                        bool mefref = [[NSUserDefaults standardUserDefaults] boolForKey:@"mefref"];
                        [[NSUserDefaults standardUserDefaults] setBool:!mefref forKey:@"mefref"];
                        [self.drawerController closeDrawerAnimated:YES completion:nil];
                        [self loadPage];
                        [tableView reloadData];
                        return;
                    }
                    break;
                case 1:
                    [self mefareshToggle:[[NSString alloc] initWithFormat: @"%d",((NSNumber*)([_mefsarray objectAtIndex:indexPath.row])).intValue]];
                    [self loadPage];
                    [tableView reloadData];
                    return;
            }
            break;
        case TAG_TOC:
            switch (indexPath.section) {
                case 0:
                    switch (indexPath.row) {
                        case 0:
                            tableView.tag = TAG_SETTINGS;
                            [tableView reloadData];
                            return;
                            break;
                        case 1:
                            tableView.tag = TAG_HISTORY;
                            [tableView reloadData];
                            break;
                        case 2:
                            tableView.tag = TAG_BOOKMARKS;
                            [tableView reloadData];
                            break;
                        case 3: //back
                            [_index removeLastObject];
                            [self loadTOCMenu:NO];
                            return;
                        case 4: //back
                        [_index removeLastObject];
                        [self loadTOCMenu:NO];
                        return;
                    }
                    break;
                case 1:
                    if (_is_bavli.boolValue) {
                        l = l + 2;
                    }
                    [_index addObject:[[NSNumber alloc] initWithInt:l]];
                    [[NSUserDefaults standardUserDefaults] setInteger:0 forKey: @"currentScroll"];
                    [self loadTOCMenu:YES];
                    break;
                default:
                    break;
            }
            break;
        case TAG_HISTORY:
            if (indexPath.row==0) {
                tableView.tag = TAG_TOC;
                [tableView reloadData];
                return;
            }
            arr = [[NSMutableArray alloc] initWithArray:[_history objectAtIndex:indexPath.row-1] copyItems:YES];
            [_history removeObjectAtIndex:indexPath.row-1];
            scrolly = ((NSNumber*)[arr lastObject]).intValue;
            [arr removeLastObject];
            _index = arr;
            [[NSUserDefaults standardUserDefaults] setInteger:scrolly forKey: @"currentScroll"];
            [self loadTOCMenu:YES];
            break;
        case TAG_BOOKMARKS:
            if (indexPath.row==0) {
                tableView.tag = TAG_TOC;
                [tableView reloadData];
                return;
            }
            arr = [[NSMutableArray alloc] initWithArray:[_bookmarks objectAtIndex:indexPath.row-1] copyItems:YES];
            scrolly = ((NSNumber*)[arr lastObject]).intValue;
            [arr removeLastObject];
            _index = arr;
            [[NSUserDefaults standardUserDefaults] setInteger:scrolly forKey: @"currentScroll"];
            [self loadTOCMenu:YES];
            break;
    }
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    switch (tableView.tag) {
        case TAG_TOC:
        case TAG_MERFARESH:
            return 2;
            break;
        case TAG_HISTORY:
        case TAG_BOOKMARKS:
        case TAG_SETTINGS:
            return 1;
            break;
    }
    return 0;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    int i = 11;
    switch (tableView.tag) {
        case TAG_TOC:
            switch (section) {
                case 0:
                    i = 4;
                    if ([_index count]) {
                        i+=1;
                    }
                    return i;
                case 1:
                    if (_jsonLen) {
                        if (_is_bavli.boolValue) {
                            return _jsonLen.integerValue - 2;
                        }
                        return _jsonLen.integerValue;
                    }
                    return [_toc count];
                default:
                    return 0;
            }
            break;
        case TAG_HISTORY:
            return [_history count]+1;
            break;
        case TAG_BOOKMARKS:
            return [_bookmarks count]+1;
            break;
        case TAG_MERFARESH:
            switch (section) {
                case 0:
                    return 4;
                case 1:
                    return [_mefsarray count];
            }
            break;
        case TAG_SETTINGS:
            return i;
            break;
    }
    return 0;
}

-(UIView*)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    MMSideDrawerSectionHeaderView * headerView;
    headerView =  [[MMSideDrawerSectionHeaderView alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(tableView.bounds), 36.0)];
    [headerView setAutoresizingMask:UIViewAutoresizingFlexibleHeight|UIViewAutoresizingFlexibleWidth];
    switch (tableView.tag) {
        case TAG_TOC:
            switch (section) {
                case 0:
                    [headerView setTitle:@"navigation"];
                    break;
                case 1:
                    [headerView setTitle:_tocname];
                    break;
                    
                default:
                    break;
            }
            break;
        case TAG_HISTORY:
            [headerView setTitle:@"history"];
            break;
        case TAG_BOOKMARKS:
            [headerView setTitle:@"bookmarks"];
            break;
        case TAG_SETTINGS:
            [headerView setTitle:@"settings"];
            break;
    }
    return headerView;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 36.0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 40.0;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return 0.0;
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow: (NSInteger)row inComponent:(NSInteger)component {
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    long book = [[NSUserDefaults standardUserDefaults] integerForKey:@"book"];
    long section = [[NSUserDefaults standardUserDefaults] integerForKey:@"section"];
    long chap = [[NSUserDefaults standardUserDefaults] integerForKey:@"chap"];
    
    if (pickerView.tag==TAG_PICKER_LANG) {
        NSArray* lang = @[@"he",@"en",@"ru"];
        NSArray* country = @[@"IL",@"US",@"RU"];
        
        NSLog( @"OVERRIDING SYSTEM LOCALE WITH : %@_%@",[lang objectAtIndex:row], [country objectAtIndex:row] );
        [defaults setBool:YES forKey:@"NOveride"];
        [defaults setObject:[lang objectAtIndex:row] forKey:@"NLang"];
        [defaults setObject:[country objectAtIndex:row] forKey:@"NCountry"];
        [defaults synchronize];
        [[[[iToast makeText:NSLocalizedString(@"restart app", @"")]
           setGravity:iToastGravityCenter] setDuration:iToastDurationNormal] show];
        [pickerView setHidden:YES];
        return;
    }
    
    if (pickerView.tag==TAG_PICKER_CHAP) {
        NSLog(@"picker 0");
        int l = row;
        [pickerView setHidden:YES];
        if (chap==row) {
            return;
        }
        if (_is_bavli.boolValue) {
            l = l + 2;
        }
        //[_index removeLastObject];
        [_index addObject:[[NSNumber alloc] initWithInt:l]];
        [self loadTOCMenu:YES];
    }
    if (pickerView.tag==TAG_PICKER_SECTION) {
        NSLog(@"picker 1");
        if (section==row) {
            [pickerView setHidden:YES];
            return;
        }
        [defaults setInteger:row forKey: @"section"];
        [defaults setInteger:0 forKey: @"chap"];
    }
    if (pickerView.tag==TAG_PICKER_BOOK) {
        NSLog(@"picker 2");
        if (book==row) {
            [pickerView setHidden:YES];
            return;
        }
        [defaults setInteger:row forKey: @"book"];
        [defaults setInteger:0 forKey: @"section"];
        [defaults setInteger:0 forKey: @"chap"];
    }
    if (pickerView.tag==TAG_PICKER_PS) {
        NSLog(@"picker 4");
        [pickerView setHidden:YES];
        NSString *str = [[NSString alloc]initWithFormat:@"window.location.hash='aaa%ld';", (long)row];
        [_webView stringByEvaluatingJavaScriptFromString:str];
        [self updatePSwithnum:row];
        return;
    }
    [[NSUserDefaults standardUserDefaults] setInteger:0 forKey: @"currentScroll"];
    [defaults synchronize];
    [pickerView setHidden:YES];
    //[self LoadNew];
    //[pickerView removeFromSuperview];
    
    // Handle the selection
}

- (void)showPopup:(NSString *)message animated:(BOOL)animated
{
    UIView* popUpView =  [[UIView alloc] init];
    popUpView.frame = CGRectMake(10, 10, self.view.frame.size.width-20, self.view.frame.size.height-20
                                 );
    popUpView.backgroundColor=[[UIColor blackColor] colorWithAlphaComponent:.2];
    popUpView.layer.cornerRadius = 5;
    popUpView.layer.shadowOpacity = 0.8;
    popUpView.layer.shadowOffset = CGSizeMake(0.0f, 0.0f);
    [self.view addSubview:popUpView];
    UIView* innerpopUpView =  [[UIView alloc] init];
    innerpopUpView.frame = CGRectMake(10, 10, popUpView.frame.size.width-20, popUpView.frame.size.height-20
                                      );
    innerpopUpView.backgroundColor=[UIColor whiteColor];
    innerpopUpView.layer.cornerRadius = 5;
    innerpopUpView.layer.shadowOpacity = 0.8;
    innerpopUpView.layer.shadowOffset = CGSizeMake(0.0f, 0.0f);
    [popUpView addSubview:innerpopUpView];
    UIWebView* label = [[UIWebView alloc] initWithFrame:CGRectMake(10, 10, innerpopUpView.frame.size.width-30, innerpopUpView.frame.size.height-100)];
    NSString *path = [[NSBundle mainBundle] bundlePath];
    NSURL *baseUrl = [NSURL fileURLWithPath:path];
    label.scrollView.bounces = NO;
    label.scalesPageToFit = NO;
    NSMutableString* html = [[NSMutableString alloc] initWithFormat:@"<html><head></head><body><span style='font-size:22px'>%@</span></body></html>",message];
    [label loadHTMLString: html baseURL:baseUrl];
    [innerpopUpView addSubview:label];
    UILabel* closeLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, label.frame.size.height+10, label.frame.size.width, 80)];
    UITapGestureRecognizer *tapGesture = \
    [[UITapGestureRecognizer alloc]
     initWithTarget:self action:@selector(didTapLabelWithGesture:)];
    [closeLabel addGestureRecognizer:tapGesture];
    closeLabel.userInteractionEnabled = YES;
    [closeLabel setTextColor:[UIColor blueColor]];
    [closeLabel setBackgroundColor:[UIColor clearColor]];
    closeLabel.textAlignment = NSTextAlignmentCenter;
    closeLabel.text = NSLocalizedString(@"close", @"");
    closeLabel.font = [UIFont systemFontOfSize:25];
    
    [innerpopUpView addSubview:closeLabel];
    popUpView.tag = TAG_POPUP_ABOUT;
    if (animated) {
        popUpView.transform = CGAffineTransformMakeScale(1.3, 1.3);
        popUpView.alpha = 0;
        [UIView animateWithDuration:.5 animations:^{
            popUpView.alpha = 1;
            popUpView.transform = CGAffineTransformMakeScale(1, 1);
        }];
    }
}

-(void)deleteBookmark:(UIButton*)sender
{
    NSLog(@"%d", sender.tag);
    [_bookmarks removeObjectAtIndex:sender.tag];
    [[NSUserDefaults standardUserDefaults] setObject:_bookmarks forKey:@"bookmarks"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [[[[iToast makeText:NSLocalizedString(@"bookmark deleted", @"")]
       setGravity:iToastGravityCenter] setDuration:iToastDurationNormal] show];
    [_lefttableView reloadData];

}

- (void)didTapLabelWithGesture:(UITapGestureRecognizer *)tapGesture {
    UIView* view = [self viewWithTagNotCountingSelf:TAG_POPUP_ABOUT];
    [UIView animateWithDuration:.5 animations:^{
        view.transform = CGAffineTransformMakeScale(1.3, 1.3);
        view.alpha = 0.0;
    } completion:^(BOOL finished) {
        if (finished) {
            [view removeFromSuperview];
        }
    }];
    
    
    
}

- (void)loadTOCXML {
    NSString *nfilePath = [[NSString alloc] initWithFormat:@"toc"];
    GDataXMLDocument *doc = [ZipData loadData:nfilePath printError:YES];
    if (doc == nil) {
        return;
    }
    _doctoc = doc;
    nfilePath = [[NSString alloc] initWithFormat:@"main"];
    _config =  [ZipData loadJsonData: nfilePath printError:YES cache:_cache];
}

-(NSArray*) getJsonFinalItem: (NSArray *)array json:(NSArray *)json {
    NSArray* res = json;
    for(NSNumber *i in array) {
        if (!res || ![res isKindOfClass:[NSArray class]] || ([res count]<=i.intValue)){
            return (NSArray*)[NSNull null];
        }
        res = [res objectAtIndex:i.integerValue];
    }
    return res;
}

- (void)loadJSONTOCMenu:(NSArray *)array jsonId:(NSString*) jsonId updateHistory:(BOOL)updateHistory{
    NSString* nfilePath = [[NSString alloc] initWithFormat:@"j%@", jsonId];
    _jsonFile =  [ZipData loadJsonData: nfilePath printError:YES cache:_cache];
    nfilePath = [[NSString alloc] initWithFormat:@"r%@", jsonId];
    //NSDictionary* jsonRefFile = [ZipData loadJsonData: nfilePath printError:YES cache:_cache];
    _jsonHE = _jsonFile[@"he"];
    _jsonEN = _jsonFile[@"en"];
    _jsonREF = [ZipData loadJsonData: nfilePath printError:NO cache:_cache];
    _jsonLen = [[NSNumber alloc] initWithInteger:MAX([_jsonHE count], [_jsonEN count])];
    if ([[[_sectionsName objectAtIndex:0] objectAtIndex:0] isEqualToString:@"Daf"] && _is_bavli_up) {
        _is_bavli = [NSNumber numberWithBool: TRUE];
    }

    int x = 1;
    for(NSNumber *i in array) {
        x+=1;
        if (i.integerValue < [_jsonHE count]) {
            _jsonHE = [_jsonHE objectAtIndex:i.integerValue];
        }
        else {
            _jsonHE = @[];
        }

        if (i.integerValue < [_jsonEN count]) {
            _jsonEN = [_jsonEN objectAtIndex:i.integerValue];
        }
        else {
            _jsonEN = @[];
        }
        
        if (_jsonREF) {
            NSNumber* refnum = [NSNumber numberWithInt:i.intValue + 1];
            _jsonREF =[_jsonREF objectForKey:refnum.stringValue];
        }

        //_jsonLen = [[NSNumber alloc] initWithInteger:MAX([_jsonHE count], [_jsonEN count])];
    }
    if (x > _indexDepth.integerValue || ([[_sectionsName objectAtIndex:0] count] == 1)) {
        [self.drawerController closeDrawerAnimated:YES completion:nil];
        NSMutableArray* first = [[NSMutableArray alloc] initWithArray:_index copyItems:YES];
        [first addObject:[[NSNumber alloc] initWithInt:0]];
        if(updateHistory){
            [_history insertObject:first atIndex:0];
            if (_history.count > MAX_HISTORY) {
                [_history removeLastObject];
            }
            [[NSUserDefaults standardUserDefaults] setObject:_history forKey:@"history"];
            //[[NSUserDefaults standardUserDefaults] setInteger:0 forKey: @"currentScroll"];
        }
        [[NSUserDefaults standardUserDefaults] synchronize];
        
        if (x>1) {
            _lastindex = [_index lastObject];
        }
        else{
            _lastindex = nil;
        }
        [_index removeLastObject];
        [self loadPage];
        return;
    }
    if ([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"he"]) {
        _tocname = [[_sectionsName objectAtIndex:1] objectAtIndex:[array count]];
    }
    else {
        _tocname = [[_sectionsName objectAtIndex:0] objectAtIndex:[array count]];
    }
    [_lefttableView reloadData];

}

-(bool) shouldWritePasuk {
    NSArray* discard = @[@"Line", @"Comment" ,@"Paragraph", @""];
    for (NSString* item in [_sectionsName objectAtIndex:0]){
        for (NSString* d in discard){
            if ([item isEqualToString:d]){
                return FALSE;
            }
        }
    }
    return TRUE;
}

-(NSMutableString*)getArrayName: (NSMutableArray*) array {
    NSMutableString* res = [[NSMutableString alloc] init];
    BOOL he = [[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"he"];
    NSString* lng = @"en";
    int lng_index = 0;
    NSArray *toc =[_doctoc.rootElement elementsForName:@"node"];
    if (he) {
        lng = @"n";
        lng_index = 1;
    }
    NSMutableArray* sectionsName = nil;
    for(NSNumber *i in array) {
        if (sectionsName) {
            if ([sectionsName count]) {
                [res appendFormat:@"%@ %@-", [sectionsName objectAtIndex:0], [self getLocalizedindex:i.integerValue+1]];
                [sectionsName removeObjectAtIndex:0];
            }
        }
        else {
            if ([toc count]) {
                [res appendFormat:@"%@-", [[toc objectAtIndex:i.integerValue] attributeForName:lng].stringValue];
                if ([[toc objectAtIndex:i.integerValue] attributeForName:@"i"]) {
                    NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
                    [f setNumberStyle:NSNumberFormatterDecimalStyle];
                    sectionsName =  [[NSMutableArray alloc] initWithArray: [[_config[@"section_type"] objectAtIndex:[f numberFromString:[[_toc objectAtIndex:i.integerValue] attributeForName:@"d"].stringValue].integerValue] objectAtIndex:lng_index] copyItems:YES];
                }
            }
            else{
            [res appendFormat:@"%@-", [self getLocalizedindex:i.integerValue+1]];
            }
            toc = [[toc objectAtIndex:i.integerValue] elementsForName:@"node"];
        }
    }
    //delete final -
    if (res.length) {
        [res deleteCharactersInRange:NSMakeRange([res length]-1, 1)];
    }
    return res;
}

- (void)loadTOCMenu: (BOOL)updateHistory{
    _jsonLen = nil;
    _toc = [_doctoc.rootElement elementsForName:@"node"];
    _tocname = @"On Your Way";
    if ([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"he"]) {
        _tocname = @"ובלכתך בדרך";
    }
    _is_bavli = [NSNumber numberWithBool: FALSE];
    _is_bavli_up = [NSNumber numberWithBool: FALSE];
    int x = 0;
    for(NSNumber *i in _index) {
        x += 1;
        _tocname = [[_toc objectAtIndex:i.integerValue] attributeForName:@"en"].stringValue;
        if ([_tocname isEqualToString:@"Bavli"]) {
            _is_bavli_up = [NSNumber numberWithBool: TRUE];
        }
        if ([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"he"]) {
            _tocname = [[_toc objectAtIndex:i.integerValue] attributeForName:@"n"].stringValue;
        }
        if ([[_toc objectAtIndex:i.integerValue] attributeForName:@"x"]) {
            NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
            [f setNumberStyle:NSNumberFormatterDecimalStyle];
            _indexDepth = [f numberFromString:[[_toc objectAtIndex:i.integerValue] attributeForName:@"x"].stringValue];
        }
        if ([[_toc objectAtIndex:i.integerValue] attributeForName:@"i"]) {
            NSNumberFormatter *f = [[NSNumberFormatter alloc] init];
            [f setNumberStyle:NSNumberFormatterDecimalStyle];
            _sectionsName = [_config[@"section_type"] objectAtIndex:[f numberFromString:[[_toc objectAtIndex:i.integerValue] attributeForName:@"d"].stringValue].integerValue];
            _subindexarray = [_index subarrayWithRange:NSMakeRange(x, _index.count-x)];
            _nid = [f numberFromString:[[_toc objectAtIndex:i.integerValue] attributeForName:@"i"].stringValue];
            [self loadJSONTOCMenu: _subindexarray jsonId:[[_toc objectAtIndex:i.integerValue] attributeForName:@"i"].stringValue updateHistory: updateHistory];
            return;
        }
        
        _toc = [[_toc objectAtIndex:i.integerValue] elementsForName:@"node"];
    }
    [_lefttableView reloadData];
   
}

-(NSString*) toGimatria:(NSInteger) i {
    NSDictionary* gim = [[NSDictionary alloc] initWithObjects:@[@"י",@"כ",@"ל",@"מ",@"נ",@"ס",@"ע",@"פ",@"צ"] forKeys:@[@10,@20,@30,@40,@50,@60,@70,@80,@90]];
    NSDictionary* gimones = [[NSDictionary alloc] initWithObjects:@[@"א",@"ב",@"ג",@"ד",@"ה",@"ו",@"ז",@"ח",@"ט"] forKeys:@[@1,@2,@3,@4,@5,@6,@7,@8,@9]];
    NSMutableString* res = [[NSMutableString alloc]init];
    if (i>=5000) {
        [res appendString:@"ה׳"];
        i-=5000;
    }
    if (i>=4000) {
        [res appendString:@"ד׳"];
        i-=4000;
    }
    if (i>=3000) {
        [res appendString:@"ג׳"];
        i-=3000;
    }
    if (i>=2000) {
        [res appendString:@"ב׳"];
        i-=2000;
    }
    if (i>=1000) {
        [res appendString:@"א׳"];
        i-=1000;
    }
    while (i>=100) {
        if (i>=400) {
            [res appendString:@"ת"];
            i-=400;
        }
        else if (i>=300) {
            [res appendString:@"ש"];
            i-=300;
        }
        else if (i>=200) {
            [res appendString:@"ר"];
            i-=200;
        }
        else if (i>=100) {
            [res appendString:@"ק"];
            i-=100;
        }
    }
    long ones = i % 10;
    long tens = i - ones;
    if (tens) {
        [res appendString:[gim objectForKey:[NSNumber numberWithInteger:tens]]];
    }
    if (ones) {
        [res appendString:[gimones objectForKey:[NSNumber numberWithInteger:ones]]];
    }
    NSString* s = [res stringByReplacingOccurrencesOfString:@"יה" withString:@"טו"];
    s = [s stringByReplacingOccurrencesOfString:@"יו" withString:@"טז"];
    return s;
}

-(NSInteger) getGimatria:(NSString*) string
{
    NSDictionary* gim = [[NSDictionary alloc] initWithObjects:@[@1,@2,@3,@4,@5,@6,@7,@8,@9,@10,@20,@30,@40,@50,@60,@70,@80,@90,@100,@200,@300,@400] forKeys:@[@"א",@"ב",@"ג",@"ד",@"ה",@"ו",@"ז",@"ח",@"ט",@"י",@"כ",@"ל",@"מ",@"נ",@"ס",@"ע",@"פ",@"צ",@"ק",@"ר",@"ש",@"ת"]];
    NSInteger x = 0;
    for (int i=0; i<[string length]; i++) {
        unichar ch = [string characterAtIndex:i];
        x+= [[gim objectForKey:[NSString stringWithFormat: @"%C", ch]] integerValue];
    }
    return x;
}

- (NSString *) getLocalizedindex :(int) value {
    NSMutableString* res = [[NSMutableString alloc] init];
    bool is_amud_a = value%2==0;
    if (_is_bavli.boolValue) {
        value = (value+1)/2;
    }
    if ([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"he"]) {
        [res appendString: [self toGimatria:value]];
    }
    else {
        [res appendFormat:@"%d", value];
    }
    if (_is_bavli.boolValue) {
        if (is_amud_a) {
            [res appendString:@":"];
        }
        else {
            [res appendString:@"."];
        }
    }
    return res;
}


-(IBAction)toogleNightView{
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"NightMode"]) {
        [[NSUserDefaults standardUserDefaults]
         setObject:@"NO" forKey:@"NightMode"];
    } else {
        [[NSUserDefaults standardUserDefaults]
         setObject:@"YES" forKey:@"NightMode"];
    }
    
    [[NSUserDefaults standardUserDefaults] setInteger:
     [[_webView stringByEvaluatingJavaScriptFromString: @"scrollY"]
      intValue] forKey: @"currentScroll"];
    [self loadPage];
}

-(IBAction)toogleLock{
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"LockScreen"]) {
        [[NSUserDefaults standardUserDefaults]
         setObject:@"NO" forKey:@"LockScreen"];
    } else {
        [[NSUserDefaults standardUserDefaults]
         setObject:@"YES" forKey:@"LockScreen"];
    }
}

-(void) printCont{
    UIPrintInteractionController *pic = [UIPrintInteractionController sharedPrintController];
    //pic.delegate = self;
    UIPrintInfo *printInfo = [UIPrintInfo printInfo];
    printInfo.outputType = UIPrintInfoOutputGeneral;
    printInfo.orientation = UIPrintInfoOrientationPortrait;
    printInfo.jobName = @"OnYourWay";
    printInfo.duplex = UIPrintInfoDuplexLongEdge;
    pic.printInfo = printInfo;
    pic.showsPageRange = YES;
    
    pic.printFormatter = _webView.viewPrintFormatter;
    
    void (^completionHandler)(UIPrintInteractionController *, BOOL, NSError *) =
    ^(UIPrintInteractionController *printController, BOOL completed, NSError *error) {
        if (!completed && error) {
            NSLog(@"Printing could not complete because of error: %@", error);
        }
    };
    
    if (UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad) {
        [pic presentFromBarButtonItem:[[_navbar.items objectAtIndex:0] leftBarButtonItem] animated:YES
                    completionHandler:completionHandler];
    } else {
        [pic presentAnimated:YES completionHandler:completionHandler];
    }
}

-(void) openIn{
    long book = [[NSUserDefaults standardUserDefaults] integerForKey:@"book"];
    long section = [[NSUserDefaults standardUserDefaults] integerForKey:@"section"];
    long chap = [[NSUserDefaults standardUserDefaults] integerForKey:@"chap"];
    NSString* galabel = [[NSString alloc]initWithFormat:@"%@-%@-%@", [_books objectAtIndex:book], [_sections objectAtIndex:section], [_chaps objectAtIndex:chap]];
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains( NSDocumentDirectory,
                                                         NSUserDomainMask, YES);
    NSString *path = [paths objectAtIndex:0];
    NSString *lfile = [[NSString alloc] initWithFormat:@"%@.html", galabel];
    NSString *filePath = [path stringByAppendingPathComponent:lfile];
    [self.htmlstring writeToFile:filePath atomically:YES encoding:NSUTF8StringEncoding error:nil];
    self.documentController =
    [UIDocumentInteractionController
     interactionControllerWithURL:[NSURL fileURLWithPath:filePath]];
    self.documentController.delegate = self;
    self.documentController.UTI = @"public.html";
    [self.documentController presentOpenInMenuFromRect:CGRectZero
                                                inView:_webView
                                              animated:YES];
}

-(void)itemWasSelected : (id) item{
    NSLog(@"itemWasSelected");
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
    UIDatePicker* picker = (UIDatePicker*)[self viewWithTagNotCountingSelf:TAG_PICKER_DATE];
    UIView* view = [self viewWithTagNotCountingSelf:TAG_PICKER_DATE];
    [view removeFromSuperview];
    view = [self viewWithTagNotCountingSelf:TAG_PICKER_DATE_BAR];
    [view removeFromSuperview];
    UIUserNotificationSettings *currentUserNotificationSettings = [[UIApplication sharedApplication] currentUserNotificationSettings];
    // NSLog(@"%lu", currentUserNotificationSettings.types);
    if (!(currentUserNotificationSettings.types & UIUserNotificationTypeAlert)) {
        //no permissions
        NSLog(@"no permissions");
        [[[[iToast makeText:NSLocalizedString(@"notification setting", @"")]
           setGravity:iToastGravityCenter] setDuration:iToastDurationNormal] show];
        return;
    }
    NSDate* date =  picker.date;
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"MM-dd-yyy hh:mm"];
    //[formatter setTimeZone:[NSTimeZone timeZoneWithAbbreviation:@"IST"]];
    NSString *notifDate = [formatter stringFromDate:date];
    NSLog(@"%s: fire time = %@", __PRETTY_FUNCTION__, notifDate);
    UILocalNotification *localNotif = [[UILocalNotification alloc] init];
    if (localNotif == nil)
        return;
    //localNotif.timeZone = [NSTimeZone defaultTimeZone];
    // Notification details
    localNotif.alertBody = NSLocalizedString(@"notification body", @"");
    // Set the action button
    localNotif.alertAction = NSLocalizedString(@"show", @"");
    localNotif.fireDate = date;
    if ((currentUserNotificationSettings.types & UIUserNotificationTypeSound )) {
        localNotif.soundName = UILocalNotificationDefaultSoundName;
        NSLog(@"sound permission");
    }
    //localNotif.applicationIconBadgeNumber = 1;
    localNotif.repeatInterval = NSCalendarUnitDay;
    // Specify custom data for the notification
    NSDictionary *infoDict = [NSDictionary dictionaryWithObjectsAndKeys:@"rambam" ,@"data", nil];
    localNotif.userInfo = infoDict;
    [[[[iToast makeText:NSLocalizedString(@"notification create", @"")]
       setGravity:iToastGravityCenter] setDuration:iToastDurationNormal] show];
    
    // Schedule the notification
    [[UIApplication sharedApplication] scheduleLocalNotification:localNotif];
    
}

-(void)pickerCancel {
    NSLog(@"pickerCancel");
    UIView* view = [self viewWithTagNotCountingSelf:TAG_PICKER_DATE];
    [view removeFromSuperview];
    view = [self viewWithTagNotCountingSelf:TAG_PICKER_DATE_BAR];
    [view removeFromSuperview];
    [[UIApplication sharedApplication] cancelAllLocalNotifications];
    [[[[iToast makeText:NSLocalizedString(@"notification cancel", @"")]
       setGravity:iToastGravityCenter] setDuration:iToastDurationShort] show];
}


-(void) chooseTime{
    UIDatePicker* pickerView = [[UIDatePicker alloc] initWithFrame:CGRectMake(200, 200, 320, 400)];
    pickerView.center = _webView.center;
    [pickerView setDatePickerMode:UIDatePickerModeTime];
    //[pickerView setMinuteInterval:5];
    [pickerView setTag: TAG_PICKER_DATE];
    [pickerView setBackgroundColor:[UIColor whiteColor]];
    pickerView.layer.cornerRadius = 10;
    pickerView.layer.masksToBounds=YES;
    
    //[pickerView setDataSource: self];
    
    UIToolbar *toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(200, 400, 320, 44)];
    toolBar.center = _webView.center;
    CGRect newFrame = toolBar.frame;
    newFrame.origin.y = pickerView.frame.origin.y + pickerView.frame.size.height;
    [toolBar setTag: TAG_PICKER_DATE_BAR];
    [toolBar setFrame:newFrame];
    
    UIBarButtonItem *doneButton = [[UIBarButtonItem alloc] initWithTitle:@"\uf00c" style:UIBarButtonItemStyleBordered target:self action:@selector(itemWasSelected:)];
    [doneButton setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                        [UIFont fontWithName:@"FontAwesome" size:26.0], NSFontAttributeName, nil] forState:UIControlStateNormal];
    UIBarButtonItem *cancelButton = [[UIBarButtonItem alloc] initWithTitle:@"\uf014" style:UIBarButtonItemStyleBordered target:self action:@selector(pickerCancel)];
    [cancelButton setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                          [UIFont fontWithName:@"FontAwesome" size:26.0], NSFontAttributeName, nil] forState:UIControlStateNormal];
    UIBarButtonItem *flexible = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    [toolBar setItems:[NSArray arrayWithObjects:cancelButton, flexible, doneButton, nil]];
    
    [self.view addSubview:pickerView];
    [self.view addSubview:toolBar];
}


-(void)changeLanguage {
    UIPickerView *myPickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 800)];
    myPickerView.tag = TAG_PICKER_LANG;
    int row = 0;
    if (![[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"he"]) {
        row = 1;
    }
    _pickerdata = [[NSMutableArray alloc]initWithArray: @[@"עברית", @"English"]];
    myPickerView.delegate = self;
    myPickerView.showsSelectionIndicator = YES;
    [myPickerView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:myPickerView];
    [myPickerView selectRow:row inComponent:0 animated:NO];
    
}


- (void)increaseFont:(id)ignored
{
    long i = [[NSUserDefaults standardUserDefaults] integerForKey:@"fontsize"];
    float j = i;
    i = i + 30;
    if (i<1601) {
        [[NSUserDefaults standardUserDefaults] setInteger:i forKey: @"fontsize"];
        NSString *currentFont = [[NSString alloc] initWithFormat: @"document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust= '%f%%'", 100*i/j];
        
        [_webView stringByEvaluatingJavaScriptFromString:currentFont];
    }
    
}


- (void)dereaseFont:(id)ignored
{
    long i = [[NSUserDefaults standardUserDefaults] integerForKey:@"fontsize"];
    float j = i;
    i = i - 30;
    if (i>49) {
        [[NSUserDefaults standardUserDefaults] setInteger:i forKey: @"fontsize"];
        NSString *currentFont = [[NSString alloc] initWithFormat: @"document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust= '%f%%'", 100*i/j];
        
        [_webView stringByEvaluatingJavaScriptFromString:currentFont];
    }
}

-(void)mefareshToggle : (NSString*) mef{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    NSString *par = [[NSString alloc] initWithFormat: @"par%@",mef];
    BOOL is_hidden = [[NSUserDefaults standardUserDefaults] boolForKey:par];
    [defaults setBool:!is_hidden forKey:par];
    [defaults setBool:NO forKey:@"hideall"];
    [defaults synchronize];
}


-(void)mefarshimToggle : (BOOL) hide{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setBool:hide forKey:@"hideall"];
    for (int i=0; i<310; i++) {
        NSString *par = [[NSString alloc] initWithFormat: @"par%d",i];
        [defaults setBool:hide forKey:par];
    }
    
    [defaults synchronize];
}

-(void)toggleSplit {
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"Split"]) {
        [[NSUserDefaults standardUserDefaults] setBool:NO forKey:@"Split"];
        int x = 70;
        if (self.navbar.isHidden) {
            x = 0;
        }
        [_webViewMulti setHidden:YES];
        _webViewMulti = nil;
        [self viewDidLayoutSubviews];
    }
    else{
        [[NSUserDefaults standardUserDefaults] setBool:YES forKey:@"Split"];
        
    }
    [self loadPage];
}


-(NSMutableString*) arrayToString:(id) array{
    NSMutableString* res = [[NSMutableString alloc] initWithString:@""];
    if ([array isKindOfClass:[NSNumber class]]) {
        return (NSMutableString*) [NSNull null];
    }
    if ([array isKindOfClass:[NSNull class]]) {
        return (NSMutableString*) [NSNull null];
    }
    if (![array isKindOfClass:[NSString class]]) {
        for(id i in (NSArray*)array){
            [res appendFormat:@"%@<x/>", [self arrayToString:i]];
        }
    }
    else {
        [res appendFormat:@"%@<x/>", (NSString*) array];
    }
    return res;
}

-(NSMutableDictionary*) getRefDict:(NSArray*) arr {
    @try {
        NSMutableDictionary* res = [[NSMutableDictionary alloc] init];
        NSString* nfilePath = [[NSString alloc] initWithFormat:@"j%@", [arr objectAtIndex:0]];
        NSNumber* book_id = [arr objectAtIndex:0];
        NSDictionary* jsonRefFile = [ZipData loadJsonData: nfilePath printError:NO cache:_cache];
        NSArray* he = @[];
        NSArray* en = @[];
        NSArray* subindex = [arr objectAtIndex:1];
        NSMutableString* enname = [[NSMutableString alloc] initWithString: [_config[@"books_index"] objectForKey: book_id.stringValue]];
        NSMutableString* hename = [[NSMutableString alloc] initWithString: [_config[@"hebrew_index"] objectForKey: book_id.stringValue]];
        int sectionType = ((NSNumber*)[_config[@"books_section_type"] objectForKey: book_id.stringValue]).intValue;
        NSArray* sectionsNames = [_config[@"section_type"] objectAtIndex: sectionType];
        for (int i=0; i < MIN([[sectionsNames objectAtIndex:0] count], [subindex count]); i++) {
            [hename appendFormat:@" %@ %@", [[sectionsNames objectAtIndex:1] objectAtIndex:i], [self getLocalizedindex:((NSNumber*)[subindex objectAtIndex:i]).intValue]];
            [enname appendFormat:@" %@ %d", [[sectionsNames objectAtIndex:0] objectAtIndex:i], ((NSNumber*)[subindex objectAtIndex:i]).intValue];
            
        }
        if (!jsonRefFile) {
            return nil;
        }
        NSMutableArray* normArr = [[NSMutableArray alloc]init];
        for (NSNumber*n in [arr objectAtIndex:1]) {
            [normArr addObject:[[NSNumber alloc] initWithInt:n.intValue-1]];
        }
        if ([jsonRefFile[@"en"] count]){
            en = [self getJsonFinalItem:normArr json:jsonRefFile[@"en"]];
        }
        if ([jsonRefFile[@"he"] count]){
            he = [self getJsonFinalItem:normArr json:jsonRefFile[@"he"]];
        }
        [res setValue:he forKey:@"he"];
        [res setValue:en forKey:@"en"];
        [res setValue: enname forKey:@"enname"];
        [res setValue: hename forKey:@"hename"];
        jsonRefFile = nil;
        return res;
    }
    @catch (NSException *exception) {
        NSLog(@"get ref exception: %@ %@", exception, arr);
        return nil;
    }
}

- (void)loadPage {
    _loadingView.hidden = FALSE;
    if (_webView.tag==2) {
        return;
    }
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
    @try {
        _webView.tag = 2;
        long lang = [[NSUserDefaults standardUserDefaults] integerForKey:@"lang"];
        long linesmode = [[NSUserDefaults standardUserDefaults] integerForKey:@"linesmode"];
        BOOL hebrewright = [[NSUserDefaults standardUserDefaults] boolForKey:@"hebrewright"];
        bool multi = [[NSUserDefaults standardUserDefaults] boolForKey:@"Split"];
        bool shoulwriteps = [self shouldWritePasuk];
        bool mefref = [[NSUserDefaults standardUserDefaults] boolForKey:@"mefref"];

        _currentps = [NSNumber numberWithInt:0];
        _halachs = [[NSMutableArray alloc] init];
        NSString *filePath = [[NSBundle mainBundle] pathForResource:@"whiteb" ofType:@"txt"];
        NSMutableData *header = [NSMutableData dataWithContentsOfFile:filePath];
        NSMutableString* htmlString = [[NSMutableString alloc] initWithData:header encoding:NSASCIIStringEncoding];
        self.htmlstring = htmlString;
        if ([[NSUserDefaults standardUserDefaults] boolForKey:@"NightMode"]) {
            [htmlString appendFormat:@"* {background-color: #000000;color: #FFFF00;}\n "];
        }
        if (linesmode) {
            [htmlString appendFormat:@"x {display:block;}"];
        }
        else {
            [htmlString appendFormat:@"x {display: inline;}"];
        }
        [htmlString appendFormat:@".aaa {font-size: %ld%%;} b{font-weight:bold;}</style><body><div class=aaa>", (long)[[NSUserDefaults standardUserDefaults] integerForKey:@"fontsize"]];
        
        NSString* enstyle = @"style='display:none;'";
        NSString* hestyle = @"style='display: block-inline;'";
        NSString* psanchorstyle = @"style='display: block-inline;'";
        NSString* mefenstyle = enstyle;
        NSString* mefhestyle = hestyle;
        NSString* clearstyle = [NSString stringWithFormat:@"style='display: block;clear:both;'"];
        NSString* psstyle = @"style='left: auto;margin-top: 14px;'";
        NSString* pscontstyle = @"style='display: block;'";
        //NSString* fontsizestyle = [[NSString alloc] initWithFormat:@"font-size: %ld%%;", (long)[[NSUserDefaults standardUserDefaults] integerForKey:@"fontsize"]];
        if (lang==1) {
            if (hebrewright) {
                enstyle = @"style='width: 48%;text-align: left;float: left;direction:ltr;'";
                hestyle = @"style='display: block;width: 48%;text-align: right;float: right;margin-left: 0px;direction: rtl;'";
                psstyle = @"style='text-align: center;width: 2%;margin-left: -2%;left: 49%;display: absolute;margin-right: 4px;margin-top: -7px;font-size:75%;'";
                //psstyle = hestyle;
            }
            else {
                enstyle = @"style='width: 48%;float: right;text-align: left;margin-right: 0px;direction:ltr;'";
                hestyle = @"style='width: 48%;float: left;text-align: right;margin-left: 0px;display: block;direction: rtl'";
                psstyle = @"style='text-align: center;width: 2%;margin-left: -2%;left: 49%;display: absolute;margin-right: 4px;margin-top: -7px;font-size:75%;'";
                //pscontstyle = @"style='display: block;clear: both;margin-bottom: 24px;text-align: justify;'";
                
            }
            mefenstyle = enstyle;
            mefhestyle = hestyle;
            
            
        }
        else if (lang==0) {
            psanchorstyle = @"style='text-align: left;direction: ltr;'";
            enstyle = @"style='display:inline;direction: ltr;text-align: left;'";
            pscontstyle = @"style='display:block-inline;direction: ltr;'";
            mefenstyle = @"style='display:block;direction: ltr;text-align: left;'";
            //psstyle = @"style='left: auto;margin-top: 14px;direction: ltr;'";
            if (linesmode) {
                psanchorstyle = @"style='display:block;text-align: left;direction: ltr;'";
                pscontstyle = @"style='direction: ltr;';";
                
            }
        }
        else if (lang==2) {
            hestyle = @"style='display:inline;direction: rtl;text-align: right;'";
            pscontstyle = @"style='display:block-inline;direction: rtl;'";
            mefhestyle = @"style='display:block;direction: rtl;text-align: right;'";
            if (linesmode) {
                pscontstyle = @"style='direction: rtl;'";
                
            }
        }
       // NSString *bundlePath = [[NSBundle mainBundle] pathForResource:@"Localizable" ofType:@"strings" inDirectory:nil forLocalization:@"he"];
        //NSBundle *heBundle = [[NSBundle alloc] initWithPath:[bundlePath stringByDeletingLastPathComponent]];
        
        int missing_lines = 0;
        BOOL hideall = [[NSUserDefaults standardUserDefaults] boolForKey:@"hideall"];
        
        
        
        _pasuksarray = [[NSMutableArray alloc] init];
        /*
         long range = 1;
         if (_range && [_range intValue]>1&&[_range intValue]<MAX_RANGE) {
         range = [_range intValue];
         }
         */
        _mefsarray = [[NSMutableArray alloc] init];
        NSMutableArray *commentaries = [[NSMutableArray alloc] init];
        NSArray* comment_config = [_config[@"commentary"] objectForKey:_nid.stringValue];
        if(comment_config && linesmode){
            for(NSArray* a in comment_config) {
                [_mefsarray addObject:[a objectAtIndex:1]];
                NSString *par = [[NSString alloc] initWithFormat: @"par%d",((NSNumber*)[a objectAtIndex:1]).intValue];
                BOOL is_hidden = [[NSUserDefaults standardUserDefaults] boolForKey:par];
                NSArray* he = @[];
                NSArray* en = @[];
                if ((!is_hidden || hideall) && linesmode) {
                    NSString* nfilePath = [[NSString alloc] initWithFormat:@"j%@", [a objectAtIndex:0]];
                    NSDictionary* comjsonFile =  [ZipData loadJsonData: nfilePath printError:YES cache:_cache];
                    he = [self getJsonFinalItem:_subindexarray json:comjsonFile[@"he"]];
                    en = [self getJsonFinalItem:_subindexarray json:comjsonFile[@"en"]];

                }
                [commentaries addObject: @[he,en]];
            }
        }
        int pslen = MAX(_jsonHE.count, _jsonEN.count);
        NSMutableArray* arr = [[NSMutableArray alloc] initWithArray:[_history objectAtIndex:0] copyItems:YES];
        [arr removeLastObject];
        
        NSString* headstyle = @"style='display:block;text-align: left;direction: ltr;font-size: 70%%;'";
        if ([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"he"]) {
            headstyle = @"style='display:block;text-align: right;font-size: 70%%;'";
        }
        [htmlString appendFormat:@"<div class='ps' %@>%@</div>", headstyle ,[self getArrayName:arr]];
        NSArray* ref = nil;
        if ([_jsonREF isKindOfClass:[NSDictionary class]]) {
            ref = _jsonREF[@"0"];
            
        }
        else if ([_jsonREF isKindOfClass:[NSArray class]]) {
            ref = (NSArray*)_jsonREF;
            
        }

        NSString* hiddenmefbutstyle = [[NSString alloc] initWithFormat:@""];
        if (!lang) {
            hiddenmefbutstyle = enstyle;
        }
        if ((lang!=1 && !linesmode)) {
            hiddenmefbutstyle = @"style='display:none;'";
        }

        NSMutableString* refstr = [[NSMutableString alloc]init];
        int p = 0;
        if (ref && linesmode && !mefref) {
            NSString* hiddenrefbut = [[NSMutableString alloc] initWithFormat:@"<mefb style='color:grey;font-size:70%%;' onclick='$(\".mefrc00\").toggle();$(this).find(\"i\").toggleClass(\"fa-plus-square fa-minus-square\")'> <i class='fa fa-plus-square' %@></i></mefb></br>",hiddenmefbutstyle];
            refstr = [[NSMutableString alloc] initWithFormat:@"<span>"];
            if (lang==1) {
                [refstr appendFormat:@"<center>%@</center>",hiddenrefbut];
            }
            else{
                [refstr appendString:hiddenrefbut];
            }
            NSMutableSet* refset = [[NSMutableSet alloc] init];
            for(NSArray* r in ref) {
                NSMutableDictionary* refdict = [self getRefDict:r];
                if (refdict && ![refset containsObject:refdict[@"enname"]]) {
                    p=p+1;
                    NSString* enname = refdict[@"enname"];
                    NSString* hename = refdict[@"hename"];
                    [refset addObject:enname];
                    NSString* hecont = [self arrayToString:refdict[@"he"]];
                    NSString* encont = [self arrayToString:refdict[@"en"]];
                    [refstr appendFormat:@"<mef style='display:none;' class='mefrc00'>"];
                    //NSLog(@"%d", p);
                    if (lang && hecont && hecont != (NSString*)[NSNull null] && !([hecont isEqualToString:@""]) && !([hecont isEqualToString:@"<x/>"])) {
                        [refstr appendFormat:@"<span class='he d expander' %@>", mefhestyle];
                        [refstr appendFormat:@"<span style='color:grey;'>%@:</span> ", hename];
                        [refstr appendFormat:@"%@", hecont];
                        [refstr appendFormat:@"</span>"];
                        
                    }
                    if (lang<2 && encont && encont != (NSString*)[NSNull null] && !([encont isEqualToString:@""]) && !([encont isEqualToString:@"<x/>"])) {
                        [refstr appendFormat:@"<span class='en d expander' %@>", mefenstyle];
                        [refstr appendFormat:@"<span style='color:grey;'>%@:</span>", enname];
                        [refstr appendFormat:@"%@", encont];
                        [refstr appendFormat:@"</span>"];
                        
                    }
                    [refstr appendFormat:@"</mef>"];
                    if (lang==1) {
                        [refstr appendFormat:@"<div class='clear' %@></div>", clearstyle];
                    }
                    else{
                        [refstr appendFormat:@"<div class='clear' style='display:inline;'></div>"];
                        
                    }
                    
                }
            }
            [refstr appendFormat:@"</span>"];
            
        }
        if (p) {
            [htmlString appendString:refstr];
        }

        for (int i=0; i < pslen; i++) {
            NSMutableString* pasukstr = [[NSMutableString alloc]init];
            bool foundeng = NO;
            //TODO: max count
            id pasukhe = @"";
            id pasuken = @"";
            if (i < [_jsonHE count]) {
                pasukhe = [_jsonHE objectAtIndex:i];
                if (![pasukhe isKindOfClass:[NSString class]]) {
                    pasukhe = @"";
                }
            }
            if (i < [_jsonEN count]) {
                pasuken = [_jsonEN objectAtIndex:i];
                if (![pasuken isKindOfClass:[NSString class]]) {
                    pasuken = @"";
                }
            }
            unsigned long current_pas = i;
            NSString* hiddenmefbut = [[NSString alloc] initWithFormat:@"<mefb style='color:grey;font-size:70%%;' onclick='$(\".mefc%lu\").toggle();$(this).find(\"i\").toggleClass(\"fa-plus-square fa-minus-square\")'> <i class='fa fa-plus-square' %@></i></mefb>", current_pas,hiddenmefbutstyle];
            [pasukstr appendFormat:@"<a class='psanchor' %@ name='aaa%lu'/>", psanchorstyle ,current_pas];
            [_halachs addObject:[self getLocalizedindex:i+1]];
            [pasukstr appendFormat:@"<xyz><span class='pscont' %@>", pscontstyle];
            if (pslen > 1 && shoulwriteps) {
                if (0!=lang) {
                    [pasukstr appendFormat:@"<div class='ps' %@>%@</div>", psstyle, [self toGimatria:i+1]];
                    
                }
                else {
                    [pasukstr appendFormat:@"<div class='ps' %@>%d</div>", psstyle, i+1];
                }
            }
            //NSLog(@"%@", [nid integerValue]);
            
            /*NSString* cont = [nameNode.stringValue  stringByReplacingOccurrencesOfString:@"מתני'"
             withString:@"<b><span style='color:blue;'>מתני</span></b>"];*/
            NSMutableString* cont = [self arrayToString:pasukhe];
            if (lang) {
                [pasukstr appendFormat:@"<span class='he d' %@>%@</span>", hestyle, cont];
            }
            if (![pasuken isEqualToString:@""]) {
                foundeng = YES;
                [pasukstr appendFormat:@"<span class='en d' %@>%@</span>", enstyle, [self arrayToString:pasuken]];
            }
            else {
                [pasukstr appendFormat:@"<span class='en d' %@>-</span>", enstyle];
            }
            if (lang==1) {
                [pasukstr appendFormat:@"<div class='clear' %@></div>", clearstyle];
                
            }
            else{
                [pasukstr appendFormat:@"<div class='clear' style='display:inline;'></div>"];
                
            }

            //NSArray *pirushim = [pasuk elementsForName:@"t"];
            NSMutableString* mefstr = [[NSMutableString alloc]init];
            BOOL meffoundeng = NO;
            BOOL meffound = NO;
            
            //
            
            
            for(int c_index=0; c_index < [commentaries count]; c_index++) {
                if (c_index==0) {
                    NSLog(@"");
                }
                NSNumber* mefnum = [[comment_config objectAtIndex:c_index] objectAtIndex:1];
                NSString* enname = [[_config[@"commentary_description"] objectAtIndex:mefnum.intValue] objectAtIndex:0];
                NSString* hename = [[_config[@"commentary_description"] objectAtIndex:mefnum.intValue] objectAtIndex:1];
                NSString* hecont = nil;
                NSString* encont = nil;
                if([[commentaries objectAtIndex:c_index] objectAtIndex:0] != [NSNull null]){
                    if([[[commentaries objectAtIndex:c_index] objectAtIndex:0] count] > i) {
                        hecont = [self arrayToString:[[[commentaries objectAtIndex:c_index] objectAtIndex:0] objectAtIndex:i]];
                    }
                }
                if([[commentaries objectAtIndex:c_index] objectAtIndex:1] != [NSNull null]){
                    if([[[commentaries objectAtIndex:c_index] objectAtIndex:1] count] > i) {
                        encont = [self arrayToString:[[[commentaries objectAtIndex:c_index] objectAtIndex:1] objectAtIndex:i]];
                    }
                }
                
                [mefstr appendFormat:@"<mef style='"];
                if (hideall) {
                    [mefstr appendFormat:@" display:none; ' class='mefc%lu", current_pas];
                }
                [mefstr appendFormat:@"'>"];
                if (lang && hecont && hecont != (NSString*)[NSNull null] && !([hecont isEqualToString:@""]) && !([hecont isEqualToString:@"<x/>"])) {
                    [mefstr appendFormat:@"<span class='he d expander' %@>", mefhestyle];
                    [mefstr appendFormat:@"<span style='color:grey;'>%@:</span> ", hename];
                    [mefstr appendFormat:@"%@", hecont];
                    [mefstr appendFormat:@"</span>"];
                    meffound = YES;
                    
                }
                if (lang<2 && encont && encont != (NSString*)[NSNull null] && !([encont isEqualToString:@""]) && !([encont isEqualToString:@"<x/>"])) {
                    [mefstr appendFormat:@"<span class='en d expander' %@>", mefenstyle];
                    [mefstr appendFormat:@"<span style='color:grey;'>%@:</span>", enname];
                    [mefstr appendFormat:@"%@", encont];
                    foundeng = YES;
                    meffoundeng = YES;
                    [mefstr appendFormat:@"</span>"];
                    
                }
                [mefstr appendFormat:@"</mef>"];
                if (lang==1) {
                    [mefstr appendFormat:@"<div class='clear' %@></div>", clearstyle];
                    
                }
                else{
                    [mefstr appendFormat:@"<div class='clear' style='display:inline;'></div>"];
                    
                }
            }
            NSArray* ref = nil;
            if ([_jsonREF isKindOfClass:[NSDictionary class]]) {
                ref = _jsonREF[[[NSString alloc] initWithFormat:@"%d", i+1]];

            }
            if ([ref isKindOfClass:[NSDictionary class]]) {
                NSMutableArray* tmpa = [[NSMutableArray alloc] init];
                for (NSDictionary* key in (NSDictionary*)ref) {
                    [tmpa addObjectsFromArray:[(NSDictionary*)ref objectForKey:key]];
                }
                ref = tmpa;
            }
            NSMutableString* refstr = [[NSMutableString alloc]init];
            int p = 0;
            if (ref && linesmode && !mefref) {
                NSString* hiddenrefbut = [[NSMutableString alloc] initWithFormat:@"<mefb style='color:grey;font-size:70%%;' onclick='$(\".mefrc%lu\").toggle();$(this).find(\"i\").toggleClass(\"fa-plus-square fa-minus-square\")'> <i class='fa fa-plus-square' %@></i></mefb>", current_pas,hiddenmefbutstyle];
                refstr = [[NSMutableString alloc] initWithFormat:@"<span>"];
                if (hideall && [commentaries count]) {
                    refstr = [[NSMutableString alloc] initWithFormat:@"<span class='mefc%lu' style='display:none;'>", current_pas];
                }
                if (lang==1) {
                    [refstr appendFormat:@"<center>%@</center>",hiddenrefbut];
                }
                else{
                    [refstr appendString:hiddenrefbut];
                }
                NSMutableSet* refset = [[NSMutableSet alloc] init];
                for(NSArray* r in ref) {
                    NSMutableDictionary* refdict = [self getRefDict:r];
                    if (refdict && ![refset containsObject:refdict[@"enname"]]) {
                        p=p+1;
                        NSString* enname = refdict[@"enname"];
                        NSString* hename = refdict[@"hename"];
                        [refset addObject:enname];
                        NSString* hecont = [self arrayToString:refdict[@"he"]];
                        NSString* encont = [self arrayToString:refdict[@"en"]];
                        [refstr appendFormat:@"<mef style='display:none;' class='mefrc%lu'>", current_pas];
                        //NSLog(@"%d", p);
                        if (lang && hecont && hecont != (NSString*)[NSNull null] && !([hecont isEqualToString:@""]) && !([hecont isEqualToString:@"<x/>"])) {
                            [refstr appendFormat:@"<span class='he d expander' %@>", mefhestyle];
                            [refstr appendFormat:@"<span style='color:grey;'>%@:</span> ", hename];
                            [refstr appendFormat:@"%@", hecont];
                            [refstr appendFormat:@"</span>"];
                            
                        }
                        if (lang<2 && encont && encont != (NSString*)[NSNull null] && !([encont isEqualToString:@""]) && !([encont isEqualToString:@"<x/>"])) {
                            [refstr appendFormat:@"<span class='en d expander' %@>", mefenstyle];
                            [refstr appendFormat:@"<span style='color:grey;'>%@:</span>", enname];
                            [refstr appendFormat:@"%@", encont];
                            foundeng = YES;
                            [refstr appendFormat:@"</span>"];
                            
                        }
                        [refstr appendFormat:@"</mef>"];
                        if (lang==1) {
                            [refstr appendFormat:@"<div class='clear' %@></div>", clearstyle];
                        }
                        else{
                            [refstr appendFormat:@"<div class='clear' style='display:inline;'></div>"];
                            
                        }

                    }
                }
                [refstr appendFormat:@"</span>"];

            }
            
            if (hideall && !multi && lang==2&& meffound) {
                [pasukstr appendString:hiddenmefbut];
            }
            else if (hideall && !multi && lang==0&&meffoundeng) {
                [pasukstr appendString:hiddenmefbut];
            }
            //
            
            [pasukstr appendFormat:@"</span>"];
            if (lang==1) {
                [pasukstr appendFormat:@"<div class='clear' %@></div>", clearstyle];
            }
            
            
            if (hideall && !multi && lang==1&&(meffound||meffoundeng)) {
                [pasukstr appendFormat:@"<center>%@</center>",hiddenmefbut];
            }
            [pasukstr appendString:mefstr];
            if (p) {
                [pasukstr appendString:refstr];
            }
            [pasukstr appendFormat:@"</span></xyz> "];
            if (linesmode) {
                [pasukstr appendFormat:@"<br/>"];
            }
            if (0==lang && !foundeng) {
                missing_lines+=1;
            }
            else{
                if (lang==0 && missing_lines) {
                    [htmlString appendFormat:@"<div style='text-align:left;color:grey;direction: ltr;'>%d missing lines</div>\n", missing_lines];
                    missing_lines = 0;
                }
            }
            [htmlString appendFormat:@"%@", pasukstr];
        }
        [htmlString appendString:@"<br/><br/>"];
        [htmlString replaceOccurrencesOfString:@"</br>" withString:@"<br>" options:NSLiteralSearch range:NSMakeRange(0, htmlString.length)];
        NSString *path = [[NSBundle mainBundle] bundlePath];
        NSURL *baseUrl = [NSURL fileURLWithPath:path];
        [_webView loadHTMLString:htmlString baseURL:baseUrl];
        _htmlstring = htmlString;
        //NSLog(@"%@", htmlString);
    }
    @catch (NSException *exception) {
        NSLog(@"%@", exception.reason);
        _index = [[NSMutableArray alloc] initWithArray:@[]];
        [_history removeObjectAtIndex:0];
        [_history insertObject:_index atIndex:0];
        [self loadTOCMenu:NO];
    }
    });


}

- (void)swipeLeftActionWrapper:(UIPanGestureRecognizer*)sender
{
    if (sender.state != UIGestureRecognizerStateEnded) {
        NSLog(@"111");
        return;
    }
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"LockScreen"]) {
        return;
    }
    if ([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"he"]) {
        [self swipeRightAction:_webView];
        return;
    }
    [self swipeLeftAction:_webView];
    
}

- (void)swipeRightActionWrapper:(UIPanGestureRecognizer*)sender
{
    if (sender.state != UIGestureRecognizerStateEnded) {
        NSLog(@"222");
        return;
    }
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"LockScreen"]) {
        return;
    }
    if ([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"he"]) {
        [self swipeLeftAction:_webView];
        return;
    }
    
    [self swipeRightAction:_webView];
    
}

- (BOOL)gestureRecognizer:(UIGestureRecognizer *)gestureRecognizer shouldRecognizeSimultaneouslyWithGestureRecognizer:(UIGestureRecognizer *)otherGestureRecognizer {
    if (_webView.tag==2) {
        return NO;
    }
    return YES;
}


- (void)viewDidLoad {
    [super viewDidLoad];
    /*
    _toolbar = [[UIToolbar alloc] init];
    _toolbar.frame = CGRectMake(0,self.view.frame.size.height-50, self.view.frame.size.width, 50);
    UIBarButtonItem *button1 = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Chevruta", @"") style:UIBarButtonItemStyleBordered  target:self action:@selector(viewChevruta)];
    UIBarButtonItem *spacer = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    UIBarButtonItem *button2 = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Combined", @"") style:UIBarButtonItemStyleBordered  target:self action:@selector(viewCombined)];
    UIBarButtonItem *button3 = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Regular", @"") style:UIBarButtonItemStyleBordered  target:self action:@selector(viewReular)];
    [_toolbar setItems:[[NSArray alloc] initWithObjects:spacer,button1,spacer,button2,spacer,button3,spacer, nil]];
    [_toolbar setAutoresizingMask:UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleTopMargin];
    
    [self.view addSubview:_toolbar];
    [_toolbar setHidden:NO];
    _toolbar.tag = TAG_TOOLBAR;
     */
    //    return;
    _cache = [[NSMutableArray alloc] init];
    NSArray* arr =[[NSUserDefaults standardUserDefaults] arrayForKey:@"history"];
    _history = [[NSMutableArray alloc] init];
    for(NSArray* a in arr) {
        [_history addObject:[[NSMutableArray alloc] initWithArray:a]];
    }
    arr =[[NSUserDefaults standardUserDefaults] arrayForKey:@"bookmarks"];
    _bookmarks = [[NSMutableArray alloc] init];
    for(NSArray* a in arr) {
        [_bookmarks addObject:[[NSMutableArray alloc] initWithArray:a]];
    }
    _extnavbar = [[UINavigationBar alloc]initWithFrame:CGRectMake(0, 70, self.view.frame.size.width, 50)];
    
    UIViewController * leftDrawer = [[UIViewController alloc] init];
    UIViewController * center = [[UIViewController alloc] init];
    UIViewController * rightDrawer = [[UIViewController alloc] init];
    [self loadTOCXML];
    _webView=[[UIWebView alloc]initWithFrame:CGRectMake(0, 50, self.view.frame.size.width, self.view.frame.size.height)];
    _webView.scalesPageToFit = YES;
    _webView.delegate = self;
    _webView.scrollView.delegate = self;
    _webView.tag = 0;
    _index = [[NSMutableArray alloc] initWithArray:@[]];
    _navbar = [[UINavigationBar alloc]initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 50)];
    [center.view addSubview:_navbar];
    _extnavbar = [[UINavigationBar alloc]initWithFrame:CGRectMake(0, 70, self.view.frame.size.width, 50)];
    [center.view addSubview:_extnavbar];
    [_extnavbar setHidden:YES];
    [center.view addSubview:_navbar];
    MMDrawerBarButtonItem * leftDrawerButton = [[MMDrawerBarButtonItem alloc] initWithTarget:self action:@selector(leftDrawerButtonPress:)];
    UINavigationItem *navItem = [[UINavigationItem alloc] init];
    [navItem setLeftBarButtonItem:leftDrawerButton];
    [_navbar setItems:[NSArray arrayWithObject:navItem]];
    [center.navigationItem setLeftBarButtonItem:leftDrawerButton animated:YES];
    _indexDepth = [[NSNumber alloc] initWithInt:1];
    _drawerController = [[MMDrawerController alloc]
                         initWithCenterViewController:center
                         leftDrawerViewController:leftDrawer
                         rightDrawerViewController:rightDrawer];
    [self addChildViewController:_drawerController];
    [center.view addSubview:_webView];
    [self.view addSubview:_drawerController.view];

    _lefttableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStyleGrouped];
    [self.lefttableView setDelegate:self];
    [self.lefttableView setDataSource:self];
    [leftDrawer.view addSubview:self.lefttableView];
    [self.lefttableView setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
    _drawerController.openDrawerGestureModeMask = MMOpenDrawerGestureModeNone;
    _drawerController.centerHiddenInteractionMode = MMDrawerOpenCenterInteractionModeFull;
    //_drawerController.showsShadow = FALSE;
    _lefttableView.tag = TAG_TOC;
    //[_drawerController setMaximumLeftDrawerWidth:240];
    UISwipeGestureRecognizer *swipeRight = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeRightActionWrapper:)];
    swipeRight.direction = UISwipeGestureRecognizerDirectionRight;
    swipeRight.delegate = self;
    [_webView addGestureRecognizer:swipeRight];
    UISwipeGestureRecognizer *swipeLeft = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeLeftActionWrapper:)];
    swipeLeft.direction = UISwipeGestureRecognizerDirectionLeft;
    swipeLeft.delegate = self;
    [_webView addGestureRecognizer:swipeLeft];
    UITapGestureRecognizer *tap1 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(select1:)];
    tap1.numberOfTapsRequired = 2;
    tap1.delegate = self;
    [_webView addGestureRecognizer:tap1];
    UITapGestureRecognizer *tap2 = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(select2:)];
    tap2.numberOfTapsRequired = 1;
    tap2.delegate = self;
    [_webView addGestureRecognizer:tap2];
    UIPinchGestureRecognizer *twoFingerPinch = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(twoFingerPinch:)] ;
    twoFingerPinch.delegate = self;
    [_webView addGestureRecognizer:twoFingerPinch];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(saveState) name:UIApplicationDidEnterBackgroundNotification object:nil];
    _loadingView = [[UIView alloc]initWithFrame:CGRectMake(100, 300, 80, 80)];
    _loadingView.backgroundColor = [UIColor colorWithWhite:0. alpha:0.6];
    _loadingView.layer.cornerRadius = 5;
    _loadingView.center = _webView.center;
    
    UIActivityIndicatorView *activityView=[[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhiteLarge];
    activityView.center = CGPointMake(_loadingView.frame.size.width / 2.0, 35);
    [activityView startAnimating];
    activityView.tag = 100;
    [_loadingView addSubview:activityView];
    
    UILabel* lblLoading = [[UILabel alloc]initWithFrame:CGRectMake(0, 48, 80, 30)];
    lblLoading.text = @"Loading...";
    lblLoading.textColor = [UIColor whiteColor];
    lblLoading.font = [UIFont fontWithName:lblLoading.font.fontName size:15];
    lblLoading.textAlignment = NSTextAlignmentCenter;
    [_loadingView addSubview:lblLoading];
    
    [self.view addSubview:_loadingView];
    _loadingView.hidden = TRUE;
    //detect orientaion change
    [[UIDevice currentDevice] beginGeneratingDeviceOrientationNotifications];
    [[NSNotificationCenter defaultCenter]
     addObserver:self selector:@selector(orientationChanged:)
     name:UIDeviceOrientationDidChangeNotification
     object:[UIDevice currentDevice]];
    [self.view bringSubviewToFront:_toolbar];
    if ([_history count]) {
        NSMutableArray* arr = [[NSMutableArray alloc] initWithArray:[_history objectAtIndex:0] copyItems:YES];
        int scrolly = ((NSNumber*)[arr lastObject]).intValue;
        [arr removeLastObject];
        _index = arr;
        [[NSUserDefaults standardUserDefaults] setInteger:scrolly forKey: @"currentScroll"];
        [self loadTOCMenu:NO];
    }
    else {
        NSMutableString* html = [[NSMutableString alloc] initWithFormat:@"<html><head></head><body><span style='font-size:60px'>%@</span></body></html>",@" ^ press here to open TOC"];
        NSString *path = [[NSBundle mainBundle] bundlePath];
        NSURL *baseUrl = [NSURL fileURLWithPath:path];
        [_webView loadHTMLString: html baseURL:baseUrl];

        [self loadTOCMenu:NO];
    }
}

- (void)twoFingerPinch:(UIPinchGestureRecognizer *)recognizer
{
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"LockScreen"]) {
        return;
    }
    int i = (int)[[NSUserDefaults standardUserDefaults] integerForKey:@"fontsize"];
    i = i * recognizer.scale;
    if (i<50) {
        i=50;
    }
    if (i>1600) {
        i=1600;
    }
    NSString *currentFont = [[NSString alloc] initWithFormat: @"document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust= '%f%%'", 100*recognizer.scale];
    
    //    NSLog(@"m Pinch scale: %f", recognizer.scale);
    [_webView stringByEvaluatingJavaScriptFromString:currentFont];
    if(UIGestureRecognizerStateEnded == [recognizer state]){
        NSLog(@"Pinch scale: %f", recognizer.scale);
        [[NSUserDefaults standardUserDefaults] setInteger:i forKey: @"fontsize"];
        [[NSUserDefaults standardUserDefaults] synchronize];
        //[self loadPage];
    }
}


- (UIView *)viewWithTagNotCountingSelf:(NSInteger)tag
{
    UIView *toReturn = nil;
    
    for (UIView *subView in self.view.subviews) {
        toReturn = [subView viewWithTag:tag];
        
        if (toReturn) {
            break;
        }
    }
    return toReturn;
}

- (void) select1:(UILongPressGestureRecognizer *)sender {
    if (self.navbar.isHidden) {
        [self.navbar setHidden:NO];
        [_toolbar setHidden:NO];
        [self setNavigationBars];
        [self viewDidLayoutSubviews];
        return;
    }
    [self.navbar setHidden:YES];
    [_extnavbar setHidden:YES];
    [_toolbar setHidden:YES];
    [self viewDidLayoutSubviews];
    NSLog(@"select tap 2");
}

- (BOOL) prefersStatusBarHidden
{
    return self.navbar.isHidden;
}

- (void)viewDidLayoutSubviews {
    int x = 70;
    [[UIApplication sharedApplication] setStatusBarHidden:self.navbar.isHidden withAnimation:UIStatusBarAnimationSlide];
    if (self.navbar.isHidden) {
        x = 0;
    }
    else if (!_extnavbar.isHidden) {
        x+=50;
    }
    _webView.frame = CGRectMake(0, x, self.view.frame.size.width, self.view.frame.size.height-x);
    _navbar.frame = CGRectMake(0, 0, self.view.frame.size.width, 70);
    _extnavbar.frame = CGRectMake(0, 70, self.view.frame.size.width, 50);
    _toolbar.frame = CGRectMake(0,self.view.frame.size.height-50, self.view.frame.size.width, 50);
    
    if ([[NSUserDefaults standardUserDefaults] boolForKey:@"Split"] && [[NSUserDefaults standardUserDefaults] integerForKey:@"view"]==0){
        _webView.frame = CGRectMake(0, x, self.view.frame.size.width, self.view.frame.size.height/2);
        _webViewMulti.frame = CGRectMake(0, self.view.frame.size.height/2, self.view.frame.size.width, self.view.frame.size.height/2-50);
    }
}


- (void) select2:(UILongPressGestureRecognizer *)sender {
    NSArray* tags = @[@TAG_PICKER_DATE, @TAG_PICKER_DATE_BAR, @TAG_PICKER_PS, @TAG_PICKER_BOOK, @TAG_PICKER_CHAP, @TAG_PICKER_SECTION, @TAG_PICKER_LANG,@TAG_PICKER_RANGE];
    for (int i=0;i<[tags count]; i++) {
        UIView* view = nil;
        while((view = [self viewWithTagNotCountingSelf:[[tags objectAtIndex:i] integerValue]])) {
            if (view) {
                [view removeFromSuperview];
            }
        }
    }
    NSLog(@"select tap 1");
}

- (void) setBookmark:(id)sender{
    [_bookmarks addObject:[_history objectAtIndex:0]];
    [[NSUserDefaults standardUserDefaults] setObject:_bookmarks forKey:@"bookmarks"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    [[[[iToast makeText:NSLocalizedString(@"bookmark saved", @"")]
       setGravity:iToastGravityCenter] setDuration:iToastDurationNormal] show];
}


- (void) extNavBarSelected :(id)sender{
    if (_extnavbar.isHidden) {
        [_extnavbar setHidden:NO];
    }
    else {
        [_extnavbar setHidden:YES];
    }
    [self setNavigationBars];
    [self viewDidLayoutSubviews];
    
}

- (void) segmentedAction :(id)sender{
    NSLog(@"seg action");
    UISegmentedControl* segmentedControl = (UISegmentedControl *)sender;
    
    UIPickerView *myPickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 800)];
    long row = 0;
    for (int i=0; i<[_chaps count]; i++) {
    }
    
    if ([segmentedControl tag] == TAG_SEGMENTED_CONTORL) {
        if ([_jsonHE count] && [self shouldWritePasuk] && segmentedControl.selectedSegmentIndex == 0) {
            NSLog(@"seg action 0");
            myPickerView.tag = TAG_PICKER_PS;
            _pickerdata=_halachs;
            row = _currentps.intValue;

        }
        
        else {
            row = 0;
            NSLog(@"seg action 1");
            myPickerView.tag = TAG_PICKER_CHAP;
            NSMutableArray* arr = [[NSMutableArray alloc] init];
            for (int i=1; i<=_jsonLen.intValue; i++) {
                int l = i;
                if (_is_bavli.boolValue) {
                    l = l + 2;
                }
                [arr addObject:[self getLocalizedindex:l]];
            }
            _pickerdata = arr;
            row = _lastindex.intValue;
        }
        
    }
    myPickerView.delegate = self;
    myPickerView.showsSelectionIndicator = YES;
    [myPickerView setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:myPickerView];
    [myPickerView selectRow:row inComponent:0 animated:NO];
}


- (void) setNavigationBars {
    long view = [[NSUserDefaults standardUserDefaults] integerForKey:@"view"];
    long lang = [[NSUserDefaults standardUserDefaults] integerForKey:@"lang"];
    long linesmode = [[NSUserDefaults standardUserDefaults] integerForKey:@"linesmode"];
    BOOL hebrewright = [[NSUserDefaults standardUserDefaults] boolForKey:@"hebrewright"];
    
    // init main segmented control
    UISegmentedControl* segmentedControl = [[UISegmentedControl alloc] initWithItems:[NSArray array]];
    [segmentedControl setMomentary:YES];
    //    UIBarButtonItem * left = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"listing1.png"] style:UIBarButtonItemStyleDone target:self action:@selector(menuSelected:)];
    
    // init extended css bar
    int ind = 0;
    [segmentedControl setTag:TAG_SEGMENTED_CONTORL];
    if ([_jsonHE count] && [self shouldWritePasuk]) {
        [segmentedControl insertSegmentWithTitle:[self getLocalizedindex:1] atIndex:ind animated:NO];
        [segmentedControl setWidth:30.0 forSegmentAtIndex:0];
        ind+=1;
    }
    if (_jsonLen && [_jsonLen intValue]>1 && _lastindex) {
        [segmentedControl insertSegmentWithTitle:[self getLocalizedindex:[_lastindex intValue]+1] atIndex:ind animated:NO];
        [segmentedControl setWidth:30.0 forSegmentAtIndex:ind];
    }
    [segmentedControl addTarget:self action:@selector(segmentedAction:) forControlEvents:UIControlEventValueChanged];
    UIBarButtonItem * segmentBarItem = [[UIBarButtonItem alloc] initWithCustomView: segmentedControl];
    UISegmentedControl* segmentedControl1 = [[UISegmentedControl alloc] initWithItems:[NSArray array]];
    [segmentedControl1 setMomentary:YES];
    [segmentedControl1 setTag:TAG_SEGMENTED_CONTORL_INTER_LANG];
    [segmentedControl1 insertSegmentWithTitle:@"A" atIndex:0 animated:NO];
    [segmentedControl1 insertSegmentWithTitle:@"Aא" atIndex:1 animated:NO];
    [segmentedControl1 insertSegmentWithTitle:@"א" atIndex:2 animated:NO];
    [segmentedControl1 setWidth:30.0 forSegmentAtIndex:0];
    [segmentedControl1 setWidth:30.0 forSegmentAtIndex:1];
    [segmentedControl1 setWidth:30.0 forSegmentAtIndex:2];
    [[segmentedControl1.subviews objectAtIndex:lang] setBackgroundColor:[UIColor lightGrayColor]];
    
    UISegmentedControl* segmentedControl2 = [[UISegmentedControl alloc] initWithItems:[NSArray array]];
    segmentedControl2 = [[UISegmentedControl alloc] initWithItems:[NSArray array]];
    [segmentedControl2 setMomentary:YES];
    [segmentedControl2 setTag:TAG_SEGMENTED_CONTORL_INTER_ALLIGN];
    if (lang != 1 || view !=2) {
        [segmentedControl2 insertSegmentWithTitle:@"\uf039" atIndex:0 animated:NO];
        [segmentedControl2 insertSegmentWithTitle:@"\uf038" atIndex:1 animated:NO];
        [segmentedControl2 setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                   [UIFont fontWithName:@"FontAwesome" size:24.0], NSFontAttributeName, nil] forState:UIControlStateNormal];
        [[segmentedControl2.subviews objectAtIndex:linesmode] setBackgroundColor:[UIColor lightGrayColor]];
        [segmentedControl2 addTarget:self action:@selector(segmentedLineModeAction:) forControlEvents:UIControlEventValueChanged];
    }
    else {
        [segmentedControl2 insertSegmentWithTitle:@"\uf038\uf036" atIndex:0 animated:NO];
        [segmentedControl2 insertSegmentWithTitle:@"\uf036\uf038" atIndex:1 animated:NO];
        [segmentedControl2 setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                                   [UIFont fontWithName:@"FontAwesome" size:14.0], NSFontAttributeName, nil] forState:UIControlStateNormal];
        [[segmentedControl2.subviews objectAtIndex:hebrewright] setBackgroundColor:[UIColor lightGrayColor]];
        [segmentedControl2 addTarget:self action:@selector(segmentedALingModeAction:) forControlEvents:UIControlEventValueChanged];
    }
    
    // init LR arrows
    UISegmentedControl* segmentedControl3 = [[UISegmentedControl alloc] initWithItems:[NSArray array]];
    segmentedControl3 = [[UISegmentedControl alloc] initWithItems:[NSArray array]];
    [segmentedControl3 setMomentary:YES];
    [segmentedControl3 setTag:TAG_SEGMENTED_CONTORL_INTER_ARROW];
    [segmentedControl3 insertSegmentWithTitle:@"\uf0D9" atIndex:0 animated:NO];
    [segmentedControl3 insertSegmentWithTitle:@"\uf0DA" atIndex:1 animated:NO];
    [segmentedControl3 setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                               [UIFont fontWithName:@"FontAwesome" size:24.0], NSFontAttributeName, nil] forState:UIControlStateNormal];
    
    [segmentedControl3 setWidth:40.0 forSegmentAtIndex:0];
    [segmentedControl3 setWidth:40.0 forSegmentAtIndex:1];
    [segmentedControl1 addTarget:self action:@selector(segmentedLangAction:) forControlEvents:UIControlEventValueChanged];
    [segmentedControl3 addTarget:self action:@selector(segmentedArrowAction:) forControlEvents:UIControlEventValueChanged];
    UIBarButtonItem * segmentBarItem1 = [[UIBarButtonItem alloc] initWithCustomView: segmentedControl1];
    UIBarButtonItem * segmentBarItem2 = [[UIBarButtonItem alloc] initWithCustomView: segmentedControl2];
    UIBarButtonItem * segmentBarItem3 = [[UIBarButtonItem alloc] initWithCustomView: segmentedControl3];
    
    
    UIBarButtonItem * left = [[UIBarButtonItem alloc] initWithTitle:@"\uf03a " style:UIBarButtonItemStylePlain target:self action:@selector(leftDrawerButtonPress:)];
    [left setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                  [UIFont fontWithName:@"FontAwesome" size:24.0], NSFontAttributeName, nil] forState:UIControlStateNormal];
    NSString* arrowstr = @"\uf150";
    if (!_extnavbar.isHidden) {
        arrowstr = @"\uf151";
    }
    UIBarButtonItem * arrow = [[UIBarButtonItem alloc] initWithTitle:arrowstr style:UIBarButtonItemStylePlain target:self action:@selector(extNavBarSelected:)];
    arrow.tag = TAG_DOWN_ARROW;
    [arrow setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                   [UIFont fontWithName:@"FontAwesome" size:24.0], NSFontAttributeName, nil] forState:UIControlStateNormal];
    UIBarButtonItem * bookmark = [[UIBarButtonItem alloc] initWithTitle:@"\uf005" style:UIBarButtonItemStylePlain target:self action:@selector(setBookmark:)];
    bookmark.tag = TAG_BOOKMARKS;
    [bookmark setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:
                                   [UIFont fontWithName:@"FontAwesome" size:24.0], NSFontAttributeName, nil] forState:UIControlStateNormal];
    UINavigationItem *navItem = [[UINavigationItem alloc] init];
    
    if (self.view.frame.size.width<700) {
        [navItem setRightBarButtonItem:segmentBarItem];
        [navItem setLeftBarButtonItems:[NSArray arrayWithObjects:left, arrow, bookmark, nil]];
        //[navItem setLeftBarButtonItem:[[UIBarButtonItem alloc] initWithCustomView:toolbar]];
        [_navbar setItems:[NSArray arrayWithObject:navItem]];
        
        
        
        navItem = [[UINavigationItem alloc] init];
        [navItem setRightBarButtonItems:[NSArray arrayWithObjects:segmentBarItem1, segmentBarItem2, nil]];
        [navItem setLeftBarButtonItems:[NSArray arrayWithObjects:segmentBarItem3, nil]];
        [_extnavbar setItems:[NSArray arrayWithObjects:navItem,nil]];
        
    }
    else {
        UIFont *font = [UIFont boldSystemFontOfSize:18.0f];
        NSDictionary *attributes = [NSDictionary dictionaryWithObject:font
                                                               forKey:NSFontAttributeName];
        [segmentedControl setTitleTextAttributes:attributes
                                        forState:UIControlStateNormal];
        [_extnavbar setHidden:YES];
        [navItem setRightBarButtonItems:[NSArray arrayWithObjects:segmentBarItem, segmentBarItem1, segmentBarItem2, nil]];
        [navItem setLeftBarButtonItems:[NSArray arrayWithObjects:left, bookmark, segmentBarItem3, nil]];
        [_navbar setItems:[NSArray arrayWithObject:navItem]];
        
    }
    
}

- (void)swipeRightAction:(id)ignored
{
    if (!_lastindex) {
        return;
    }
    [[NSUserDefaults standardUserDefaults] setInteger:0 forKey: @"currentScroll"];
    int i = [_lastindex intValue];
    if (i==0) {
        return;
    }
    NSMutableArray* arr = [[NSMutableArray alloc] initWithArray:[_history objectAtIndex:0] copyItems:YES];
    [arr removeLastObject];
    [arr removeLastObject];
    _index = arr;
    [_index addObject:[[NSNumber alloc] initWithInt:i-1]];
    [_history removeObjectAtIndex:0];
    [self loadTOCMenu:YES];
}


- (void)swipeLeftAction:(id)ignored
{
    if (!_lastindex) {
        return;
    }
    [[NSUserDefaults standardUserDefaults] setInteger:0 forKey: @"currentScroll"];
    int i = [_lastindex intValue];
    if (i>=[_jsonLen intValue]-1) {
        return;
    }
    NSMutableArray* arr = [[NSMutableArray alloc] initWithArray:[_history objectAtIndex:0] copyItems:YES];
    [arr removeLastObject];
    [arr removeLastObject];
    _index = arr;
    [_index addObject:[[NSNumber alloc] initWithInt:i+1]];
    [_history removeObjectAtIndex:0];
    [self loadTOCMenu:YES];
}

- (void) segmentedArrowAction :(id)sender{
    UISegmentedControl* segmentedControl = (UISegmentedControl *)sender;
    if (segmentedControl.selectedSegmentIndex) {
        if ([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"he"]) {
            [self swipeRightAction:sender];
        }
        else
        {
            [self swipeLeftAction:sender];
        }
    }
    else{
        if ([[[NSLocale preferredLanguages] objectAtIndex:0] isEqualToString:@"he"]) {
            [self swipeLeftAction:sender];
        }
        else{
            [self swipeRightAction:sender];
        }
    }
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView
                  willDecelerate:(BOOL)decelerate
{
    if (!decelerate) {
        [self saveState];
        
    }
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self saveState];
    
}

-(void)updatePSwithnum:(NSInteger) ps
{
    if (![self shouldWritePasuk]) {
        return;
    }
    if (ps >= [_halachs count]) {
        ps = [_halachs count] - 1;
    }
    if ([_currentps integerValue] == ps) {
        return;
    }
    bool multi = [[NSUserDefaults standardUserDefaults] boolForKey:@"Split"];
    if (multi) {
        NSString *str = [[NSString alloc]initWithFormat:@"window.location.hash='aaa%ld';", (long)ps];
        [_webViewMulti stringByEvaluatingJavaScriptFromString:str];
        return;
    }
    _currentps = [NSNumber numberWithInt:(int)ps];
    UISegmentedControl* segmentedControl = (UISegmentedControl*)[self viewWithTagNotCountingSelf:TAG_SEGMENTED_CONTORL];
    [segmentedControl setTitle:[_halachs objectAtIndex:ps] forSegmentAtIndex:0];
}


- (void)saveState {
    if (_webView.tag == 2) {
        NSLog(@"save state not active");
        return;
    }
    //NSLog(@"state saved");
    int scrolly = [[_webView stringByEvaluatingJavaScriptFromString: @"scrollY"]
                   intValue];
    [[NSUserDefaults standardUserDefaults] setInteger: scrolly
      forKey: @"currentScroll"];
    [[_history objectAtIndex:0] removeLastObject];
    [[_history objectAtIndex:0] addObject:[[NSNumber alloc] initWithInt:scrolly]];
    [[NSUserDefaults standardUserDefaults] setObject:_history forKey:@"history"];
    [[NSUserDefaults standardUserDefaults] synchronize];
    if ([self.navigationController respondsToSelector:@selector(interactivePopGestureRecognizer)]) {
        self.navigationController.interactivePopGestureRecognizer.enabled = NO;
    }
    NSString* off = [_webView stringByEvaluatingJavaScriptFromString: [NSString stringWithFormat:@"i=$('.psanchor').size()-1;$.each($('.psanchor'), function(index, value){if($('[name*=\"aaa'+index+'\"]').offset().top>scrollY){i=index-1;if(i<0){i=0;};return false;}});i;"]];
          NSLog(@"%ld", (long)[off integerValue]);
    [self updatePSwithnum:[off integerValue]];

}

- (void)webViewDidFinishLoad:(UIWebView *)iwebView {
    if (iwebView.isLoading)
        return;
    [self setNavigationBars];
    _loadingView.hidden = TRUE;
    iwebView.tag = 0;
    long startps = [[NSUserDefaults standardUserDefaults] integerForKey:@"ps"];
    NSString *str = [[NSString alloc]initWithFormat:@"init(%d);", _nid.intValue];
    [_webView stringByEvaluatingJavaScriptFromString:str];
    if (startps) {
        str = [[NSString alloc]initWithFormat:@"window.location.hash='aaa%ld';", (long)startps];
        [_webView stringByEvaluatingJavaScriptFromString:str];
        [[NSUserDefaults standardUserDefaults] setInteger:0 forKey: @"ps"];
        return;
    }
    
    NSLog(@"location %ld",(long)[[NSUserDefaults standardUserDefaults] integerForKey:@"currentScroll"]);
    if ([[NSUserDefaults standardUserDefaults] integerForKey:@"currentScroll"] != 0) {
        NSLog(@"location %ld",(long)[[NSUserDefaults standardUserDefaults] integerForKey:@"currentScroll"]);
        [_webView stringByEvaluatingJavaScriptFromString:
         [NSString stringWithFormat: @"setTimeout(function (){window.scrollTo(0, %ld);}, 10)",
          (long)[[NSUserDefaults standardUserDefaults] integerForKey:@"currentScroll"]]];
        [[NSUserDefaults standardUserDefaults] setInteger:0 forKey: @"currentScroll"];
    }
}

- (void) segmentedALingModeAction :(id)sender{
    UISegmentedControl* segmentedControl = (UISegmentedControl *)sender;
    BOOL hebrewright = [[NSUserDefaults standardUserDefaults] boolForKey:@"hebrewright"];
    if (hebrewright == segmentedControl.selectedSegmentIndex) {
        return;
    }
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:segmentedControl.selectedSegmentIndex forKey: @"hebrewright"];
    [defaults synchronize];
    [self saveState];
    [self loadPage];
}


- (void) segmentedLineModeAction :(id)sender{
    UISegmentedControl* segmentedControl = (UISegmentedControl *)sender;
    long linesmode = [[NSUserDefaults standardUserDefaults] integerForKey:@"linesmode"];
    if (linesmode == segmentedControl.selectedSegmentIndex) {
        return;
    }
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:segmentedControl.selectedSegmentIndex forKey: @"linesmode"];
    [[NSUserDefaults standardUserDefaults] setInteger: 0 forKey: @"currentScroll"];
    [defaults synchronize];
    [self loadPage];
}

- (void) segmentedLangAction :(id)sender{
    UISegmentedControl* segmentedControl = (UISegmentedControl *)sender;
    long lang = [[NSUserDefaults standardUserDefaults] integerForKey:@"lang"];
    if (lang == segmentedControl.selectedSegmentIndex) {
        return;
    }
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setInteger:segmentedControl.selectedSegmentIndex forKey: @"lang"];
    //[self saveState];
    [[NSUserDefaults standardUserDefaults] setInteger: 0 forKey: @"currentScroll"];
    [defaults synchronize];
    [self loadPage];
}

- (void) orientationChanged:(NSNotification *)note
{
    UIDevice * device = note.object;
    switch(device.orientation)
    {
        case UIDeviceOrientationPortrait:
            /* start special animation */
            break;
            
        case UIDeviceOrientationPortraitUpsideDown:
            /* start special animation */
            break;
            
        default:
            break;
    };
    [self setNavigationBars];
}

-(void)leftDrawerButtonPress:(id)sender{
    if (_webView.tag==2) {
        return;
    }
    _lefttableView.tag = TAG_TOC;
    [_lefttableView reloadData];
    [self.drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

// tell the picker how many rows are available for a given component
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [_pickerdata count];
}

// tell the picker how many components it will have
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

// tell the picker the title for a given component
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [_pickerdata objectAtIndex:row];
}

// tell the picker the width of each row for a given component
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component {
    int sectionWidth = 200;
    
    return sectionWidth;
}

@end
