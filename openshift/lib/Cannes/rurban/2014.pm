package Cannes::rurban::2014;

#!/usr/bin/perl -- -*- perl -*-
# Cannes 2014 Critics Ratings
# collected by Diego Lerer, ioncinema, indiewire, screendaily and Reini Urban
# Recalc and sort ratings by all cannes critics http://www.todaslascriticas.com.ar/cannes
# and 16 more western critics from http://www.ioncinema.com/ (scaled to 0-10)
# french: http://www.lefilmfrancais.com/cannes2014/quotidien/ (scale 0-4)
# http://jury.critic.de/cannes/
# http://www.screendaily.com/festivals/cannes/cannes-2014-screens-dailies/5071703.article?blocktitle=DIGITAL-EDITIONS&contentID=41755   (scale 0-4)
# http://www.ioncinema.com/news/film-festivals/live-from-cannes-2014-meet-our-cannes-critics-panel
# More:
# http://www.indiewire.com/critic/
# http://www.guardian.co.uk/film/series/first-look-review+cannes-2014
#
# Published at http://cannes-rurban.rhcloud.com/2014
# History at https://github.com/rurban/cannes-critics-ratings
# Perl script by Reini Urban (c) 2010, 2011, 2012, 2013, 2014
# US ratings:
# A+ 10   A 9   A- 8
# B+ 7    B 6   B- 5
# C+ 4    C 3   C- 2
# D+ 1.5  D 1
# E 0.5   F 0
# Le film français+Screen Daily 0-4: 0-1, 1-2.5, 2-5, 3-7.5, 4-9
# British 0-5: x2
# critic.de +++ 9, ++ 7.5, + 6, +- 5, - 4, -- 2.5, --- 1

use utf8;
our $DATA= <<'EOF';

COMPETITION

"MR TURNER" (Mike LEIGH) [Competition]
Alexandra Zawia       8.5
Diego Batlle          7
Diego Lerer           6
Fernando Ganzo        3.5
Eulàlia Iglesias     7.5
José Luis Losa       5.5
Pedro Butcher         7
Luciano Monteagudo    8
Carlos Heredero       7
Giona Nazzaro         8
Cristina Nord         4
Alejandro Calvo       7
Xavi Serra            7
# Screen Daily (0-4)
Robbie Collin
David Stratton       
Derek Malcolm        
Jan Schulz-Ojala     
Jose Carlos Avellar  
Stephanie Zacharek    
Michel Ciment        
Kate Muir/Wendy Ide  
Bo Green Jensen      
Screen International 
# critic.de +++ 9, ++ 7.5, + 6, +- 5, - 4, -- 2.5, --- 1
Adam Cook                 
Arnaud Hée           
Christoph Huber           
Frédéric Jaeger          
Till Kadritzke       
Daniel Kasman             
Michael Kienzl            
# ioncinema 0-5
Nicolas Bell         
Christophe Beney     
David Calhoun        
Per Juul Carlsen     
Paola Casella        
#Mike d'Angelo       
Manion Dumais        
#Carlos F. Heredero  
#Eric Kohn   	     5		http://www.indiewire.com/article/cannes-review-nicole-kidman-is-a-solid-grace-kelly-in-grace-of-monaco-but-is-it-fact-or-fiction           
Eric Lavallée        
Fabien Lemercier     
Guy Lodge            
Liu Min              
Isabelle Regnier     
Cédric Succivalli    
Blake Williams       
# Le film français 0-4
Stéphanie Lamome      
Arnaud Schwartz       
Fabrice Leclerc       
Eric Neuhoff          
Stéphane Delorme      
Thomas Sotinel        
Philippe Rouyer       
Pierre Vavasseur      
Pierre Murat          
Jean Roy              
Serge Kaganski        
Pierre Fornerod       
Pascal Merigeau       
Danielle Attali       
Christophe Carriére   
# TF1.fr 0-5
Aurelien Allin        
Evangeline Barbaroux  
Thomas Baurez         
Stephanie Belpeche    
Roman Blondaeu        
Stephanie Lamome      
Roman Vern            
Mehdi Omais           
#Philippe Rouyer      
#critics
Mike d'Angelo         6.8	https://twitter.com/gemko/status/466876493541699584
Peter Bradshaw       10   http://www.theguardian.com/film/2014/may/15/mr-turner-cannes-review-mike-leigh-2014

