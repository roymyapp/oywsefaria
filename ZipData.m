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

+ (void)sendSlack:(NSString*)msg{
    NSMutableURLRequest *request =
    [NSMutableURLRequest requestWithURL:[NSURL URLWithString:@"https://hooks.slack.com/services/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"]];
    [request setHTTPMethod:@"POST"];
    NSDictionary *dictionary = @{ @"channel" : @"#error", @"username": @"data", @"text": msg, @"icon_emoji": @":red_circle:" };
    NSError *err;
    NSData *jsonData = [NSJSONSerialization dataWithJSONObject:dictionary options:0 error:&err];
    [request setHTTPBody:jsonData];
    NSURLResponse *response;
    [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&err];
}

+ (GDataXMLDocument *)loadData:(NSString*)name printError:(BOOL)printError {
    NSError *error = nil;
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"toc" ofType:@"zip"];
    if (!filePath) {
        NSLog(@"could not load xml file %@", name);
        NSString *msg =  [[NSString alloc]initWithFormat:@"אופס, לא ניתן להציג את הספר בגלל תקלה, אנא שלח את המספר הבא למפתח כדי שהדבר יתוקן בהקדם\nerror number: %@\n\nroy.myapp@gmail.com",name];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"סליחה תקלה" message:msg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        [self sendSlack:msg];

        if (printError) {
            [alert show];
        }
        return nil;
        
    }
    ZZArchive* oldArchive = [ZZArchive archiveWithURL:[NSURL fileURLWithPath:filePath]
                                                error:nil];
    ZZArchiveEntry* ArchiveEntry = nil;
    for (ZZArchiveEntry* entry in oldArchive.entries){
        NSLog(@"%@", entry.fileName);
        if ([entry.fileName isEqualToString:name]) {
            ArchiveEntry = entry;
            break;
        }
    }
    if (!ArchiveEntry) {
        NSString *msg =  [[NSString alloc]initWithFormat:@"אופס, לא ניתן להציג את הספר בגלל תקלה, אנא שלח את המספר הבא למפתח כדי שהדבר יתוקן בהקדם\nerror number: %@\n\nroy.myapp@gmail.com",name];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"XML not found" message:msg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        if (printError) {
            [alert show];
        }
        return nil;
        
    }
    
    //NSError *error;
    error = nil;
    GDataXMLDocument *doc = [[GDataXMLDocument alloc] initWithData:[ArchiveEntry newDataWithError:nil] options:0 error:&error];
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

+ (NSDictionary *)loadJsonData:(NSString*)name printError:(BOOL)printError cache:(NSMutableArray*) cache empty:(NSMutableDictionary *)empty {
    if ([empty objectForKey:name]) {
        NSLog(@"found empty cache %@", name);
        return nil;
    }
    for(int i=0; i< cache.count;i++) {
        NSMutableArray* a = [cache objectAtIndex:i];
        if ([(NSString*)[a objectAtIndex:0] isEqualToString:name]) {
            //NSLog(@"found cache %@", name);
            [cache removeObjectAtIndex:i];
            [cache addObject:a];
            return [a objectAtIndex:1];
        }
    }
    
    NSString *filePath = [[NSBundle mainBundle] pathForResource:[name componentsSeparatedByString:@"."][0] ofType:@"zip"];
    if (!filePath) {
        NSLog(@"could not load zip json file %@", name);
        NSString *msg =  [[NSString alloc]initWithFormat:@"אופס, לא ניתן להציג את הספר בגלל תקלה, אנא שלח את המספר הבא למפתח כדי שהדבר יתוקן בהקדם\nerror number: %@\n\nroy.myapp@gmail.com",name];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"סליחה תקלה" message:msg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        if (printError) {
            [self sendSlack:msg];
            [alert show];
        }
        [empty setObject:@"a" forKey:name];
        return nil;
        
    }
    ZZArchive* oldArchive = [ZZArchive archiveWithURL:[NSURL fileURLWithPath:filePath]
                                                error:nil];
    ZZArchiveEntry* ArchiveEntry = nil;
    for (ZZArchiveEntry* entry in oldArchive.entries){
        //NSLog(@"%@", entry.fileName);
        if ([entry.fileName isEqualToString:name]) {
            ArchiveEntry = entry;
            break;
        }
    }
    if (!ArchiveEntry) {
        NSLog(@"could not load json file not in archive %@", name);
        if (printError) {
            NSString *msg =  [[NSString alloc]initWithFormat:@"אופס, לא ניתן להציג את הספר בגלל תקלה, אנא שלח את המספר הבא למפתח כדי שהדבר יתוקן בהקדם\nerror number: %@\n\nroy.myapp@gmail.com",name];
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"סליחה תקלה" message:msg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
            [self sendSlack:msg];
            [alert show];
        }
        [empty setObject:@"a" forKey:name];
        return nil;
        
    }
    
    NSError *error;
    NSDictionary* json = [NSJSONSerialization
                          JSONObjectWithData:[ArchiveEntry newDataWithError:nil] //1
                          options:kNilOptions
                          error:&error];
    if (json == nil) {
        NSLog(@"could not load json file json error %@", name);
        NSString *msg =  [[NSString alloc]initWithFormat:@"אופס, לא ניתן להציג את הספר בגלל תקלה, אנא שלח את המספר הבא למפתח כדי שהדבר יתוקן בהקדם\nerror number: %@\n\nroy.myapp@gmail.com",name];
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"סליחה תקלה" message:msg delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
        if (printError) {
            [self sendSlack:msg];
            [alert show];
        }
        [empty setValue:@"a" forUndefinedKey:name];
        return nil;
    }
    if ([cache count] > MAX_CACHE) {
        [cache removeObjectAtIndex:0];
    }
    [cache addObject:@[name, json]];
    return json;
}


@end
