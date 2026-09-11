/// @param text_id
function scr_game_text(_text_id){

	switch(_text_id)
		{
			#region//Testing
			case "testing 1":
				scr_text("NPC Testing the dialogue.")
				scr_text("It works!")
				break;
				
			case "testing 2":
				scr_text("Something someghing")
				scr_text("Would you like to cook?")
					scr_option("Yes.","testing 2 - yes")
					scr_option("No.", "testing 2 - no")
				break;
				case "testing 2 - yes":
					
					scr_text("JESSE LET ME COOK!");
					break;
					
				case "testing 2 - no":
					
					scr_text(":skull:", "Player");
					break;
					
					
			case "Wall1":
				scr_text("Its a wall.", "Player")
				scr_text("Would you like to lick it?")
					scr_option("Yes", "Wall1 - yes")
					scr_option("Nope", "Wall1 - no")
					break;
					case "Wall1 - yes":
						scr_text("You licked the wall")
						scr_text("What a weirdo...", "AnnoyedPlayer")
						break;
					
					case "Wall1 - no":
						scr_text("Thank you for being normal.", "Player")
						break;
					
		
			case "Door":
				scr_text("Its a door.", "AnnoyedPlayer")
				scr_text("What else do you want from me? Talk to it?", "AnnoyedPlayer")
				break;
				
			case "Cliffs":
				scr_text("The view is astonishing.", "Player")
				break;
			
			#endregion
			
			#region//Startzone
			case "startcliff":
				scr_text("For some reason you dont know where you are")
				scr_text("Nor why you are here in the first place")
				scr_text("The scenery is good though.")
					break;
					
			case "startsign1":
				scr_text("Press W/A/S/D or Up/Down/Left/Right keys to move.")
				scr_text("Press E to interact.")
				scr_text("What?", "ConfusedPlayer")
				scr_text("What does that even mean?", "ConfusedPlayer")
					break;
					
			case "startsign2":
				scr_text("This is a sign")
				scr_text("you can read these.")
				scr_text("......","AnnoyedPlayer")
					break;
				
			case "startsign3":
				scr_text("Press Shift to Sprint")
					break;
			
			case "trigger1" :
				scr_text("You've got an adventure waiting for you.")
				global.objectives = true;
				global.objectivesdesc = "Find an exit";
					break;
				
			case "Trees" :
				scr_text("Its a dense forest,")
					break;
					
			case "SignForrest" :
				scr_text("The sign is unreadable.")
				scr_text("I can barely read this.", "ConfusedPlayer")
					break;			
			
			case "BackArea" :
				scr_text("For some reason you cant go back.")
				scr_text("???", "ConfusedPlayer")
					break;	
			
			case "Lake" :
				scr_text("It's a lake.")
				scr_text("Not really a good time to swim right now.")
					break;
					
			case "LakeSign" :
				scr_text("Gubat Mangkukulam.")
				scr_text("Thats an odd name." ,"Player")
					break;
			
			case "LakeStep" :
				scr_text("Where is this place?", "ConfusedPlayer")
				scr_text("I dont recognize this place at all." ,"Player")
					break;
			
			case "coins":
				scr_text("Uh...","ConfusedPlayer")
				scr_text("Neat!","GladPlayer")
				scr_text("Although I dont think this is peso, I'l take it","GladPlayer")
					break;
			
			case "WitchSign" :
				scr_text("Pamamahay ni Aleng Mangbabarang")
				scr_text("Maybe she knows where I am", "Player")
				scr_text("I should go and meet her.", "Player")
					break;
			
			case "Comein" :
				scr_text("Hello?", "ConfusedPlayer")
				scr_text("...", "ConfusedPlayer")
				scr_text("May tao po.", "ConfusedPlayer")
				scr_text("...", "ConfusedPlayer")
				scr_text("...", "Player")
				scr_text("Im just gonna go in.", "Player")
				global.objectives = true;
				global.objectivesdesc = "Go inside";
					break;
					
			case "Kubo" :
				scr_text("Its a straw hut")
				scr_text("Wow this is the first time I saw a real Bahay Kubo", "Player")
					break;
			
			case "Witchinside" :
				scr_text("Okay, was the house always this big?" , "ConfusedPlayer")
				scr_text("What kind of magic is this?" , "ConfusedPlayer")
				global.objectives = true;
				global.objectivesdesc = "Explore"
					break;
			
			case "Witchinside2" :
				scr_text("Hello?" , "ScaredPlayer")
				scr_text("May tao po ba?" , "ScaredPlayer")
				//time_source = time_source_create(time_source_game, 4, time_source_units_seconds, function()
				//{
				//	audio_play_sound(snd_lvlup,1 ,0)
				//}, [], 1)
				//time_source_start(time_source);
					break;
			
			case "blocked":
				scr_text("It's blocked")
				scr_text("...", "ScaredPlayer")
				break;
			
			case "later":
				scr_text("You have a feeling you shouldn't go there yet")
				scr_text("...", "ScaredPlayer")
					break;
					
			case "smash":
				audio_play_sound(snd_impact,1 ,0)
				global.objectives = true;
				global.objectivesdesc = "Explore?"
			
				//call_later(1, time_source_units_seconds, function(){}, )
				obj_witch.face = RIGHT;
				scr_text("Woah!", "ScaredPlayer")	
				scr_text("What was that?", "ScaredPlayer")
				scr_text("SINO NANAMAN YAN?", "Witch")
					scr_option("...", "smash1")
					scr_option("May tao po?","smash2")
						
						case "smash1":
						
							scr_text("...","ScaredPlayer")
							scr_text("...","Witch")
							break;
							
						case "smash2":
							
							scr_text("May tao po.", "ScaredPlayer")
							scr_text("HA?","Witch")
							scr_text("LUMAPIT KA RITO, HINDI KITA MAPAKINIG!","Witch")
							scr_text("...","ScaredPlayer")
							break;
			
			case "noticed":
				

				obj_guy.face = RIGHT;
				obj_witch.face = DOWN;
				scr_text("ABA!", "Witch")
				scr_text("SINO KA AT BAKIT NARITO KA TUTOY?", "Witch")
				scr_text("Uh...", "ScaredPlayer")
					scr_option("Tulong", "noticed1")
					scr_option("Nasaan ako", "noticed2")
					break;
							
						case "noticed1" : 
							scr_text("Kailangan ko po ng tulong.","ScaredPlayer")
							scr_text("AH, SIGE SIGE TOTOY.","Witch")
							scr_text("ANO ANG KAILANGAN MO IHO?", "Witch")
								scr_option("Kailangan ko pong makaalis dito at makauwi saking bahay.","noticed3")
								scr_option("Wala po pala.","noticed4")
								break;
									
						case "noticed2" :
							scr_text("Hindi ko po alam kung nasaan ako.", "ScaredPlayer")
							scr_text("AHA! IHO! HINDI MO BA ALAM NA NASA LUPAIN KA NG MGA ENKANTO?","Witch")
							scr_text("uhh...","ScaredPlayer")
							scr_text("HMMM?","Witch")
							scr_text("RAMDAM KO NA KAILANGAN MO NG TULONG IHO.","Witch")
							scr_text("TAMA NGA BA ANG HINALA KO","Witch")
								scr_option("Opo","noticed3")
								scr_option("Hindi po","noticed4")
								break;
							
									case "noticed3":
										scr_text("AHA! SINASABI KO NA NGA BA!", "Witch")
										scr_text("Alam ninyo po ba kung paano ako makakaalis dito?", "ScaredPlayer")
										scr_text("ABAY OO NAMAN! KILALA AKO SA LUPAIN NG ENKANTO BILANG NA PINAKAMAGALING NA MAMBABARANG!","Witch")
										scr_text("Paano po ba ako makakaalis di-", "ConfusedPlayer")
										scr_text("MAKAKAALIS KA LANG DITO KUNG MAKUKUHA MO ANG MGA SANGKAP NA KAILANGANG PARA MAKAPAGTIMPLA AKO NG LAGUSAN MO", "Witch")
										scr_text("SAYANG NAMAN DAHIL NAPAKAHIRAP KUNIN NG MGA SANGKAP NA ITO!", "Witch")
										scr_text("Hindi po, Kaya kong kunin ang mga sangkap na iyan", "Player")
										scr_text("HMM, HINDI KO ALAM IHO, KAILANGAN MONG BUMALIK SA NAKARAAN PARA MAKUHA ANG MGA ITO", "Witch")
										scr_text("Kakayanin ko po iyan basta makabalik lang ako sa amin!","Player")
										scr_text("AHEE HEE HEE HEE! KUNG SABI MO IYAN AY MANINIWALA AKO", "Witch")
										scr_text("ANG UNA MONG SANGKAP NA KUKUNIN AY NASA KALIWANG KWARTO.", "Witch")
										scr_text("MAGPUNTA KA ROON AT MAKIKITA MO ANG HINAHANAP KONG ","Witch")
										scr_text("BUTO NG REBOLUSYON","Witch")
										scr_text("AY SIGE NA, YUMAO KANA'T KUNIN ITO. PARA MAPADALI ANG IYONG PAGUWI!", "Witch")
										scr_text("AHEE HEE HEE HEE HEE HEE!", "Witch")
										scr_text("(yikes, she is very crazy)","ScaredPlayer")
										scr_text("ANO IYON IHO?", "Witch")
										scr_text("Wala po ito manang", "ScaredPlayer")
										scr_text("(Lets just get out of here quickly)","ScaredPlayer")
										instance_destroy(obj_trigger_perm);
										global.objectives = true;
										global.objectivesdesc = "Explore left side"
												break;
							
									case "noticed4":
										scr_text("HINDI MO AKO MALOLOKO TOTOY","Witch")
										scr_text("(This is getting scary now)","ScaredPlayer")
											scr_option("Kailangan ko pong makauwi","noticed3")
											break;
				
				case "ohno":
					scr_text("...","ScaredPlayer")
					scr_text("Oh no...","ScaredPlayer")
					obj_guy.face = LEFT;
					global.quest = true;
					global.objectives = true;
					global.objectivesdesc = "Find an exit"
						break;
						
				case "thedoor":
					if (global.quest = false)
					{
						scr_text("The light of the door shines bright")
						break;
					}
					if (global.quest = true)
					{
						scr_text("Its shut tight")
						break;
					}
				
				case "ohno2":
					scr_text("It's pitch black in here","Player")
					scr_text("I can't see anything","Player")
					break;
				
				case "deadend":
					scr_text("Its a deadend")
					global.objectives = false;
					global.objectivesdesc = "Find an exit"
					audio_stop_all();
					break;
				
				case "itsopen" :
					scr_text("The door!", "Player")
					scr_text("Its open again!", "Player")
					break;
				
				case "whatnow" :
					scr_text("WHAT!", "ScaredPlayer")
					scr_text("HEY! LET ME OUT!", "ScaredPlayer")
					scr_text("please.", "ScaredPlayer")
					break;
					
				case "encounter" :
					scr_text("Huh?", "ScaredPlayer")
					scr_text("Where am I?", "ScaredPlayer")
					scr_text("Wait I see someone", "Player")
					scr_text("Hey! Over Here!", "Player")
					break;
				
			#endregion
		}

}

global.quest = false;

	

