package Cannes::rurban::2013;

#!/usr/bin/perl -- -*- perl -*-
# Cannes 2013 Critics Ratings
# collected by Diego Lerer, ioncinema, indiewire and Reini Urban
# Recalc and sort ratings by all cannes critics from
# ??
# and 16 more western critics from http://www.ioncinema.com/ (scaled to 0-10)
# french: http://www.lefilmfrancais.com/cannes2012/quotidien/ (scale 0-4)
# http://content.yudu.com/Library/A1wwqk/ScreenCannesDay92012/resources/index.htm (scale 0-4)
# us: http://www.indiewire.com/article/cannes-2012-a-guide-to-all-the-films
# Published at http://cannes-rurban.rhcloud.com/2013
# History at https://github.com/rurban/cannes-critics-ratings
# Perl script by Reini Urban (c) 2010, 2011, 2012, 2013
# US ratings:
# A+ 10   A 9   A- 8
# B+ 7    B 6   B- 5
# C+ 4    C 3   C- 2
# D+ 1.5  D 1
# E 0.5   F 0
# Le film français+Screen Daily 0-4: 0-1, 1-2.5, 2-5, 3-7.5, 4-9
# British 0-5: x2

use utf8;
our $DATA= <<'EOF';

"HELI" (Amat ESCALANTE) [Competition]
  http://www.festival-cannes.fr/en/archives/ficheFilm/id/11409854/year/2013.html
Roger Alan Koza      
Diego Batlle         4.5
Diego Lerer          6
Alex Vicente         
José Luis de Lorenzo 1
Cecilia Martinez     4
Fernando Ganzo       
Eulàlia Iglesias     6
Ángel Quintana       6
José Luis Losa       7.5
Pedro Butcher        
Kieron Corless       
Luciano Barisone     7
Carlo Chatrian       
Violeta Kovacsics    3
Luciano Monteagudo   4
Jaime Pena           4
Rüdiger Suchsland    7.5
Carlos Heredero      5.5
Robert Koehler       4
Dana Linssen         
Cristina Nord        4.5
Francisco Ferreira   
Paolo Moretti        
Neil Young           4.5       http://www.jigsawlounge.co.uk/film/reviews/canas13/
Scott Foundas        
Marcelo Alderete     
Alexandra Zawia      5.5
Boris Nelepo         1
Carlos Reviriego     6.5
Fernando Juan Lima   5
Paolo Bertolin       
Nando Salva          4
Philipp Engel        7
Eugenio Renzi        
Michal Oleszczyk     7.5
Pablo O. Scholz      4.5
Alejandro G. Calvo   2
Xavi Serra           5.5
Guido Castillo       5
Ronald Rovers        7.5
Javier H. Estrada    4.5
Rose Kuo             
Pamela Bienzobas     
Alvaro Arroba        

Kevin Jagernauth     5        http://blogs.indiewire.com/theplaylist/cannes-review-heli-a-beautifully-shot-but-despairing-look-at-corrupted-lives-20130515
Mike d'Angelo        4.4      https://twitter.com/gemko/status/334789622339076096
Michael Sennhauser (SRF, Suisse) http://sennhausersfilmblog.ch/2013/05/16/cannes-13-heli-von-amat-escalante/

"JEUNE & JOLIE (YOUNG & BEAUTIFUL)" (François OZON) [Competition]
  http://www.festival-cannes.fr/en/archives/ficheFilm/id/11409938/year/2013.html
