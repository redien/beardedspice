//
//  BandCampStrategy.m
//  BeardedSpice
//
//  Created by Jose Falcon on 12/16/13.
//  Copyright (c) 2013 Tyler Rhodes / Jose Falcon. All rights reserved.
//

#import "BandCampStrategy.h"

@implementation BandCampStrategy

-(id) init
{
    self = [super init];
    if (self) {
        predicate = [NSPredicate predicateWithFormat:@"SELF LIKE[c] '*bandcamp.com*'"];
    }
    return self;
}

-(BOOL) accepts:(id <Tab>)tab
{
    return [predicate evaluateWithObject:[tab URL]];
}

-(NSString *) toggle
{
    return @"(function(){return document.querySelectorAll('div.playbutton')[0].click()})()";
}

-(NSString *) previous
{
    return @"(function(){return document.querySelectorAll('div.prevbutton')[0].click()})()";
}

-(NSString *) next
{
    return @"(function(){return document.querySelectorAll('div.nextbutton')[0].click()})()";
}

-(NSString *) pause
{
    return @"(function(){var play = document.querySelectorAll('div.playbutton')[0];if (play.classList.contains('playing')) {play.click()}})()";    
}
    
-(NSString *) displayName
{
    return @"BandCamp";
}

@end