"TIMBUKTU" (Abderrahmane SISSAKO) [Competition]
Scott Foundas         
Roger Koza            6.5
Alexandra Zawia       7.5
Robert Koehler        
Diego Batlle          
Diego Lerer           7.5
Fernando Ganzo        4.5
Eulàlia Iglesias     7
Ángel Quintana       7
José Luis Losa       7.5
Pedro Butcher         6
Jose Luis De Lorenzo  
Alex Vicente          
Carlo Chatrian        
Violeta Kovacsics     
Luciano Monteagudo    7
Jaime Pena            6
Rüdiger Suchsland    
Carlos Heredero       5.5
Luciano Barisone      
Giona Nazzaro         4.5
Dana Linssen          
Cristina Nord         9
Francisco Ferreira    
Cecilia Martinez      
Paolo Moretti         
Neil Young            
Ronald Rovers         
Marcelo Alderete      
Michal Oleszczyk      
Manu Yañez           
Carlos Reviriego      
Fernando Juan Lima    
Paolo Bertolin        
Nando Salva           
Philip Engel          
Inma Merino           7
Fredy Friedlander     
Pablo Scholz          
Alejandro Calvo       6
Xavi Serra            6
Guido Castillo        
Pamela Bienzobas      
Javier Estrada        8
Boris Nelepo          
# Screen Daily (0-4)
Robbie Collin
David Stratton       
Derek Malcolm        
Jan Schulz-Ojala     
Jose Carlos Avellar  
Stephanie Zacharek    
Michel Ciment        
Kate Muir/Wendy Ide  
Bo Green Jensen      
Screen International 
# critic.de +++ 9, ++ 7.5, + 6, +- 5, - 4, -- 2.5, --- 1
Adam Cook                 
Arnaud Hée           
Christoph Huber           
Frédéric Jaeger          
Till Kadritzke       
Daniel Kasman             
Michael Kienzl            
# ioncinema 0-5
Nicolas Bell         
Christophe Beney     
David Calhoun        
Per Juul Carlsen     
Paola Casella           
#Mike d'Angelo       
Manion Dumais           
#Carlos F. Heredero  
#Eric Kohn   	     5	http://www.indiewire.com/article/cannes-review-nicole-kidman-is-a-solid-grace-kelly-in-grace-of-monaco-but-is-it-fact-or-fiction           
Eric Lavallée        
Fabien Lemercier     
Guy Lodge            
Liu Min              
Isabelle Regnier     
Cédric Succivalli    
Blake Williams       
# Le film français 0-4
Stéphanie Lamome      
Arnaud Schwartz       
Fabrice Leclerc       
Eric Neuhoff          
Stéphane Delorme      
Thomas Sotinel        
Philippe Rouyer       
Pierre Vavasseur      
Pierre Murat          
Jean Roy              
Serge Kaganski        
Pierre Fornerod       
Pascal Merigeau       
Danielle Attali       
Christophe Carriére   
# TF1.fr 0-5
Aurelien Allin        
Evangeline Barbaroux  
Thomas Baurez         
Stephanie Belpeche    
Roman Blondaeu        
Stephanie Lamome      
Roman Vern            
Mehdi Omais           
#Philippe Rouyer      
Stephanie Zacharek    
# critics
Mike d'Angelo         5.9	https://twitter.com/gemko/status/466691923143843840
Peter Bradshaw        8         http://www.theguardian.com/film/2014/may/14/cannes-film-festival-review-timbuktu

"THE CAPTIVE" (Atom EGOYAN) [Competition]

"WINTER SLEEP" (Nuri Bilge CEYLAN) [Competition]

"SAINT LAURENT" (Bertrand BONELLO) [Competition]

"WILD TALES (RETRATOS SALVAJES)" (Damian SZIFRON) [Competition]

"THE HOMESMAN" (Tommy Lee JONES) [Competition]

"LE MERAVIGLIE (The Wonders)" (Alice ROHRWACHER) [Competition]

"FOXCATCHER" (Bennett MILLER) [Competition]

"MAPS TO THE STARS" (David CRONENBERG) [Competition]

"DEUX JOURS, UNE NUIT (TWO DAYS, ONE NIGHT)" (Jean-Pierre and Luc DARDENNE) [Competition]

"STILL THE WATER (FUTATSUME NO MADO)" (KAWASE Naomi) [Competition]