Roger Koza            
Diego Batlle          6
Diego Lerer           6
Alex Vicente          
Jose Luis De Lorenzo  7
Cecilia Martinez      8
Fernando Ganzo        4
Eulàlia Iglesias     7
Ángel Quintana       7
José Luis Losa       6
Pedro Butcher         
Kieron Corless        
Luciano Barisone      6
Carlo Chatrian        
Violeta Kovacsics     
Luciano Monteagudo    5.5
Jaime Pena            5
Rüdiger Suchsland    7
Carlos F. Heredero    5
Robert Koehler        5
Dana Linssen          
Cristina Nord         4
Francisco Ferreira    
Paolo Moretti         
Neil Young            
Scott Foundas         
Marcelo Alderete      
Alexandra Zawia       6.5
Boris Nelepo          3
Carlos Reviriego      6.5
Fernando Juan Lima    
Paolo Bertolin        
Nando Salva           7.5
Philip Engel          7.5
Eugenio Renzi         
Michal Oleszczyk      6.5
Pablo O. Scholz       6
Alejandro G. Calvo    
Xavi Serra            6
Guido Castillo        
Ronald Rovers         
Javier H. Estrada     4.5
Rose Kuo              
Pamela Bienzobas      
Alvaro Arroba         
Mike d'Angelo        6.6 https://twitter.com/gemko/status/334944057300246529
Eric Kohn            7   http://www.indiewire.com/article/cannes-sofia-coppolas-the-bling-ring-and-francois-ozons-young-and-beautiful-find-teens-living-dangerously
Kevin Jagernauth     3   http://blogs.indiewire.com/theplaylist/review-being-young-beautiful-isnt-easy-in-francois-ozons-latest-20130516
Michael Sennhauser (SRF, Suisse) http://sennhausersfilmblog.ch/2013/05/16/cannes-13-jeune-et-jolie-von-franois-ozon/
Jo Ann Titmarsh (FlickeringMyth.com, UK) 4.5 http://www.flickeringmyth.com/2013/05/66th-cannes-film-festival-review-jeune.html

"TIAN ZHU DING (A TOUCH OF SIN)" (JIA Zhangke) [Competition]
  http://www.festival-cannes.fr/en/archives/ficheFilm/id/11409320/year/2013.html
Roger Koza            
Diego Batlle          7.5
Diego Lerer           8.5
Alex Vicente          
Jose Luis De Lorenzo  
Cecilia Martinez      
Fernando Ganzo        3
Eulàlia Iglesias     6.5
Ángel Quintana       8.5
José Luis Losa       7
Pedro Butcher         
Kieron Corless        
Luciano Barisone      8
Carlo Chatrian        5
Violeta Kovacsics     
Luciano Monteagudo    
Jaime Pena            9
Rüdiger Suchsland    
Carlos F. Heredero    7.5
Robert Koehler        
Dana Linssen          
Cristina Nord         8
Francisco Ferreira    
Paolo Moretti         
Neil Young            
Scott Foundas         
Marcelo Alderete      
Alexandra Zawia       8.5
Boris Nelepo          
Carlos Reviriego      
Fernando Juan Lima    
Paolo Bertolin        
Nando Salva           6.5
Philip Engel          
Eugenio Renzi         
Michal Oleszczyk      8.5
Pablo O. Scholz       
Alejandro G. Calvo    4
Xavi Serra            7.5
Guido Castillo        
Ronald Rovers         6.5
Javier H. Estrada     8.5
Rose Kuo              
Pamela Bienzobas      
Alvaro Arroba         
Mike d'Angelo        5.9      https://twitter.com/gemko/status/335075307751108608

"LE PASSÉ (THE PAST)" (Asghar FARHADI) [Competition]
  http://www.festival-cannes.fr/en/archives/ficheFilm/id/11407556/year/2013.html
Diego Batlle          6.5
Eulàlia Iglesias      6.5
José Luis Losa        6
Rüdiger Suchsland     8
Nando Salva           8
Ronald Rovers         7.5

"JIMMY P. (PSYCHOTHERAPY OF A PLAINS INDIAN)" (Arnaud DESPLECHIN) [Competition]
  http://www.festival-cannes.fr/en/archives/ficheFilm/id/11409900/year/2013.html

"SOSHITE CHICHI NI NARU (Like Father, Like Son)" (KORE-EDA Hirokazu) [Competition]
  http://www.festival-cannes.fr/en/archives/ficheFilm/id/11406706/year/2013.html

"BORGMAN" (Alex VAN WARMERDAM) [Competition]
  http://www.festival-cannes.fr/en/archives/ficheFilm/id/11409861/year/2013.html

"INSIDE LLEWYN DAVIS" (Ethan COEN, Joel COEN) [Competition]
  http://www.festival-cannes.fr/en/archives/ficheFilm/id/11405872/year/2013.html

"WARA NO TATE (Shield of Straw)" (Takashi MIIKE) [Competition]
  http://www.festival-cannes.fr/en/archives/ficheFilm/id/11408059/year/2013.html

"UN CHÂTEAU EN ITALIE (A CASTLE IN ITALY)" (Valeria BRUNI TEDESCHI) [Competition]
  http://www.festival-cannes.fr/en/archives/ficheFilm/id/11409902/year/2013.html

"BEHIND THE CANDELABRA" (Steven SODERBERGH) [Competition]
  http://www.festival-cannes.fr/en/archives/ficheFilm/id/11407636/year/2013.html
