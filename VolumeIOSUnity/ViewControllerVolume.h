//
//  ViewControllerVolume.h
//  VolumeIOSUnity
//
//  Created by Bruno on 28/08/15.
//  Copyright (c) 2015 Bruno. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

@interface ViewControllerVolume : UIViewController{
    AVAudioSession* audioSession;
    float volumeDevice;
    BOOL inputButtonVolume;
}


@end
