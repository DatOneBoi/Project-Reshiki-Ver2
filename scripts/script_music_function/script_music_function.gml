// Script assets have changed for v2.3.0 see
// https://help.yoyogames.com/hc/en-us/articles/360005277377 for more information
function set_song_ingame(_song, _fadeOutCurrentSong = 0, _fadeInTime = 0)
{

//song = set the song (including "noone" which stops or fade out the current song)
//fadeoutcurrentsong = time (in frames/ 60 = 1s) to fade out
//fadeintime = time (in frames/ 60 = 1s) to fade in

with(obj_music_manager)
	{
		targetSongAsset = _song;
		endFadeOutTime = _fadeOutCurrentSong;
		startFadeInTime = _fadeInTime;
	}
}