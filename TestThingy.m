//
//  TestThingy.m
//  NewJammingue
//
//  Created by Felix Herron on 4/22/15.
//  Copyright (c) 2015 Snockety. All rights reserved.
//

#import "TestThingy.h"
#define Sound_1 @"reggae.wav"
@interface TestThingy ()

@end

@implementation TestThingy

- (id) init
{
    if(nil != (self = [super init]))
    {
        // Create the device and context.
        // Note that it's easier to just let OALSimpleAudio handle
        // these rather than make and manage them yourself.
        device = [ALDevice deviceWithDeviceSpecifier:nil];
        context = [ALContext contextOnDevice:device attributes:nil];
        [OpenALManager sharedInstance].currentContext = context;
        
        // Deal with interruptions for me!
        [OALAudioSession sharedInstance].handleInterruptions = YES;
        
        // We don't want ipod music to keep playing since
        // we have our own bg music.
        [OALAudioSession sharedInstance].allowIpod = NO;
        
        // Mute all audio if the silent switch is turned on.
        [OALAudioSession sharedInstance].honorSilentSwitch = YES;
        
        // Take all 32 sources for this channel.
        // (we probably won't use that many but what the heck!)
        channel = [ALChannelSource channelWithSources:32];
        
        // Preload the buffers so we don't have to load and play them later.
        shootBuffer = [[OpenALManager sharedInstance] bufferFromFile:Sound_1];
        explosionBuffer = [[OpenALManager sharedInstance] bufferFromFile:Sound_1];
        

        
        
        // Background music track.
        piano1 = [OALAudioTrack track];
        piano2 = [OALAudioTrack track];
        piano3 = [OALAudioTrack track];
        drums1 = [OALAudioTrack track];
        mandolin1 = [OALAudioTrack track];
        mandolin2 = [OALAudioTrack track];
        mandolin3 = [OALAudioTrack track];
        
    }
    return self;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    NSLog(Sound_1);
    [piano1 playFile:Sound_1 loops:5];
    NSLog(@"secondyo");


}
- (IBAction)functin:(id)sender {
    NSString *test1 = [NSString stringWithFormat:@"%f", piano1.currentTime];
    NSLog(test1);
    NSLog(@"secondyo");
}

@end
