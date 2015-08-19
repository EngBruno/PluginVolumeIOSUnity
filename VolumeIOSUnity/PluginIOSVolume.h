//
//  ViewController.h
//  VolumeIOSUnity
//
//  Created by Bruno on 14/08/15.
//  Copyright (c) 2015 Bruno. All rights reserved.
//

//#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface PluginIOSVolume : NSObject{
    AVAudioSession* audioSession;
    float volumeDevice;
}

-(float)getVolumeDevice;
@end

