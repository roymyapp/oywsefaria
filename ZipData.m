//
//  ZipData.m
//  OnYourWay
//
//  Created by Royi Reshef on 4/5/15.
//
//

#import "ZipData.h"
#import "zipzap.h"

@implementation ZipData

+ (GDataXMLDocument *)loadData:(NSString*)name printError:(BOOL)printError {
    NSString *filePath = [[NSBundle mainBundle] pathForResource:name ofType:@"zip"];
    if (!filePath) {
        NSLog(@"could not load xml file %@", name);
        NSString *msg =  [[NSString alloc]initWithFormat:@"אופס, לא ניתן להציג את הספר בגלל תקלה, אנא שלח את המספר הבא למפתח כדי שהדבר יתוקן בהקדם\nerror number: %@\n\nroy.myapp@gmail.com",name];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"סליחה תקלה" message:msg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        if (printError) {
            [alert show];
        }
        return nil;
        
    }
    ZZArchive* oldArchive = [ZZArchive archiveWithURL:[NSURL fileURLWithPath:filePath]
                                                error:nil];
    ZZArchiveEntry* firstArchiveEntry = oldArchive.entries[0];
    NSError *error;
    GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithData:[firstArchiveEntry newDataWithError:nil] options:0 error:&error];
    if (doc == nil) {
        NSLog(@"could not load xml file %@", name);
        NSString *msg =  [[NSString alloc]initWithFormat:@"אופס, לא ניתן להציג את הספר בגלל תקלה, אנא שלח את המספר הבא למפתח כדי שהדבר יתוקן בהקדם\nerror number: %@\n\nroy.myapp@gmail.com",name];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"סליחה תקלה" message:msg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        if (printError) {
            [alert show];
        }
        return nil;
    }
    return doc;
}

+ (NSDictionary *)loadJsonData:(NSString*)name printError:(BOOL)printError cache:(NSMutableArray*) cache{
    for(int i=0; i< cache.count;i++) {
        NSMutableArray* a = [cache objectAtIndex:i];
        if ([(NSString*)[a objectAtIndex:0] isEqualToString:name]) {
            NSLog(@"found cache %@", name);
            [cache removeObjectAtIndex:i];
            [cache addObject:a];
            return [a objectAtIndex:1];
        }
    }
    NSString *filePath = [[NSBundle mainBundle] pathForResource:name ofType:@"zip"];
    if (!filePath) {
        NSLog(@"could not load json file %@", name);
        NSString *msg =  [[NSString alloc]initWithFormat:@"אופס, לא ניתן להציג את הספר בגלל תקלה, אנא שלח את המספר הבא למפתח כדי שהדבר יתוקן בהקדם\nerror number: %@\n\nroy.myapp@gmail.com",name];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"סליחה תקלה" message:msg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        if (printError) {
            [alert show];
        }
        return nil;
        
    }
    ZZArchive* oldArchive = [ZZArchive archiveWithURL:[NSURL fileURLWithPath:filePath]
                                                error:nil];
    ZZArchiveEntry* firstArchiveEntry = oldArchive.entries[0];
    NSError *error;
    NSDictionary* json = [NSJSONSerialization
                          JSONObjectWithData:[firstArchiveEntry newDataWithError:nil] //1
                          options:kNilOptions
                          error:&error];
    if (json == nil) {
        NSLog(@"could not load json file %@", name);
        NSString *msg =  [[NSString alloc]initWithFormat:@"אופס, לא ניתן להציג את הספר בגלל תקלה, אנא שלח את המספר הבא למפתח כדי שהדבר יתוקן בהקדם\nerror number: %@\n\nroy.myapp@gmail.com",name];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"סליחה תקלה" message:msg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        if (printError) {
            [alert show];
        }
        return nil;
    }
    if ([cache count] > MAX_CACHE) {
        [cache removeObjectAtIndex:0];
    }
    [cache addObject:@[name, json]];
    return json;
}


@end
