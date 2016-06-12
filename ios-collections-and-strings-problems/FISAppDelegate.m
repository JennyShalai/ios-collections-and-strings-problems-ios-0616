//  FISAppDelegate.m

#import "FISAppDelegate.h"

@implementation FISAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // takes a list of strings and prints them, one per line, in a rectangular frame of stars =)
    NSArray *myArray = @[@"I", @"love", @"Objective-C"];
    [self printStringsInFrame:myArray];
    
    // translates text to Pig Latin and back =)
    NSString *myString = @"I love Objective-C";
    NSString *myStringInPigLatin = [self translateEnglishToPigLatin:myString];
    NSLog(@"%@", myStringInPigLatin);
    NSString *backToEnglish = [self translatePigLatinToEnglish:myStringInPigLatin];
    NSLog(@"%@", backToEnglish);
    
    // combines two lists by alternatingly taking elements
    NSArray *myArray1 = @[@"1", @"2", @"3", @"4"];
    NSArray *myArrayA = @[@"A", @"B", @"C", @"D"];
    NSArray *myMix1AndA = [self combineListOne:myArray1 withListTwo:myArrayA];
    NSLog(@"%@", myMix1AndA);
    
    // takes a number and returns an array of its digits
    NSInteger myNumber = 1234567890;
    NSArray *myNumberArray = [self splitDigitsToArray:myNumber];
    NSLog(@"%@", myNumberArray);
    

    return YES;
}


  // takes a list of strings and prints them, one per line, in a rectangular frame
- (void)printStringsInFrame:(NSArray *)array {
    NSUInteger maxWordLength = (NSUInteger)[[array valueForKeyPath: @"@max.length"] integerValue];
    NSString *border = [@"" stringByPaddingToLength:(maxWordLength + 4) withString:@"*" startingAtIndex:0];
    NSLog(@"%@",border);
    for(NSString *word in array) {
        NSString *result = [word stringByPaddingToLength:maxWordLength withString:@" " startingAtIndex:0];
        NSLog(@"* %@ *", result);
    }
    NSLog(@"%@",border);
}


  // translates text to Pig Latin
- (NSString *)translateEnglishToPigLatin:(NSString *)string {
    NSMutableArray *stringAsArray = [[string componentsSeparatedByString:@" "] mutableCopy];
    NSString *stringPigLatin = @"";
    NSMutableArray *arrayPigLatin = [[NSMutableArray alloc] init];
    for(NSString *word in stringAsArray) {
        NSString *firstLetter = [NSString stringWithFormat:@"%c",[word characterAtIndex:0]];
        NSString *wordPigLatin = [[[word substringFromIndex:1] stringByAppendingString:firstLetter] stringByAppendingString:@"ay"];
        [arrayPigLatin addObject:wordPigLatin];
    }
    stringPigLatin = [arrayPigLatin componentsJoinedByString: @" "];
    return stringPigLatin;
}


  // translates text from Pig Latin
- (NSString *)translatePigLatinToEnglish:(NSString *)string {
    NSMutableArray *stringAsArray = [[string componentsSeparatedByString:@" "] mutableCopy];
    NSString *stringBackToEnglish = @"";
    NSMutableArray *arrayBackToEnglish = [[NSMutableArray alloc] init];
    for(NSString *word in stringAsArray) {
        NSString *lastThree = [word substringFromIndex:(word.length - 3)];
        NSString *firstLetter = [NSString stringWithFormat:@"%c",[lastThree characterAtIndex:0]];
        NSString *foo = [word substringToIndex:(word.length - 3)];
        NSString *wordBackToEnglish = [firstLetter stringByAppendingString:foo];
        [arrayBackToEnglish addObject:wordBackToEnglish];
    }
    stringBackToEnglish = [arrayBackToEnglish componentsJoinedByString: @" "];
    return stringBackToEnglish;
}


  // combines two lists by alternatingly taking elements
- (NSArray *)combineListOne:(NSArray *)array1 withListTwo:(NSArray *)array2 {
    NSMutableArray *result = [[NSMutableArray alloc] init];
    for(NSUInteger i = 0; i < [array1 count]; i++) {
        [result addObject:array1[i]];
        [result addObject:array2[i]];
    }
    return result;
}


  // takes a number and returns an array of its digits
- (NSArray *)splitDigitsToArray:(NSInteger)number {
    NSMutableArray *result = [[NSMutableArray alloc] init];
    while (number > 0) {
        NSUInteger digit = number % 10;
        [result addObject:@(digit)];
        number = (NSInteger)trunc(number / 10);
    }
    result = [[self reverseArray:result] mutableCopy];
    return result;
}

  // helper method for revers array
- (NSArray *)reverseArray:(NSArray *)array {
    NSMutableArray *result = [array mutableCopy];
    NSUInteger i = 0;
    NSUInteger j = [result count] - 1;
    while (i < j) {
        [result exchangeObjectAtIndex:i withObjectAtIndex:j];
        i++;
        j--;
    }
    return result;
}
                                            
@end