"THE SEARCH" (Michel HAZANAVICIUS) [Competition]

"ADIEU AU LANGAGE (GOODBYE TO LANGUAGE)" (Jean-Luc GODARD) [Competition]

"JIMMY’S HALL" (Ken LOACH) [Competition]

"MOMMY" (Xavier DOLAN) [Competition]

"CLOUDS OF SILS MARIA" (Olivier ASSAYAS) [Competition]

"LEVIATHAN" (Andrey ZVYAGINTSEV) [Competition]


UN CERTAIN REGARD

"PARTY GIRL" (Marie AMACHOUKELI-BARSACQ, Claire BURGER, Samuel THEIS) [Un Certain Regard]
Roger Koza            4.5
Alexandra Zawia       4
Diego Batlle          7
Diego Lerer           6
José Luis Losa        3
Carlos Heredero       6
Alejandro Calvo       5.5
Xavi Serra            5
Peter Bradshaw                 http://www.theguardian.com/film/2014/may/15/cannes-party-girl-review-un-certain-regard

"THAT LOVELY GIRL (HARCHECK MI HEADRO)" (Keren YEDAYA) [Un Certain Regard]
Diego Batlle          4
Diego Lerer           3
Carlos Heredero       6
Giona Nazzaro         1

"THE BLUE ROOM" (Mathieu AMALRIC) [Un Certain Regard]

"AMOUR FOU" (Jessica HAUSNER) [Un Certain Regard]

"RUN" (Philippe LACOTE) [Un Certain Regard]

"ELEANOR RIGBY" (Ned BENSON) [Un Certain Regard]

"WHITE GOD (Fehér Isten)" (Kornel Mundruczo) [Un Certain Regard]

"TOURIST" (Ruben OSTLUND) [Un Certain Regard]

"HERMOSA JUVENTUD (Beautiful Youth)" (Jaime ROSALES) [Un Certain Regard]
Ángel Quintana     6.5
Inma Merino        6.5

"JAUJA" (Lisandro ALONSO) [Un Certain Regard]
Roger Koza         10
Diego Batlle          8.5
Diego Lerer        10

"A GIRL AT MY DOOR (DOHEE-YA)" (July JUNG aka JUNG Joo-Ri) [Un Certain Regard]

"XENIA" (Panos KOUTRAS) [Un Certain Regard]

"BIRD PEOPLE" (Pascale FERRAN) [Un Certain Regard]

"TITLI" (Kanu BEHL) [Un Certain Regard]

"LOST RIVER" (Ryan GOSLING) [Un Certain Regard]

"THE SALT OF THE EARTH" (Wim WENDERS and Juliano Ribeiro SALGADO) [Un Certain Regard]

"FANTASIA" (Wang CHAO) [Un Certain Regard]

"SNOW IN PARADISE" (Andrew HULME) [Un Certain Regard]

"CHARLIE’S COUNTRY" (Rolf de HEER) [Un Certain Regard]

"INCOMPRESA (The Misunderstood)" (Asia ARGENTO) [Un Certain Regard]


SPECIAL SCREENINGS

"GRACE OF MONACO" (Olivier DAHAN) [Out of Competition]
  http://www.festival-cannes.fr/en/