Alejandro G. Calvo 0

"LA GRANDE BELLEZZA (THE GREAT BEAUTY)" (Paolo SORRENTINO) [Competition]
  http://www.festival-cannes.fr/en/archives/ficheFilm/id/11409775/year/2013.html

"ONLY GOD FORGIVES" (Nicolas WINDING REFN) [Competition]
  http://www.festival-cannes.fr/en/archives/ficheFilm/id/11408165/year/2013.html
Ronald Rovers         8

"GRIGRIS" (Mahamat-Saleh HAROUN) [Competition]
  http://www.festival-cannes.fr/en/archives/ficheFilm/id/11409856/year/2013.html

"NEBRASKA" (Alexander PAYNE) [Competition]
  http://www.festival-cannes.fr/en/archives/ficheFilm/id/11409873/year/2013.html

"LA VIE D'ADÈLE - CHAPITRE 1 & 2 (BLUE IS THE WARMEST COLOUR)" (Abdellatif KECHICHE) [Competition]
  http://www.festival-cannes.fr/en/archives/ficheFilm/id/11409897/year/2013.html

"THE IMMIGRANT" (James GRAY) [Competition]
  http://www.festival-cannes.fr/en/archives/ficheFilm/id/11409863/year/2013.html

"MICHAEL KOHLHAAS" (Arnaud DES PALLIÈRES) [Competition]
  http://www.festival-cannes.fr/en/archives/ficheFilm/id/11409909/year/2013.html

"LA VÉNUS À LA FOURRURE (VENUS IN FUR)" (Roman POLANSKI) [Competition]
  http://www.festival-cannes.fr/en/archives/ficheFilm/id/11409865/year/2013.html

"ONLY LOVERS LEFT ALIVE" (Jim JARMUSCH) [Competition]
  http://www.festival-cannes.fr/en/archives/ficheFilm/id/11411996/year/2013.html


UN CERTAIN REGARD

"THE BLING RING" (Sofia COPPOLA) [Un Certain Regard]
Mike d'Angelo        3.2
Kevin Jagernauth     4     http://blogs.indiewire.com/theplaylist/cannes-review-sofia-coppola-the-bling-ring-a-mostly-empty-exercise-in-excess-20130516
Roger Koza           
Diego Batlle         7.5
Diego Lerer          7
Alex Vicente         
José Luis de Lorenzo 6
Cecilia Martinez     6
Fernando Ganzo       5
Eulàlia Iglesias     5.5
Ángel Quintana       5
José Luis Losa       6.5
Pedro Butcher        
Kieron Corless       
Luciano Barisone     4
Carlo Chatrian       
Violeta Kovacsics    
Luciano Monteagudo   7
Jaime Pena           6.5
Rüdiger Suchsland    8.5
Carlos Heredero      6
Robert Koehler       
Dana Linssen         
Cristina Nord        5.5
Francisco Ferreira   
Paolo Moretti        
Neil Young           
Scott Foundas        
Marcelo Alderete     
Alexandra Zawia      3
Boris Nelepo         
Carlos Reviriego     
Fernando Juan Lima   
Paolo Bertolin       
Nando Salva          6.5
Philipp Engel        7.5
Eugenio Renzi        
Michal Oleszczyk     2
Pablo O. Scholz      
Alejandro G. Calvo   7
Xavi Serra           5
Guido Castillo       8
Ronald Rovers        7.5
Javier H. Estrada    6.5
Rose Kuo             
Pamela Bienzobas     
Alvaro Arroba        
Eric Kohn            6   http://www.indiewire.com/article/cannes-sofia-coppolas-the-bling-ring-and-francois-ozons-young-and-beautiful-find-teens-living-dangerously
Peter Bradshaw       6   http://www.guardian.co.uk/film/2013/may/16/bling-ring-cannes-2013-review
Guy Lodge            7   http://www.hitfix.com/in-contention/review-sofia-coppola-flips-the-celebrity-mirror-in-taut-smart-the-bling-ring
Mark Adams (Screen Daily, USA)               http://www.screendaily.com/reviews/the-latest/the-bling-ring/5056168.article
David Jenkins (Little White Lies blog, UK)   http://www.littlewhitelies.co.uk/features/festivals/cannes-2013-the-bling-ring-review-23895
Kaleem Aftab (The Independent, UK)   8	     http://www.independent.co.uk/arts-entertainment/films/reviews/the-bling-ring-review-emma-watson-leaves-hermoine-behind-in-sofia-coppolas-new-film-8618418.html
Cath Clarke (Time Out London, UK) 8 http://www.timeout.com/london/film/the-bling-ring
Robbie Collin (The Telegraph, UK) 8 http://www.telegraph.co.uk/culture/film/cannes-film-festival/10061235/Cannes-2013-The-Bling-Ring-review.html
Scott Foundas           http://variety.com/2013/film/reviews/cannes-film-review-the-bling-ring-1200482052/
Graham Fuller (Vanity Fair) http://www.vanityfair.com/hollywood/2013/06/movie-review-sofia-coppola-bling-ring
Todd McCarthy http://www.hollywoodreporter.com/movie/bling-ring/review/523429
Matt Mueller (Thompson on Hollywood, US) http://blogs.indiewire.com/thompsononhollywood/cannes-review-coppolas-the-bling-ring
Michael Sennhauser (SRF, Suisse) http://sennhausersfilmblog.ch/2013/05/16/cannes-13-the-bling-ring-von-sofia-coppola/

