if (audio_is_playing(Soundtrack))
	audio_stop_sound(Soundtrack);

else audio_play_sound(Soundtrack, 0, true);