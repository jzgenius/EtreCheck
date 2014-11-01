/***********************************************************************
 ** Etresoft
 ** John Daniel
 ** Copyright (c) 2012. All rights reserved.
 **********************************************************************/

#import "ByteCountFormatter.h"

#define k1000 1000.0 // 1024

@implementation ByteCountFormatter

- (NSString *) stringFromByteCount: (unsigned long long) byteCount
  {
  NSArray * unitValues =
    [NSLocalizedString(@"B KB MB GB TB", NULL)
      componentsSeparatedByString: @" "];
  int precisionValues[] = { 0, 0, 0, 2, 0};
  NSUInteger unitsIndex = 0;
  
  NSString * displayMem = @"?";
  
  double value = byteCount;
  
  while(YES)
    {
    if(value < k1000)
      {
      int precision = 0;
      NSString * units = @"";
      
      if(unitsIndex < 5)
        {
        precision = precisionValues[unitsIndex];
        units = [unitValues objectAtIndex: unitsIndex];
        }
        
      displayMem =
        [NSString stringWithFormat: @"%.*lf %@", precision, value, units];
        
      break;
      }
      
    ++unitsIndex;
    
    value /= k1000;
    }
    
  return displayMem;
  }

@end