"FRUITVALE STATION" (Ryan COOGLER) [Un Certain Regard]
  Sundance - Main Prices
Eric Kohn (Indiewire, USA) 8.3 http://www.indiewire.com/article/sundance-review-ryan-cooglers-fruitvale-renders-a-tragic-police-shooting-in-personal-terms
Todd McCarthy (The Hollywood Reporter, USA) 8 http://www.metacritic.com/movie/fruitvale-station/critic-reviews
Geoff Berkshire (Variety, USA) 5 http://www.metacritic.com/movie/fruitvale-station/critic-reviews
Roger Alan Koza      
Diego Batlle         6.5
Diego Lerer          5.5
Alex Vicente         
José Luis de Lorenzo 9
Cecilia Martinez     7
Fernando Ganzo       
Eulàlia Iglesias     4
Ángel Quintana       4.5
José Luis Losa       1
Pedro Butcher        
Kieron Corless       
Luciano Barisone     5
Carlo Chatrian       
Violeta Kovacsics    
Luciano Monteagudo   
Jaime Pena           4
Rüdiger Suchsland    
Carlos Heredero      
Robert Koehler       
Dana Linssen         
Cristina Nord        
Francisco Ferreira   
Paolo Moretti        
Neil Young           5     https://twitter.com/JigsawLounge/status/335142409858072576
Scott Foundas        
Marcelo Alderete     
Alexandra Zawia      1.5
Boris Nelepo         
Carlos Reviriego     1
Fernando Juan Lima   
Paolo Bertolin       
Nando Salva          1
Philipp Engel        2.5
Eugenio Renzi        
Michal Oleszczyk     
Pablo O. Scholz      6
Alejandro G. Calvo   4
Xavi Serra           4
Guido Castillo       6
Ronald Rovers        
Javier H. Estrada    3.5
Rose Kuo             
Pamela Bienzobas     
Alvaro Arroba        
Mike d'Angelo        w/o      https://twitter.com/gemko/status/335147871613640704
Jo Ann Titmarsh (FlickeringMyth.com, UK) 8 http://www.flickeringmyth.com/2013/05/66th-cannes-film-festival-review.html

"L'INCONNU DU LAC (Stranger by the Lake)" (Alain GUIRAUDIE) [Un Certain Regard]
Diego Lerer          5.5
Eulàlia Iglesias     7.5
Alejandro G. Calvo   7

"MIELE" (Valeria GOLINO) [Un Certain Regard]
  (Italy premiered already Mai 1st)
Lee Marshall (Screen Daily, USA)  http://www.screendaily.com/reviews/the-latest/miele/5054710.article?blocktitle=UN-CERTAIN-REGARD&contentID=40442

"GRAND CENTRAL" (Rebecca ZLOTOWSKI) [Un Certain Regard]

"BENDS" (Flora LAU) [Un Certain Regard]

"L'IMAGE MANQUANTE (The missing picture)" (Rithy PANH) [Un Certain Regard]

"DEATH MARCH" (Adolfo ALIX JR.) [Un Certain Regard]

"OMAR" (Hany ABU-ASSAD) [Un Certain Regard]

"AS I LAY DYING" (James FRANCO) [Un Certain Regard]

