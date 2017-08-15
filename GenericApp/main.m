//
//  main.m
//  GenericApp
//
//  Created by Royi Reshef on 5/26/15.
//  Copyright (c) 2015 Royi Reshef. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AppDelegate.h"

int main(int argc, char * argv[]) {
    @autoreleasepool {
        // OVERRIDE LOCALE (BASICALLY DO THIS WHILE APP RUNS AND LET USER RESTART APP)
        NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
        BOOL shouldOverrideLocale =[[NSUserDefaults standardUserDefaults] boolForKey:@"NOveride"];
        NSString *languageIdentifier = [[NSUserDefaults standardUserDefaults] objectForKey:@"NLang"];
        NSString *countryIdentifier = [[NSUserDefaults standardUserDefaults] objectForKey:@"NCountry"];
        
        if( shouldOverrideLocale ) {
            NSLog( @"OVERRIDING SYSTEM LOCALE WITH : %@_%@",languageIdentifier, countryIdentifier );
            [defaults setObject:[NSArray arrayWithObject:languageIdentifier] forKey:@"AppleLanguages"];
            [defaults setObject:[NSArray arrayWithObjects:languageIdentifier, nil] forKey:@"NSLanguages"];
            [defaults setObject:[NSString stringWithFormat:@"%@_%@", languageIdentifier, countryIdentifier] forKey:@"AppleLocale"];
            [defaults synchronize];
        }
        else {
            NSArray *keysToRemove = @[@"AppleLanguages",@"NSLanguages",@"AppleLocale"];
            NSLog( @"RESETTING TO USE SYSTEM LOCALE" );
            @try {
                for( NSString *currentKey in keysToRemove ) {
                    if( [defaults objectForKey:currentKey] ) {
                        [defaults removeObjectForKey:currentKey];
                    }
                }
            }
            @catch (NSException *exception) {
                // NOTHNG TO CATCH HERE
            }
            @finally {
                [defaults synchronize];
            }
        }
        NSString *languageCode = [[NSLocale autoupdatingCurrentLocale] objectForKey:NSLocaleLanguageCode];
        NSString *countryCode = [[NSLocale autoupdatingCurrentLocale] objectForKey:NSLocaleCountryCode];
        NSLog( @"USING SYSTEM LOCALE: %@_%@", languageCode, countryCode );
        
        return UIApplicationMain(argc, argv, nil, NSStringFromClass([AppDelegate class]));
    }
}
