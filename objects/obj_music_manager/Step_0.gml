var _finalVol = global.musicVolume*global.masterVolume;


//Play target song
if songAsset !=targetSongAsset
{
	//Old song to Fade Out
	if audio_is_playing(songInstance)
	{
		//add our songInstance to array of songs to fade out
		array_push(fadeOutInstance, songInstance);
		//add the songInstance's starting volume
		array_push(fadeOutVol, fadeInVolume);
		//add the fadeOutInstance's fade out time
		array_push(fadeOutTime, endFadeOutTime);
		
		//reset songInstance and songAsset Variables
		songInstance = noone;
		songAsset = noone;
	}
	
	//Play the BGM
	if array_length(fadeOutInstance) == 0
	{
		if audio_exists(targetSongAsset)
			{
				//play the song and store the instance as variable
			songInstance = audio_play_sound(targetSongAsset, 4, true);
	
				//start the song volume at 0
			audio_sound_gain(songInstance, 0, 0)
			fadeInVolume = 0;
			}
		//Set the songAsset to match the TargetSongAsset
		songAsset = targetSongAsset;
		}	
	}
	
//Volume Control
	//Main BGM Volume
	if audio_is_playing(songInstance)
	{
		
		//Fade the song in
		if startFadeInTime > 0
			{
				if fadeInVolume < 1 
				{ 
					fadeInVolume += 1/startFadeInTime
				}
				else
				fadeInVolume = 1;
			}	
		// instantly starts song if fade in is 0 frames
		else
		{
			fadeInVolume = 1;
		}


		//set the gain of bmg /THE MAIN VOLUME AND FADE IN
		audio_sound_gain(songInstance, fadeInVolume*_finalVol, 0);
	}
	
	//fading songs out
	for(var i = 0; i < array_length(fadeOutInstance); i++)
	{
		//Fade the volume
		if fadeOutInstance[i] > 0
		{
			if fadeOutVol[i] > 0
			{
				fadeOutVol[i] -= 1/fadeOutTime[i];
			}
		}
		//instantly cut volume to 0
		else
		{
			fadeOutVol[i] = 0;
		}
		
		//set the gain of bgm/THE MAIN VOLUME AND FADE OUT
		audio_sound_gain(fadeOutInstance[i], fadeOutVol[i]*_finalVol, 0);
		
		//stop the song when 0 volume
		if fadeOutVol[i] <=0
		{
			//stops the song
			if audio_is_playing(fadeOutInstance[i]) {audio_stop_sound(fadeOutInstance[i]); }
			//remove from arrays
			array_delete(fadeOutInstance, i, 1);
			array_delete(fadeOutVol, i, 1);
			array_delete(fadeOutTime, i, 1);
			//set the loop back again
			i--;
		}
	}	