"SARAH PRÉFÈRE LA COURSE (SARAH PREFERS TO RUN)" (Chloé ROBICHAUD) [Un Certain Regard]

"LES SALAUDS (BASTARDS)" (Claire DENIS) [Un Certain Regard]

"WAKOLDA" (Lucía PUENZO) [Un Certain Regard]

"LA JAULA DE ORO" (Diego QUEMADA-DIEZ) [Un Certain Regard]

"MY SWEET PEPPER LAND" (Hiner SALEEM) [Un Certain Regard]

"NORTE, HANGGANAN NG KASAYSAYAN (NORTE, THE END OF HISTORY)" (Lav DIAZ) [Un Certain Regard]

"TORE TANZT (NOTHING BAD CAN HAPPEN)" (Katrin GEBBE) [Un Certain Regard]

"DAST-NEVESHTEHAA NEMISOOSAND (Manuscripts Don’t Burn)" (Mohammad RASOULOF) [Un Certain Regard]


OUT OF COMPETITION

"ALL IS LOST" (J.C CHANDOR) [Out of Competition]

"BLOOD TIES" (Guillaume CANET) [Out of Competition]

"LE DERNIER DES INJUSTES (THE LAST OF THE UNJUST)" (Claude LANZMANN) [Out of Competition]

"THE GREAT GATSBY" (Baz LUHRMANN) [Out of Competition]
  (US premiered already May 7)
Stephanie Zacharek (Village Voice, USA) 7 http://www.villagevoice.com/2013-05-08/film/gatsby-s-sometimes-great-but-not-always-good/full/
Todd McCarthy (The Hollywood Reporter, USA) 7 http://www.hollywoodreporter.com/movie/great-gatsby/review/451988
Richard Corliss (Time, USA) 7 http://www.metacritic.com/movie/the-great-gatsby/critic-reviews
David Edelstein (New York Magazine-Vulture, USA) 7 http://www.metacritic.com/movie/the-great-gatsby/critic-reviews
A.O.Scott (New York Times, USA) 7 http://www.metacritic.com/movie/the-great-gatsby/critic-reviews
Scott Foundas (Variety, USA) 6 http://variety.com/2013/film/reviews/the-great-gatsby-review-1200447930/#!1/review-tobey-maguire/
Claudia Puig (USA Today, USA) 5 http://www.usatoday.com/story/life/movies/2013/05/08/great-gatsby-review/2107037/
Eric Kohn (Indiewire, USA) 4.2 http://www.metacritic.com/movie/the-great-gatsby/critic-reviews
Andrew O'Hehir (Salon.com, USA) 4 http://www.metacritic.com/movie/the-great-gatsby/critic-reviews
Keith Uhlich (Time Out New York, USA) 4 http://www.timeout.com/us/film/the-great-gatsby-movie-review
Roger Koza            
Diego Batlle          6
Diego Lerer           6.5
Alex Vicente          
Jose Luis De Lorenzo  2
Cecilia Martinez      5
Fernando Ganzo        0
Eulàlia Iglesias      6
Ángel Quintana        5
José Luis Losa        1
Pedro Butcher         
Kieron Corless        
Luciano Barisone      1
Carlo Chatrian        2
Violeta Kovacsics     
Luciano Monteagudo    5
Jaime Pena            5.5
Rüdiger Suchsland     6.5
Carlos F. Heredero    3
Robert Koehler        2
Dana Linssen          
Cristina Nord         3
Francisco Ferreira    
Paolo Moretti         
Neil Young            
Scott Foundas         
Marcelo Alderete      
Alexandra Zawia       2
Boris Nelepo          6.5
Carlos Reviriego      3
Fernando Juan Lima    8
Paolo Bertolin        
Nando Salva           7
Philip Engel          4
Eugenio Renzi         
Michal Oleszczyk      
Pablo O. Scholz       5
Alejandro G. Calvo    6.5
Xavi Serra            4
Guido Castillo        7
Ronald Rovers         6
Javier H. Estrada     3
Rose Kuo              
Pamela Bienzobas      
Alvaro Arroba         
Michael Sennhauser (SRF, Suisse) http://sennhausersfilmblog.ch/2013/05/15/cannes-13-the-great-gatsby-von-baz-luhrman/

"ZULU" (Jérôme SALLE) [Out of Competition]

MIDNIGHT PROJECTIONS

"MONSOON SHOOTOUT" (Amit KUMAR) [Out of Competition]

"BLIND DETECTIVE" (Johnnie TO) [Out of Competition]

