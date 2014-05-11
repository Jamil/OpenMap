
//
//  parsing_contractors.m
//  OpenMap
//

#import <CoreLocation/CoreLocation.h>
#import "WBContractorParser.h"
#import "WBProject.h"

@implementation WBContractorParser

+(void)getContractorsForArray:(NSMutableArray*)arr {
    
    NSMutableString *path;
    path = [[NSMutableString  alloc] initWithString: [[NSBundle mainBundle] resourcePath]];
    [path appendString:@"/"] ;
    [path appendString:@"Contractors.json"];
    NSData *jsonData = [NSData dataWithContentsOfFile:path];
    
    NSError *error;
    NSDictionary *parsed = [NSJSONSerialization
                            JSONObjectWithData:jsonData
                            options:kNilOptions
                            error:&error];
    
    NSArray *allProjects = [parsed valueForKey:@"data"];
    NSInteger int_arr[500000] = {0};
    
    for (int i = 0; i < allProjects.count; i++) {
        NSString *projname = allProjects[i][13];
        NSInteger contract_num = [allProjects[i][19] integerValue];
        
        if(int_arr[contract_num-1100000] == 0)
            int_arr[contract_num-1100000]=1;
        else
            continue;
        NSString *contractor_name = allProjects[i][23];
        
        for(int j = 0; j < arr.count; j++) {
            WBProject *p = arr[j];
            if([p.PID isEqualToString:projname]) {
                NSLog(@"Match: %@, %@", projname, contractor_name);
                p.contractorName = [contractor_name capitalizedString];
                break;
            }
        }
    }
}


@end