Scott Foundas         2
Roger Koza            2
Alexandra Zawia       
Robert Koehler        
Diego Batlle          5
Diego Lerer           4
Fernando Ganzo        0.5
Eulàlia Iglesias     2.5
Ángel Quintana       2
José Luis Losa       
Pedro Butcher         3
Jose Luis De Lorenzo  
Alex Vicente          
Carlo Chatrian        4
Violeta Kovacsics     
Luciano Monteagudo    3
Jaime Pena            0.5
Rüdiger Suchsland    
Carlos Heredero       
Luciano Barisone      
Giona Nazzaro         1
Dana Linssen          
Cristina Nord         1.5
Francisco Ferreira    1
Cecilia Martinez      
Paolo Moretti         
Neil Young            
Ronald Rovers         2
Marcelo Alderete      
Michal Oleszczyk      1.5
Manu Yañez           
Carlos Reviriego      
Fernando Juan Lima    
Paolo Bertolin        
Nando Salva           
Philip Engel          
Inma Merino           1
Fredy Friedlander     
Pablo Scholz          
Alejandro Calvo       
Xavi Serra            1.5
Guido Castillo        
Pamela Bienzobas      
Javier Estrada        2.5
Boris Nelepo          
# criticwire
Kevin Jagernauth        
Ryland Aldrich          
Craig Skinner           
Alex Billington         
Patrick McGavin         
Mike d'Angelo           3.3	https://twitter.com/gemko/status/466516357241376768
Michael Sennhauser      
John Bleasdale          
Marc van de Klashorst   
Catherine Shoard     
Eric Kohn   		5	http://www.indiewire.com/article/cannes-review-nicole-kidman-is-a-solid-grace-kelly-in-grace-of-monaco-but-is-it-fact-or-fiction           
Peter Bradshaw       2      http://www.theguardian.com/film/2014/may/14/grace-of-monaco-cannes-review-nicole-kidman
Jonathan Romney      2      http://www.bfi.org.uk/news-opinion/sight-sound-magazine/comment/festivals/cannes-2013-close-physical
Stephen Dalton       2      http://www.hollywoodreporter.com/review/grace-monaco-cannes-review-703460
Oliver Lyttleton     0      http://blogs.indiewire.com/theplaylist/cannes-review-olivier-dahans-grace-of-monaco-starring-nicole-kidman-tim-roth-20140514 
Robbie Collin        2      http://www.telegraph.co.uk/culture/film/filmreviews/10829756/Grace-of-Monaco-Cannes-2014-review.html
Nicholas Barber      2      http://www.bbc.com/culture/story/20140514-review-princess-grace-of-monaco
Richard Corliss      2      http://time.com/98922/review-grace-of-monaco-scandal/
Fionnuala Hannigan   2      http://www.screendaily.com/reviews/the-latest/grace-of-monaco/5071634.article
Scott Foundas        2	    http://variety.com/2014/film/reviews/cannes-film-review-grace-of-monaco-1201180574/
Guy Lodge            	    http://www.hitfix.com/in-contention/review-grace-of-monaco-opens-cannes-on-a-graceless-note
Peter Labuza	     2      http://thefilmstage.com/reviews/cannes-review-grace-of-monaco/
Jamie Graham		    http://www.totalfilm.com/news/cannes-2014-grace-of-monaco-reaction-review-1  
David Jenkins		    http://www.littlewhitelies.co.uk/features/festivals/cannes-2014-grace-of-monaco-26700
Jordan Hoffman	     3	    http://www.vanityfair.com/vf-hollywood/grace-of-monaco-cannes?mbid=social_twitter

"HOW TO TRAIN YOUR DRAGON 2" (Dean DEBLOIS) [Out Of Competition]

"SILVERED WATER, SYRIA SELF-PORTRAIT (EAU ARGENTEE)" (Mohammed OSSAMA) [Special Screening]
Carlo Chatrian        9.5
Luciano Monteagudo    8.5
Luciano Barisone      9
Giona Nazzaro         8

"RED ARMY" (Gabe POLSKY) [Special Screening]

"KHALIL GIBRAN’S THE PROPHET" (Roger Allers) [Special Screening]

"THE SALVATION" (Kristian LEVRING) [Special Screening]

"THE OWNERS" (Adilkhan Yerzhanov) [Special Screening]

"THE ROVER" (David MICHOD) [Special Screening]

"CARICATURISTES – FANTASSINS DE LA DEMOCRATIE" (Stephanie VALLOATTO) [Special Screening]

"EL ARDOR" (Pablo Fendrik) [Special Screening]

"COMING HOME" (Zhang YIMOU) [Out Of Competition]

"LES GENS DU MONDE (People of the World)" (Yves JEULAND) [Out Of Competition]

"GERONIMO" (Tony Gatlif) [Special Screening]

"IN THE NAME OF MY DAUGHTER" (Andre Techine) [Out Of Competition]

"OF MEN AND WAR" (Laurent Bécue-Renard) [Special Screening]

"MAIDAN" (Sergei LOZNITSA) [Special Screening]

"THE BRIDGES OF SARAJEVO" (various directors) [Special Screening]

"THE TARGET (PYOJEOK)" (YOON Hong-seung aka Chang) [Special Screening]
Paolo Bertolin   5


SEMAINE
"FAIRE: L'AMOUR" (Djinn CARRÉNARD) [Semaine]

"DARKER THAN MIDNIGHT (Più Buio di Mezzanotte)" (Sebastiano RISO) [Semaine]