SPECIAL SCREENINGS

"STOP THE POUNDING HEART" (Roberto MINERVINI) [Special Screening]

"OTDAT KONCI (BITE THE DUST)" (Taisia IGUMENTSEVA) [Special Screening]

"BOMBAY TALKIES" (Zoya AKHTAR, Dibakar BANERJEE, Karan JOHAR, Anurag KASHYAP) [Special Screening]

"SEDUCED AND ABANDONED" (James TOBACK) [Special Screening]

"MUHAMMAD ALI'S GREATEST FIGHT" (Stephen FREARS) [Special Screening]

"WEEKEND OF A CHAMPION" (Frank SIMON) [Special Screening]

"MAX ROSE" (Daniel NOAH) [Special Screening]


SEMAINE DE LA CRITIC

"AIN'T THEM BODIES SAINTS" (David Lowery) [Semaine]
  (Sundance)
Sebastian Doggart (Guardian, UK) 10 http://www.guardian.co.uk/film/2013/jan/25/aint-them-bodies-saints-review
Jordan Hoffman (Film.com, USA) 8.3 http://www.metacritic.com/movie/aint-them-bodies-saints/critic-reviews
Peter Debruge (Variety, USA) 8 http://variety.com/2013/film/reviews/ain-t-them-bodies-saints-1117949039/
Todd McCarthy (The Hollywood Reporter, USA) 7 http://www.metacritic.com/movie/aint-them-bodies-saints/critic-reviews

"SALVO" (Fabio Grassadonia & Antonio Piazza) [Semaine]
José Luis Losa        0
Javier H. Estrada     7

"SUZANNE" (Katell Quillévéré) [Semaine]
Neil Young           7    https://twitter.com/JigsawLounge/status/335140082728194048

"LE DÉMANTÈLEMENT (The Dismantling)" (Sébastien Pilote) [Semaine]

"FOR THOSE IN PERIL" (Paul Wright) [Semaine]

"THE LUNCHBOX (Dabba)" (Ritesh Batra) [Semaine]

"LES RENCONTRES D’APRÈS MINUIT" (Yann Gonzalez) [Semaine]

"LOS DUEÑOS" (Agustín Toscano & Ezequiel Radusky) [Semaine]
Diego Batlle          7.5
Diego Lerer           6.5
Carlo Chatrian        6.5

"NOS HÉROS SONT MORTS CE SOIR" (David Perrault) [Semaine]

"THE MAJOR" (Yury Bykov) [Semaine]

"3x3D" (Peter Greenaway, Jean-Luc Godard & Edgar Perâ) [Semaine]


QUINZAINE

"THE CONGRESS" (Ari Folman) [Quinzaine]
Jessica Kiang        4.5  http://blogs.indiewire.com/theplaylist/cannes-review-ari-folmans-the-congress-has-too-a-little-too-much-of-everything-20130516
Guy Lodge            5	  http://www.hitfix.com/in-contention/review-robin-wright-gets-animated-in-messy-sometimes-mesmerising-the-congress
Alejandro G. Calvo   5
Rüdiger Suchsland    6
Carlos F. Heredero   6

"THE SELFISH GIANT" (Clio Barnard) [Quinzaine]
Neil Young            6.5

"UN VOYAGEUR (Ain't Misbehavin)" (Marcel Ophuls) [Quinzaine]
Diego Batlle          8

"UGLY" (Anurag Kashyap) [Quinzaine]

"BLUE RUIN" (Jeremy Saulnier) [Quinzaine]

"LA DANZA DE LA REALIDAD (The Dance of Reality)" (Alejandro Jodorowsky) [Quinzaine]

"JODOROWSKY'S DUNE" (Frank Pavich) [Quinzaine]

"ILO ILO" (Anthony Chen) [Quinzaine]

"TIP TOP" (Serge Bozon) [Quinzaine]

"L'ESCALE" (Kaveh Bakhtiari) [Quinzaine]

"EL VERANO DE LOS PECES VOLADORES (The Summer of Flying Fish)" (Marcela Said) [Quinzaine]

"LES GARÇONS ET GUILLAUME, À TABLE ! (Me Myself and Mum)" (Guillaume Gallienne) [Quinzaine]

"THE LAST DAYS ON MARS" (Ruairí Robinson) [Quinzaine]

"A STRANGE COURSE OF EVENTS" (Raphaël Nadjari) [Quinzaine]

