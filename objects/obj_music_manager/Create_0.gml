//info for the song currently playing
songInstance = noone;
songAsset = noone;
targetSongAsset = noone;
endFadeOutTime = 0; 
startFadeInTime = 0; 
fadeInVolume = 1;


//Global Music Volume
global.musicVolume = 1;
global.masterVolume =1;


//fading out and stopping music
fadeOutInstance = array_create(0);
fadeOutVol = array_create(0);
fadeOutTime = array_create(0);