"THE TRIBE (Plemya)" (Myroslav SLABOSHPYTSKIY) [Semaine]

"IT FOLLOWS" (David Robert MITCHELL) [Semaine]

"GENTE DE BIEN" (Franco LOLLI) [Semaine]

"WHEN ANIMALS DREAM (Når Dyrene Drømmer)" (Jonas Alexander ARNBY) [Semaine]

"HOPE" (Boris LOJKINE) [Semaine]

"SELF MADE (Boreg)" (Shira GEFFEN) [Semaine]

"HIPPOCRATES" (Thomas LILTI) [Semaine]

"BREATHE" (Mélanie LAURENT) [Special Screening]

"THE KINDERGARTEN TEACHER (Haganenet)" (Nadav LAPID) [Special Screening]

QUINZAINE

"BANDE DE FILLES (Girlhood)" (Céline SCIAMMA) [Quinzaine]
Luciano Barisone      5.5

"CATCH ME DADDY" (Daniel WOLFE) [Quinzaine]

"GETT – LE PROCÈS DE VIVIANNE AMSALEM (Gett, The Trial Of Viviane Amsallem)" (Ronit et Shlomi ELKABETZ) [Quinzaine]

"NATIONAL GALLERY" (Frederick WISEMAN) [Quinzaine]

"LES COMBATTANTS (Fighters)" (Thomas CAILLEY) [Quinzaine]

"A HARD DAY" (KIM Seong-Hun) [Quinzaine]
Paolo Bertolin     7

"REFUGIADO" (Diego LERMAN) [Quinzaine]

"MANGE TES MORTS (Eat Your Bones)" (Jean-Charles HUE) [Quinzaine]

"COLD IN JULY" (Jim MICKLE) [Quinzaine]
  Sundance Midnight

"THESE FINAL HOURS" (Zach HILDITCH) [Quinzaine]

"QUEEN AND COUNTRY" (John BOORMAN) [Quinzaine]

"WHIPLASH" (Damien CHAZELLE) [Quinzaine]
  Sundance

"TU DORS NICOLE" (Stéphane LAFLEUR) [Quinzaine]

"LE CONTE DE LA PRINCESSE KAGUYA (The Story Of Princess Kaguya)" (Isao TAKAHATA) [Quinzaine]

"NEXT TO HER (AY LI LAYLA)" (Asaf KORMAN) [Quinzaine]

"ALLELUIA" (Fabrice du WELZ) [Quinzaine]

"PRIDE" (Matthew WARCHUS) [Quinzaine]

"P’TIT QUINQUIN" (Bruno DUMONT) [Special Screening]


EOF