"WE ARE WHAT WE ARE" (Jim Mickle) [Quinzaine]
Tim Grierson (Screen Daily, USA)   http://www.screendaily.com/reviews/the-latest/we-are-what-we-are/5055835.article?blocktitle=DIRECTORS'-FORTNIGHT&contentID=40446

"ATÉ VER A LUZ" (Basil da Cunha) [Quinzaine]

"LES APACHES" (Thierry de Peretti) [Quinzaine]

"LA FILLE DU 14 JUILLET (The Rendez-Vous of Déjà-Vu)" (Antonin Peretjatko) [Quinzaine]
Fernando Ganzo        7
Carlo Chatrian        5

"MAGIC MAGIC" (Sebastián Silva) [Quinzaine]
  (Sundance)
Sebastian Doggart (Guardian, UK) 6 http://www.guardian.co.uk/film/2013/jan/25/magic-magic-first-look-review
Russ Fischer (slashfilm.com, USA) 7
Chris Bumbray (joblo.com, USA) 7
Mark Olsen (LA Times, USA) http://articles.latimes.com/2013/jan/27/entertainment/la-et-mn-sundance-michael-cera-magic-20130126
Nicolas Bell (Ioncinema.com, Canada) http://www.ioncinema.com/reviews/magic-magic-review

"ON THE JOB" (Erik Matti) [Quinzaine]

"HENRI" (Yolande Moreau) [Quinzaine]

EOF