our @critics;
$critics[0] = "
Alejandro G. Calvo (Sensacine, España) 
Alex Vicente (Público, España) 
Alexandra Zawia (Wiener Zeitung, Furche, Celluloid, Austria)
Ángel Quintana (Cahiers du cinema Espana, España)
Antoine Thirion (Cinema Scope, ex-Cahiers du cinéma, France)
Boris Nelepo (Kinote daily, Russia)
Carlo Chatrian (Festival de Locarno, Italy) 
Carlos Heredero (Caimán CDC, España) 
Carlos Reviriego (elcultural.es y de Caiman. Cuadernos de cine, España) 
Cecilia Martinez (A Sala Llena Online, Argentina) 
Cristina Nord (Die Tageszeitung, Deutschland) 
Dana Linssen (De Filmkrant, Netherlands) 
Diego Batlle (La Nación, OtrosCines, Argentina) 
Diego Lerer (Clarín, Micropsia, Argentina) 
Eugenio Renzi (Independencia, France) 
Eulalia Iglesias (RockDeLux y Caimán CDC, España) 
Fernando Ganzo (Lumiere, España) 
Fernando Juan Lima (El Amante, Argentina) 
Francisco Ferreira (Expresso, Portugal) 
Jaime Pena (El Amante, España, Argentina) 
Jose Luis De Lorenzo (A Sala Llena, Argentina) 
José Luis Losa (Cineuropa, España)
Kieron Corless (Time Out London, UK)
Luciano Barisone (Duellanti/Panoramiche, Italy) 
Luciano Monteagudo (Página/12, Argentina) 
Marcelo Alderete (Festival de Mar del Plata, Argentina) 
Michal Oleszczyk (Hammer to Nail, USA)
Nando Salva (El Periódico, España) 
Neil Young (Hollywood Reporter, Tribune, UK) 
Pablo O. Scholz (Clarín, Argentina)
Paolo Bertolin (Venice International Film Festival, Italy) 
Paolo Moretti (Italy) 
Pedro Butcher (Folha do Sao Paulo, Filme B, Brazil) 
Philipp Engel (Go Mag, España) 
Robert Koehler (Variety, USA) 
Roger Alan Koza (La Voz del Interior, Con los ojos abiertos, Argentina) 
Roger Koza (La Voz del Interior, Con los ojos abiertos, Argentina) 
Rüdiger Suchsland (FAZ, Negativ-film, Deutschland) 
Scott Foundas (Film Comment, USA) 
Violeta Kovacsics (Caimán Cuadernos de Cine, España) 
Javier H. Estrada (Caimán CDC, España) 
Pamela Bienzobas (Mabuse, Chile) 
Xavi Serra (Ara, España) 
Guido Castillo (Freelance, España)
Ronald Rovers (Cinema.nl, Netherlands)
Alvaro Arroba (Cinema Scope, España)
Fredy Friedlander (Leedor.com, Argentina) http://www.leedor.com/contenidos/cine/66o-festival-de-cannes
";
# ioncinema
$critics[1] = "
Nicolas Bell (Ioncinema.com, Canada)
Christophe Beney (Palmares magazine, France) 
David Calhoun (Time Out London, UK) 
Per Juul Carlsen (Danish National Radio, Denmark) 
Mike d'Angelo (AV Club, USA) 
Carlos F. Heredero (Cahiers du cinema Espana, España) 
Raffi Asdourian (The FilmStage.com, USA)
Eric Kohn (Indiewire, USA) 
Eric Lavallée (Ioncinema.com, Canada) 
Fabien Lemercier (Cineeuropa.org, Belgium) 
Guy Lodge (Variety, InContention, South Africa, USA) 
Liu Min (Sina.com, China) 
Isabelle Regnier (Le Monde, France) 
Cédric Succivalli (International Cinephil Society, France) 
Clarence Tsui (South China Morning Post, Hong Kong) 
Blake Williams (Ioncinema.com, Canada) 
";
# Le film français 0-4
$critics[2] = "
Stéphanie Lamome (Premiere, France)
Arnaud Schwartz (la Croix, France)
Fabrice Leclerc (Studio ciné live, France)
Eric Neuhoff (Le Figaro, France)
Stéphane Delorme (Cahiers du cinema, France)
Thomas Sotinel (Le Monde, France)
Philippe Rouyer (Positif, France)
Pierre Vavasseur (le Parisien, France)
Pierre Murat (Telerama, France)
Jean Roy (l'Humanite, France)
Serge Kaganski (Les Inrockuptibles, France)
Pierre Fornerod (oeust france, France)
Pascal Merigeau (Observateur, France)
Danielle Attali (Le Journal du Dimanche, France)
Christophe Carriére (L'Express, France)
";
# screen daily 0-4
# http://issuu.com/emap_/docs/screen_cannes_day_1_2013
$critics[3] = "
Nick James (Sight & Sound, UK) 
David Stratton (The Australian, Australia) 
Derek Malcolm (London Evening, UK) 
Jan Schulz-Ojala (Der Tagesspiegel, Deutschland) 
Jose Carlos Avellar (Escrevercinema.com, Brazil) 
Dennis Lim (New York Times, USA)
Michel Ciment (Positif, France) 
Kate Muir/Wendy Ide (The Times, UK) 
Kate Muir (The Times, UK) 
Wendy Ide (The Times, UK) 
Bo Green Jensen (Weekandavisen Berlingske, Denmark) 
Screen International (Screen International, USA) 
";
# critic.de +++ 9, ++ 7.5, + 6, +- 5, - 4, -- 2.5, --- 1
$critics[4] = "
Adam Cook (MUBI, USA)
Arnaud Hée (Critikat.com, France)
Christoph Huber (Die Presse, Austria)
Frédéric Jaeger (critic.de, Deutschland)
Till Kadritzke (critic.de, Deutschland)
Daniel Kasman (MUBI, USA)
Michael Kienzl (critic.de, Deutschland)
";
# TF1.fr
$critics[5] = "
Aurelien Allin (Cinemateaser, France)
Evangeline Barbaroux (LCI, France)
Thomas Baurez (Studio CineLive, France)
Stephanie Belpeche (JDD, France)
Roman Blondaeu (Les Inrockuptibles, France)
Stephanie Lamome (First, France)
Roman Vern (TF1 News, France)
Mehdi Omais (Metro, France)
Philippe Rouyer (Positif, France)
";
# indiewire + various other
$critics[6] = "
A.A. Dowd (Time Out Chicago, USA)
Aaron Hillis (GreenCine Daily, USA)
Adam Batty (Hope Lies at 24 Frames Per Second, UK)
Alex Billington (FirstShowing.net, USA)
Allan Hunter (Screen Daily, USA)
Allison Loring (Film School Rejects, USA)
Andrei Creţulescu (HBO, Romania) 
Andrew O'Hehir (Salon.com, USA) 
Anna Bielak (Smells Like Screen Spirit, USA)
Anna Tatarska (Fandor, KINO, USA)
Anne Thompson (Indiewire, USA) 
Beatrice Behn (Kino-Zeit, Deutschland)
Boyd van Hoeij (The Hollywood Reporter, Winq/Mate, Filmkrant, Cineuropa, Ex-Variety, Luxembourg)
Brian Brooks (indieWIRE, USA) 
Caryn James (indieWIRE, ex-New York Times, USA)
Catherine Shoard (Guardian, UK)
Chris Knipp (Filmleaf, USA)
Clementine Gallot (Cahiers du cinema, France)
Craig Skinner (Craig Skinner on Film, HeyUGuys, BleedingCool, UK)
Craig Williams (Cine Vue, UK)
David Edelstein (New York Magazine-Vulture, USA)
David Ehrlich (Movies.com, Box Office Magazine, Reverse Shot)
David Fear (Time Out New York, USA) 
David Gritten (The Telegraph, UK)
David Jenkins (Little White Lies blog, UK)
David Rooney (The Hollywood Reporter, USA)
David Sterrit (Tikkun Magazine, USA)
Don Simpson (Smells Like Screen Spirit, USA)
Drew McWeeny (InContention, USA)
Drew Taylor (The Playlist, USA)
Eduardo Valente (Revista Cinema, Brazil) 
Elisabeth Quin (Paris Premiere, France) 
Emanuel Levy (EmanuelLevy.com, USA)
Eric D. Snider (Film.com, USA)
Ethan Anderton (FirstShowing.net, USA)
Eugene Hernandez (Film Society of Lincoln Center, USA) 
Fico Cangiano (CineXpress, Puerto Rico)
Fionnuala Hannigan (Screen Daily, USA)
Frédéric Jaeger (critic.de, Deutschland)
Glenn Heath Jr (Slant Magazine, Press Play, USA)
Ignatiy Vishnevetsky (Freelance, USA)
James Rocchi (MSN Movies, Indiewire's The Playlist, USA) 
Jessica Kiang (The Playlist, USA)
Jo Ann Titmarsh (FlickeringMyth.com, UK)
Joachim Kurz (Kino-Zeit, Deutschland)
Joe Bendel (Libertas Film Magazine, The Epoch Times, USA)
John Bleasdale (Cine Vue, UK)
Jon Frosch (France 24, France)
Jonathan Romney (Sight&Sound, UK)
Jonathan Rosenbaum (Chicago Reader, USA) 
Jordan Hoffman (Film.com, ScreenCrush.com, Badass Digest, USA)
Jordan Raup (The Film Stage, USA)
Justin Chang (Variety, USA)
Kaleen Aftab (The Independent, UK)
Karina Longworth (LA Weekly, USA) 
Keith Uhlich (Time Out New York, USA)
Kevin Jagernauth (Indiewire's The Playlist, USA) 
Kirk Honeycott (The Hollywood Reporter, USA)
Kristy Puchko (Freelance, USA)
Laremy Legel (Film.com, USA) 
Leda Galanou (Flix, France)
Lee Marshall (Screen Daily, USA)
Logan Hill (Vulture, New York Times, This American Life, WSJ, Rolling Stone, Wired, GQ, USA)
Manohla Dargis (New York Times, USA)
Marc van de Klashorst (IntlCinephileSociety, Netherlands)
Mark Adams (Screen Daily, USA)
Mathilde Cesbron (Le Figaro, France)
Matt Holmes (Obsessedwithfilm.com, USA) 
Maxime Pargaud (Le Figaro, France)
Michael Ghennam (Les Fiches du Cinéma, France)
Michael Giltz (The Huffington Post, USA) 
Michael Sennhauser (SRF, Suisse)
Nev Pierce (Empire, USA)
Oliver Lyttleton (The Playlist, USA)
Patrick Heidmann (Cineman, Deutschland)
Patrick McGavin (Light Sensitive, Stop Smiling, The Nation, USA)
Paul Martin (Indies Movies Online, USA) 
Pete Hammond (Boxoffice Magazine, USA) 
Peter Bradshaw (Guardian, UK) 
Peter Debruge (Variety, USA) 
Peter Howell (The Toronto Star, USA) 
Peter Keogh (Boston Phoenix, USA)
Peter Knegt (indieWIRE, USA) 
Raffi Asdourian (The Film Stage, USA)
Richard Corliss (Time, USA)
Robbie Collin (The Telegraph, UK)
Robert Gassaway (The Flicksation Podcast, USA)
Rodrigo Perez (The Playlist, USA)
Ruta Buciunaite (theupcoming.co.uk, UK)
Ryland Aldrich (Twitch Film, USA)
Sebastian Doggart (Guardian, UK)
Shaun Munro (filmschoolrejects.com, USA)
Simon Abrams (The Playlist, USA)
Simon Gallagher (filmschoolrejects.com, UK) 
Simon Reynolds (Digital Spy, UK) 
Stephen Dalton (The Hollywood Reporter, USA)
Stephen Garrett (Time Out New York, USA)
Sukhdev Sandhu (Telegraph, UK) 
Tim Grierson (Screen International, L.A. Weekly, USA) 
Tim Robey (Daily Telegraph, England)
Todd McCarthy (The Hollywood Reporter, USA) 
Xan Brooks (Guardian, UK)
Yair Raveh (Cinema Scope, Israel)
Peter Labuza (The Film Stage, USA)
Jamie Graham (Total Film, )
";
# former apichatpoll members
$critics[7] = "
Arthur Mas (Independencia, France) 
Camille Brunel (Independencia, France) 
Gabriele Barrera (Segnocinema, Duellanti, Blow Up, Best Movie, Italy) 
Gonzalo de Pedro (Caimán, CDC, España) 
Kong Rithdee (The Bangkok Post, Thailand) 
Manu Yáñez (Fotogramas, OtrosCines, España) 
Martial Pisani (Independencia, France) 
Noémie Luciani (Independencia, France) 
Olivier Père (Les Inrockuptibles, France) 
Sergio Wolf (BAFICI, Argentina) 
Thomas Fioretti (Independencia, France) 
";

# http://lci.tf1.fr/cinema/news/festival-de-cannes-2013-les-etoiles-de-la-presse-cinema-7961575.html

our $HEADER = <<"EOF";

<small>Collected and updated daily by Reini Urban from 7 critic polls.
The ApichatPoll http://www.todaslascriticas.com.ar/cannes (Diego Lerer+Javier Fish) (la crema),
http://www.ioncinema.com/ (okay),
Le film français (eclectic),
http://jury.critic.de/cannes/ (german),
Screen Daily (US/UK mainstream),
more french TF1.fr,
Indiewire (mixed), metacritic
and more individual critics.<br>

<br>
<b>Ratings</b>:<br>
0-10 points, only &gt;6.00 avg and &gt;3 international critics [avg/num stddev].<br>
Critics with stddev &gt;2.5: filtered out
<i>(Filtered to help with inaccuracies with low numbers).</i><br>
<b>Formatting</b>:<br>
stddev &gt;2: <i>controversial (italic)</i>.<br>
&lt;10 ratings: small.<br>
Competition: <b>bold</b><br>
 <br>
All sections updated daily. </small><p>

EOF

our $FOOTER = "
<pre>
--
Source & History:
https://github.com/rurban/cannes-rurban.rhcloud.com/blob/master/openshift/lib/Cannes/rurban/2014.pm

</pre>";

$HEADER =~ s{(https?)://(.+?) }{<a href="$1://$2">$2</a> }g;
$FOOTER =~ s{(https?)://(.+)\n}{<a href="$1://$2">$2</a>\n}g;
1;