our @critics;
$critics[0] = "
Alejandro G. Calvo (Sensacine, España) 
Alex Vicente (Público, España) 
Alexandra Zawia (Wiener Zeitung, Furche, Celluloid, Austria)
Ángel Quintana (Cahiers du cinema Espana, España)
Boris Nelepo (Kinote daily, Russia)
Carlo Chatrian (Duellanti, Panoramiches, Italy) 
Carlos Heredero (Caimán CDC, España) 
Carlos Reviriego (elcultural.es y de Caiman. Cuadernos de cine, España) 
Cecilia Martinez (A Sala Llena Online, Argentina) 
Cristina Nord (Die Tageszeitung, Deutschland) 
Dana Linssen (De Filmkrant, Netherlands) 
Diego Batlle (La Nación, OtrosCines, Argentina) 
Diego Lerer (Clarín, Micropsia, Argentina) 
Eugenio Renzi (Independencia, France) 
Eulàlia Iglesias (RockDeLux y Caimán CDC, España) 
Fernando Ganzo (Lumiere, España) 
Fernando Juan Lima (El Amante, Argentina) 
Francisco Ferreira (Expresso, Portugal) 
Jaime Pena (El Amante, España/Argentina) 
José Luis de Lorenzo (A Sala Llena, Argentina) 
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
Pedro Butcher (Folha do Sao Paulo, Filme B, Brasil) 
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
";
# ioncinema
$critics[1] = "
Christophe Beney (Palmares magazine, France) 
David Calhoun (The Out London, UK) 
Per Juul Carlsen (Danish National Radio, Denmark) 
Paola Casella (Europa, Italy) 
Mike d'Angelo (AV Club, USA) 
Carlos F. Heredero (Cahiers du cinema Espana, España) 
Eric Lavallée (Ioncinema.com, Canada) 
Fabien Lemercier (Cineeuropa.org, Belgium) 
Guy Lodge (Variety, InContention, South Africa/USA) 
Isabelle Regnier (Le Monde, France) 
Kevin Jagernauth (Indiewire's The Playlist, USA) 
James Rocchi (MSN Movies, Indiewire's The Playlist, USA) 
Cédric Succivalli (International Cinephil Society, France) 
Clarence Tsui (South China Morning Post, Hong Kong) 
Blake Williams (Ioncinema.com, Canada) 
Liu Min (Sina.com, China) 
Eric Kohn (Indiewire, USA) 
";
# Le film français 0-4
$critics[2] = "
Stéphanie Lamome (Premiere, France)
Arnaud schwartz (la Croix, France)
Fabrice Leclerc (Studio ciné live, France)
Eric Neuhoff (Le Figaro, France)
Stéphane Delorme (Cahiers du cinema, France)
Jaques Mandelbaum (Le Monde, France)
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
Dennis Lim (The New York Times, USA) 
Michel Ciment (Positif, France) 
Kate Muir (The Times, UK) 
Wendy Ide (The Times, UK) 
Bo Green Jensen (Weekandavisen Berlingske, Denmark) 
Screen International (Screen International, USA) 
";
# indiewire + various other
$critics[4] = "
Aaron Hillis (GreenCine Daily, USA)
Alex Billington (FirstShowing.net, USA)
Allan Hunter (Screen Daily, USA)
Andrei Creţulescu (HBO, Romania) 
Andrew O'Hehir (Salon.com, USA) 
Anna Bielak (Smells Like Screen Spirit, USA)
Anna Tatarska (Fandor, KINO, USA)
Anne Thompson (Indiewire, USA) 
Brian Brooks (indieWIRE, USA) 
Chris Knipp (Filmleaf, USA)
Clementine Gallot (Cahiers du cinema, France)
David Edelstein (New York Magazine-Vulture, USA)
David Ehrlich (Movies.com, Box Office Magazine, Reverse Shot)
David Fear (Time Out New York, USA) 
David Gritten (The Telegraph, UK)
David Jenkins (Little White Lies blog, UK)
Drew McWeeny (InContention, USA)
Drew Taylor (The Playlist, USA)
Eduardo Valente (Revista Cinema, Brazil) 
Elisabeth Quin (Paris Premiere, France) 
Emanuel Levy (EmanuelLevy.com, USA)
Eric D. Snider (Film.com, USA)
Eugene Hernandez (Film Society of Lincoln Center, USA) 
Frédéric Jaeger (critic.de, Deutschland)
Glenn Heath Jr. (Slant Magazine, Press Play, USA)
Ignatiy Vishnevetsky (Freelance, USA)
Jessica Kiang (The Playlist, USA)
Jon Frosch (France 24, France)
Jonathan Rosenbaum (Chicago Reader, USA) 
Jordan Raup (The Film Stage, USA)
Kaleen Aftab (The Independent, UK)
Karina Longworth (LA Weekly, USA) 
Keith Uhlich (Time Out New York, USA)
Kristy Puchko (Freelance, USA)
Laremy Legel (Film.com, USA) 
Leda Galanou (Flix, France)
Lee Marshall (Screen Daily, USA)
Mark Adams (Screen Daily, USA)
Matt Holmes (Obsessedwithfilm.com, USA) 
Michael Ghennam (Les Fiches du Cinéma, France)
Michael Sennhauser (SRF, Suisse)
Michael Giltz (The Huffington Post, USA) 
Nev Pierce (Empire, USA)
Patrick Heidmann (Cineman, Deutschland)
Paul Martin (Indies Movies Online, USA) 
Pete Hammond (Boxoffice Magazine, USA) 
Peter Bradshaw (Guardian, UK) 
Peter Debruge (Variety, USA) 
Peter Howell (The Toronto Star, USA) 
Peter Keogh (Boston Phoenix, USA)
Peter Knegt (indieWIRE, USA) 
Raffi Asdourian (The Film Stage, USA)
Richard Corliss (Time, USA)
Robbie Collins (The Telegraph, UK)
Ruta Buciunaite (theupcoming.co.uk, UK)
Ryland Aldrich (Twitch Film, USA)
Simon Abrams (The Playlist, USA)
Simon Gallagher (filmschoolrejects.com, UK) 
Simon Reynolds (Digital Spy, UK) 
Stephen Garrett (Time Out New York, USA)
Sukhdev Sandhu (Telegraph, UK) 
Tim Grierson (Screen International, L.A. Weekly, USA) 
Tim Robey (Daily Telegraph, England)
Todd McCarthy (The Hollywood Reporter, USA) 
";
# former apichatpoll members
$critics[5] = "
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

our $HEADER = <<"EOF";

<small>Collected and updated daily by Reini Urban, 
from the ApichatPoll http://www.todaslascriticas.com.ar/cannes (Diego Lerer+Javier Fish) (la crema),
http://www.ioncinema.com/ (okay),
Le film français (eclectic),
Screen Daily (mainstream),
Indiewire (mixed) and more critics.<br>

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
http://www.todaslascriticas.com.ar/cannes
http://micropsia.otroscines.com/
http://www.ioncinema.com/
History at https://github.com/rurban/cannes-rurban.rhcloud.com/commits/master/

</pre>";

$HEADER =~ s{(https?)://(.+?) }{<a href="$1://$2">$2</a> }g;
$FOOTER =~ s{(https?)://(.+)\n}{<a href="$1://$2">$2</a>\n}g;
1;
