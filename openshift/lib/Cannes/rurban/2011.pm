package Cannes::rurban::2011;

#!/usr/bin/perl -- -*- perl -*- 
# "The ApichatPoll"
# Cannes 2011 Critics Ratings, collected by Diego Lerer, ioncinema, indiewire and Reini Urban
# Recalc and sort ratings by 40 critics from http://micropsia.otroscines.com/2011/05/
# and 16 more western critics from http://www.ioncinema.com/ (scaled to 0-10)
# and Mike d'Angelo from Twitter and more international critics.
# Pulished at http://www.facebook.com/notes/reini-urban/cannes-2011-critics/10150578683465012
# Perl script by Reini Urban (c) 2010, 2011
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

"Les Biens-aimes / Beloved" Christophe Honoré
Diego Batlle (La Nación / OtrosCines, Argentina) – 6
Rudiger Suchsland (FAZ / Negativ, Deutschland) – 8
Nando Salva (El Periódico, España) – 1
 Indiewire:
Simon Abrams (Freelance, USA) 5 B-
Jon Frosch (France 24,USA) 9 A
Eric Kohn (indieWIRE, USA) 6.25 B
Guy Lodge (InContention, USA) 1.5 D+
James Rocchi (Indiewire's The Playlist, USA) 1.2 D

“The Source” Radu Mihaileanu (1.10) 5 votos [Competition]
Fernando Ganzo (Lumiere, España) -
Carlos Heredero (Cahiers du cinéma, España) -
Luciano Monteagudo (Página12, Argentina) -
Roger Alan Koza (La Voz del Interior / Con los ojos abiertos, Argentina) -
Mark Peranson (Cinema Scope, Canada) -
Eulalia Iglesias (Rockdelux, Cahiers du cinéma, España) -
Diego Batlle (La Nación / OtrosCines, Argentina) -
Cristina Nord (Die Tageszeitung, Deutschland) – 3.5
Markus Keuschnigg (Die Presse, Austria) -
Kong Rithdee (The Bangkok Post. Thailand) -
Francisco Ferreira (Expresso, Portugal) -
Violeta Kovacsics (Diari de Tarragona, España) -
Jaime Pena (El Amante, Argentina y Cahiers du cinéma, España) – 0
Olivier Pere (Les Inrockuptibles, France) -
Eugenio Renzi (Independencia, France) -
Luciano Barisone (Duellanti / Panoramiches, Italy) -
Carlo Chatrian (Duellanti / Panoramiches, Italy) -
Jose Luis De Lorenzo (A Sala Llena, Argentina) -
Fernando Juan Lima (El Amante, Argentina) -
Xavi Serra (Ara, España) -
Ernesto Garratt (El Mercurio, Chile) -
Nick James (Sight & Sound, England) -
Sergi Sanchez (La Razón, España) -
Sara Brito (Público, España) -
Scott Foundas (Film Comment, U.S.) -
Sergio Wolf (BAFICI, Argentina) -
Rudiger Suchsland (FAZ / Negativ, Deutschland) –  1
Alvaro Arroba (La Lectora Provisoria, Argentina) -
Pablo O. Scholz (Clarín, Argentina) -
Nando Salva (El Periódico, España) –  0
Pedro Butcher (Filme B / Folha de Sao Paulo, Brasil) -
Gabriele Barrera (Nick FilmTV / Best Movie / Cinecritica, Italy) -
Pamela Bienzobas (Mabuse, Chile) -
Manu Yáñez(Fotogramas, España) -
Gregory Valens (Positif, France) -
Christoph Huber (Die Presse, Austria) -
Marcelo Alderete (Mar del Plata Film Festival, Argentina) -
Belinda Van De Graaf (Trouw, Holanda) -
Arthur Mas (Independencia, France) -
Martial Pisani (Independencia, France) -
Carlos Reviriego (El Cultural / Cahiers du cinéma, España) -
Alejandro G. Calvo (SensaCine, España) -
Anchalee Chaiworaporn (Siam Rath, Image Magazine, Thailand) – 1
Mike d'Angelo (AV Club, USA) 3.0
 Ioncinema:
Christophe Beney (Palmares magazine, France)
David Calhoun (The Out London, UK) 
Per Juul Carlsen (Danish National Radio, Denmark) 
Paola Casella (Europa, Italy)
Andrei Creţulescu (HBO Romania)
Carlos F. Heredero (Cahiers du cinema Espana, Spain) 
Eric Lavallée (Ioncinema.com, Canada) 
Fabien Lemercier (Cineeuropa.org, Belgium) 
Guy Lodge (InContention.com, South Africa) 
Elisabeth Quin (Paris Premiere, France)
Isabelle Regnier (Le Monde, France) 
James Rocchi (MSN Movies, Indiewire's The Playlist, USA)
Cédric Succivalli (International Cinephil Society, France)
Anne Thompson (Indiewire, USA)
Clarence Tsui (South China Morning Post, Hong Kong)
Eduardo Valente (Revista Cinema, Brazil)
 Screen Daily:
Nick James (Sight & Sound, UK) 5
David Stratton (The Australian, Australia) 
Derek Malcolm (London Evening, UK) 
Jan Schulz-Ojala (Der Tagesspiegel, Deutschland) 2.5
Jose Carlos Avellar (Escrevercinema.com, Brazil) 5
Dennis Lim (The New York Times, USA) 
Michel Ciment (Positif, France) 1
Alberto Crespi (L'Unita, Italy) 
Bo Green Jensen (Weekandavisen Berlingske, Denmark) 5
Screen International (Screen International, USA) 7.5

“Once Upon a Time in Anatolya” Nuri Bilge Ceylan (7.12) 12 votos [Competition] Grand prix
Fernando Ganzo (Lumiere, España) – 5.5
Carlos Heredero (Cahiers du cinéma, España) -
Luciano Monteagudo (Página12, Argentina) –  8
Roger Alan Koza (La Voz del Interior / Con los ojos abiertos, Argentina) – 7.5
Mark Peranson (Cinema Scope, Canada) -
Eulalia Iglesias (Rockdelux, Cahiers du cinéma, España) -
Diego Batlle (La Nación / OtrosCines, Argentina) – 7
Cristina Nord (Die Tageszeitung, Deutschland) -
Markus Keuschnigg (Die Presse, Austria) -
Kong Rithdee (The Bangkok Post. Thailand) -
Francisco Ferreira (Expresso, Portugal) -
Violeta Kovacsics (Diari de Tarragona, España) -
Jaime Pena (El Amante, Argentina y Cahiers du cinéma, España) –  6
Olivier Pere (Les Inrockuptibles, France) -
Eugenio Renzi (Independencia, France) -
Luciano Barisone (Duellanti / Panoramiches, Italy) -
Carlo Chatrian (Duellanti / Panoramiches, Italy) -
Jose Luis De Lorenzo (A Sala Llena, Argentina) -
Fernando Juan Lima (El Amante, Argentina) -
Xavi Serra (Ara, España) -
Ernesto Garratt (El Mercurio, Chile) -
Nick James (Sight & Sound, England) -
Sergi Sanchez (La Razón, España) -
Sara Brito (Público, España) – 6.9
Scott Foundas (Film Comment, U.S.) – 10
Sergio Wolf (BAFICI, Argentina) -
Rudiger Suchsland (FAZ / Negativ, Deutschland) –  7.50
Alvaro Arroba (La Lectora Provisoria, Argentina) -
Pablo O. Scholz (Clarín, Argentina) – 5
Nando Salva (El Periódico, España) – 8
Pedro Butcher (Filme B / Folha de Sao Paulo, Brasil) -
Gabriele Barrera (Nick FilmTV / Best Movie / Cinecritica, Italy) -
Pamela Bienzobas (Mabuse, Chile) -
Manu Yáñez(Fotogramas, España) -
Gregory Valens (Positif, France) -
Christoph Huber (Die Presse, Austria) -
Marcelo Alderete (Mar del Plata Film Festival, Argentina) -
Belinda Van De Graaf (Trouw, Holanda) -
Arthur Mas (Independencia, France) -
Martial Pisani (Independencia, France) -
Carlos Reviriego (El Cultural / Cahiers du cinéma, España) – 6
Alejandro G. Calvo (SensaCine, España) -
Anchalee Chaiworaporn (Siam Rath, Image Magazine, Thailand) - 8
Mike d'Angelo (AV Club, USA) 3.9
 Ioncinema:
Christophe Beney (Palmares magazine, France)
David Calhoun (The Out London, UK) 
Per Juul Carlsen (Danish National Radio, Denmark) 
Paola Casella (Europa, Italy)
Andrei Creţulescu (HBO Romania)
Carlos F. Heredero (Cahiers du cinema Espana, Spain) 
Eric Lavallée (Ioncinema.com, Canada) 
Fabien Lemercier (Cineeuropa.org, Belgium) 
Guy Lodge (InContention.com, South Africa) 5 B-
Elisabeth Quin (Paris Premiere, France)
Isabelle Regnier (Le Monde, France) 
James Rocchi (MSN Movies, Indiewire's The Playlist, USA)
Cédric Succivalli (International Cinephil Society, France)
Anne Thompson (Indiewire, USA)
Clarence Tsui (South China Morning Post, Hong Kong)
Eduardo Valente (Revista Cinema, Brazil)
 Screen Daily:
Nick James (Sight & Sound, UK) 9
David Stratton (The Australian, Australia) 9
Derek Malcolm (London Evening, UK) 7.5
Jan Schulz-Ojala (Der Tagesspiegel, Deutschland) 5
Jose Carlos Avellar (Escrevercinema.com, Brazil) 7.5
Dennis Lim (The New York Times, USA) 7.5
Michel Ciment (Positif, France) 9
Alberto Crespi (L'Unita, Italy) 
Bo Green Jensen (Weekandavisen Berlingske, Denmark) 7.5
Screen International (Screen International, USA) 9
 Indiewire:
Simon Abrams (Freelance, USA) 6.25 B
Jon Frosch (France 24,USA) 9 A
Peter Howell (The Toronto Star, Canada) 6.25 B
Eric Kohn (indieWIRE, USA) 8 A-

"Elena" Andrei Zvyagintsev [Un Certain Regard] Special Jury Price UCR
Diego Batlle (La Nación / OtrosCines, Argentina) – 7

"Les Géants" Bouli Lanner [Quinzaine] Art Cinema award + Prix SACD

"Atmen" Karl Markovic [Quinzaine] Label Europa Cinemas award

“This Must Be the Place” Paolo Sorrentino (3.075) 19 votos [Competition] Ecumenical Jury prize
Fernando Ganzo (Lumiere, España) -
Carlos Heredero (Cahiers du cinéma, España) –  3
Luciano Monteagudo (Página12, Argentina) - 3
Roger Alan Koza (La Voz del Interior / Con los ojos abiertos, Argentina) –  2
Mark Peranson (Cinema Scope, Canada) -
Eulalia Iglesias (Rockdelux, Cahiers du cinéma, España) - 6
Diego Batlle (La Nación / OtrosCines, Argentina) –  5.5
Cristina Nord (Die Tageszeitung, Deutschland) –  1
Markus Keuschnigg (Die Presse, Austria) -
Kong Rithdee (The Bangkok Post. Thailand) -
Francisco Ferreira (Expresso, Portugal) -
Violeta Kovacsics (Diari de Tarragona, España) -
Jaime Pena (El Amante, Argentina y Cahiers du cinéma, España) - 1
Olivier Pere (Les Inrockuptibles, France) -
Eugenio Renzi (Independencia, France) -
Luciano Barisone (Duellanti / Panoramiches, Italy) –  5
Carlo Chatrian (Duellanti / Panoramiches, Italy) -
Jose Luis De Lorenzo (A Sala Llena, Argentina) - 5
Fernando Juan Lima (El Amante, Argentina) - 5
Xavi Serra (Ara, España) -
Ernesto Garratt (El Mercurio, Chile) -
Nick James (Sight & Sound, England) -
Sergi Sanchez (La Razón, España) - 2
Sara Brito (Público, España) - 0
Scott Foundas (Film Comment, U.S.) - 2
Sergio Wolf (BAFICI, Argentina) -
Rudiger Suchsland (WAZ / Negativ, Deutschland) –  0
Alvaro Arroba (La Lectora Provisoria, Argentina) -
Pablo O. Scholz (Clarín, Argentina) - 5
Nando Salva (El Periódico, España) - 0
Pedro Butcher (Filme B / Folha de Sao Paulo, Brasil) -
Gabriele Barrera (Nick FilmTV / Best Movie / Cinecritica, Italy) -
Pamela Bienzobas (Mabuse, Chile) -
Manu Yáñez(Fotogramas, España) -
Gregory Valens (Positif, France) -
Christoph Huber (Die Presse, Austria) -
Marcelo Alderete (Mar del Plata Film Festival, Argentina) - 5
Belinda Van De Graaf (Trouw, Holanda) -
Arthur Mas (Independencia, France) -
Martial Pisani (Independencia, France) -
Carlos Reviriego (El Cultural / Cahiers du cinéma, España) –  0
Alejandro G. Calvo (SensaCine, España) –  3
Anchalee Chaiworaporn (Siam Rath, Image Magazine, Thailand) - 8
Mike d'Angelo (AV Club, USA) 7.2 B "Do you sell luggage?" "We'll get to that." "Does a fugitive Nazi live here?" "We'll get to that." Digression as epiphany perfect for Sorrentino's radically absurdist style. I'm troubled by the weirdly conservative ending, though.
 Ioncinema:
Christophe Beney (Palmares magazine, France) 0
David Calhoun (The Out London, UK) 6.25
Per Juul Carlsen (Danish National Radio, Denmark)
Paola Casella (Europa, Italy) 7.5
Andrei Creţulescu (HBO Romania)
Carlos F. Heredero (Cahiers du cinema Espana, Spain) 2.5
Eric Lavallée (Ioncinema.com, Canada) 2.5
Fabien Lemercier (Cineeuropa.org, Belgium) 8.75
Guy Lodge (InContention.com, South Africa) 2.5 C-
Elisabeth Quin (Paris Premiere, France) 7.5
Isabelle Regnier (Le Monde, France)
James Rocchi (MSN Movies, Indiewire's The Playlist, USA) 9 A
Cédric Succivalli (International Cinephil Society, France)
Anne Thompson (Indiewire, USA)
Clarence Tsui (South China Morning Post, Hong Kong) 6.25
Eduardo Valente (Revista Cinema, Brazil) 1.25
 Screen Daily:
Nick James (Sight & Sound, UK) 7.5
David Stratton (The Australian, Australia) 9
Derek Malcolm (London Evening, UK) 2.5
Jan Schulz-Ojala (Der Tagesspiegel, Deutschland) 7.5
Jose Carlos Avellar (Escrevercinema.com, Brazil) 5
Dennis Lim (The New York Times, USA) 
Michel Ciment (Positif, France) 7.5
Alberto Crespi (L'Unita, Italy) 7.5
Bo Green Jensen (Weekandavisen Berlingske, Denmark) 7.5
Screen International (Screen International, USA) 7.5
 Indiewire:
Simon Abrams (Freelance) 9 A
Joshua Brunsting (Gordon and the Whale) 2 C-
Jon Frosch (France 24) 5 B-
Michael Giltz (The Huffington Post) 6.25 B
Peter Howell (The Toronto Star) 2 C-
Kevin Jagernauth (The Playlist) 2 C-
Eric Kohn (indieWIRE) 1.5 D+
#Guy Lodge (InContention) 2 C-
Peter Bradshaw (Guardian, UK) 6

"The Look" Angelina Maccarone [Cannes Classics]
Rudiger Suchsland (WAZ / Negativ, Deutschland) – 7

"Corman's World" Alex Stapleton
Marcelo Alderete (Mar del Plata Film Festival, Argentina) –  6
Simon Reynolds (DigiatSpy, USA) 8

"Blue Bird" Gust Van den Berghe [Quinzaine]
Cristina Nord (Die Tageszeitung, Deutschland) – 6.8
Rudiger Suchsland (WAZ / Negativ, Deutschland) – 2

"Sauna on Moon" Zou Pen [Semaine]
Rudiger Suchsland (WAZ / Negativ, Deutschland) – 5.8
Carlo Chatrian (Duellanti / Panoramiches, Italy) –  5
Roger Alan Koza (La Voz del Interior / Con los ojos abiertos, Argentina) – 6.5
Paolo Bertolin (Cineforum, Italia) - 5
Scott Foundas (Film Comment, U.S.) - 6

"Après le sud" Jean-Jacques Jauffre [Quinzaine]
Jaime Pena (El Amante, Argentina y Cahiers du cinéma, España) –  2

"Avé" Konstantin Bojano [Semaine]
Carlo Chatrian (Duellanti / Panoramiches, Italy) –  6.50
Rudiger Suchsland (WAZ / Negativ, Deutschland) – 7.00

"El velador / The Night Watchman" Natalia Almada (6,00) 2 votos [Quinzaine]
Roger Alan Koza (La Voz del Interior / Con los ojos abiertos, Argentina) –  6
?? () 6

"My Little Princess" Eva Ionescu [Semaine]
Sergio Wolf (BAFICI, Argentina) – 1
Rudiger Suchsland (WAZ / Negativ, Deutschland) – 3.9

"Snowtown" Justin Kurzel [Semaine] (Adelaide) Special Mention
Kevin Jagernauth (Indiewire's The Playlist, USA) 4 C+
Carlos Heredero (Cahiers du cinéma, España) –  2
Michael Giltz (The Huffington Post, USA) 5  2/4

"Dias De Gracia (Days Of Grace)" Everardo Gout
Eulalia Iglesias (Rockdelux, Cahiers du cinéma, España) – 3
Marcelo Alderete  (Mar del Plata Film Festival, Argentina) –  0

"La Khaoufa Baada Al'Yaoum (No More Fear)" Mourad Ben Cheikh
Luciano Monteagudo (Página12, Argentina) –  6

"La Conquête (The Conquest)" Xavier Durringer
Rudiger Suchsland (WAZ / Negativ, Deutschland) –  7
Sergi Sanchez (La Razón, España) – 5.5
Diego Batlle (La Nación / OtrosCines, Argentina) –  6
Nando Salva (El Periódico, España) – 3
Agnès C Poirier (Guardian, UK) 4

"The Big Fix" Josh Tickell [Special Screenings]
Simon Gallagher (filmschoolrejects.com, UK) 8 A-
Eulalia Iglesias (Rockdelux, Cahiers du cinéma, España) – 3
Marcelo Alderete (Mar del Plata Film Festival, Argentina) –  0
Carlo Chatrian (Duellanti / Panoramiches, Italy) –  4
Alejandro G. Calvo (SensaCine, España) –  5

"Okhotnik / The Hunter" Bakur Bakuradze [Un Certain Regard]
Luciano Monteagudo (Página12, Argentina) – 5
Eulalia Iglesias (Rockdelux, Cahiers du cinéma, España) - 7
Diego Batlle (La Nación / OtrosCines, Argentina) – 6
Jaime Pena (El Amante, Argentina y Cahiers du cinéma, España) – 4
Jose Luis De Lorenzo (A Sala Llena, Argentina) - 3
Fernando Juan Lima (El Amante, Argentina) - 2
Rudiger Suchsland (WAZ / Negativ, Deutschland) –  4
Fernando Ganzo (Lumiere, España) – 3

“Return” Liza Johnson [Quinzaine]
Mike d'Angelo (AV Club, USA) 6.1 Promising debut
Sergio Wolf (BAFICI, Argentina) – 6

"En ville" Valérie Mréjen et Bertrand Schefe [Quinzaine]

"Des Jeunes Gens Mödernes" Jérôme de Missol [Quinzaine]

"Pourquoi tu pleures?" Katia Lewkowic

"Sur la planche" Leïla Kilani [Quinzaine]

“Drive” Nicolas Winding Refn (7.28) 21 votos [Competition] Best Director
Mike d'Angelo (AV Club, USA) 7.6 B+
Fernando Ganzo (Lumiere, España) -
Carlos Heredero (Cahiers du cinéma, España) - 6.5
Luciano Monteagudo (Página12, Argentina) - 5
Roger Alan Koza (La Voz del Interior / Con los ojos abiertos, Argentina) – 7
Mark Peranson (Cinema Scope, Canada) -
Eulalia Iglesias (Rockdelux, Cahiers du cinéma, España) - 9
Diego Batlle (La Nación / OtrosCines, Argentina) – 7.5
Cristina Nord (Die Tageszeitung, Deutschland) – 7.5
Markus Keuschnigg (Die Presse, Austria) -
Kong Rithdee (The Bangkok Post. Thailand) – 8
Francisco Ferreira (Expresso, Portugal) -
Violeta Kovacsics (Diari de Tarragona, España) -
Jaime Pena (El Amante, Argentina y Cahiers du cinéma, España) – 7.9
Olivier Pere (Les Inrockuptibles, France) – 8.5
Eugenio Renzi (Independencia, France) -
Luciano Barisone (Duellanti / Panoramiches, Italy) – 5
Carlo Chatrian (Duellanti / Panoramiches, Italy) - 5
Jose Luis De Lorenzo (A Sala Llena, Argentina) -
Fernando Juan Lima (El Amante, Argentina) -
Xavi Serra (Ara, España) -
Ernesto Garratt (El Mercurio, Chile) -
Nick James (Sight & Sound, England) -
Sergi Sanchez (La Razón, España) - 7
Sara Brito (Público, España) -
Scott Foundas (Film Comment, U.S.) -
Sergio Wolf (BAFICI, Argentina) -
Rudiger Suchsland (WAZ / Negativ, Deutschland) - 8
Alvaro Arroba (La Lectora Provisoria, Argentina) -
Pablo O. Scholz (Clarín, Argentina) – 6
Nando Salva (El Periódico, España) -
Pedro Butcher (Filme B / Folha de Sao Paulo, Brasil) -
Gabriele Barrera (Nick FilmTV / Best Movie / Cinecritica, Italy) -
Pamela Bienzobas (Mabuse, Chile) -
Manu Yáñez(Fotogramas, España) -
Gregory Valens (Positif, France) -
Christoph Huber (Die Presse, Austria) -
Marcelo Alderete (Mar del Plata Film Festival, Argentina) -
Belinda Van De Graaf (Trouw, Holanda) -
Arthur Mas (Independencia, France) -
Martial Pisani (Independencia, France) -
Carlos Reviriego (El Cultural / Cahiers du cinéma, España) - 8
Alejandro G. Calvo (SensaCine, España) - 9
Anchalee Chaiworaporn (Siam Rath, Image Magazine, Thailand) -
 Ioncinema:
Christophe Beney (Palmares magazine, France) 7.5
David Calhoun (The Out London, UK) 5
Per Juul Carlsen (Danish National Radio, Denmark)
Paola Casella (Europa, Italy) 7.5
Andrei Creţulescu (HBO Romania)
Carlos F. Heredero (Cahiers du cinema Espana, Spain) 5
Eric Lavallée (Ioncinema.com, Canada) 6.25
Fabien Lemercier (Cineeuropa.org, Belgium) 2.5
Guy Lodge (InContention.com, South Africa) 10
Elisabeth Quin (Paris Premiere, France) 10
Isabelle Regnier (Le Monde, France)
James Rocchi (MSN Movies, Indiewire's The Playlist, USA) 8.75
Cédric Succivalli (International Cinephil Society, France)
Anne Thompson (Indiewire, USA) 10
Clarence Tsui (South China Morning Post, Hong Kong)
Eduardo Valente (Revista Cinema, Brazil) 5
 Screen Daily:
Nick James (Sight & Sound, UK) 7.5
David Stratton (The Australian, Australia) 5
Derek Malcolm (London Evening, UK) 2.5
Jan Schulz-Ojala (Der Tagesspiegel, Deutschland) 7.5
Jose Carlos Avellar (Escrevercinema.com, Brazil) 1
Dennis Lim (The New York Times, USA) 7.5
Michel Ciment (Positif, France) 7.5
Alberto Crespi (L'Unita, Italy) 5
Bo Green Jensen (Weekandavisen Berlingske, Denmark) 7.5
Screen International (Screen International, USA) 9
 Indiewire:
Simon Abrams (Freelance) 8 A-
Joshua Brunsting (Gordon and the Whale) 5 B
Jon Frosch (France 24) 5 B-
Michael Giltz (The Huffington Post) 2 C-
Peter Howell (The Toronto Star) 2 C-
Kevin Jagernauth (The Playlist) 9 A
Eric Kohn (indieWIRE) 7.25 B+
Guy Lodge (InContention) 8 A-
Patrick Z. McGavin (Lightsensitive.typepad.com) 5 B-
Rob Nelson (Variety) 5 B-
Peter Bradshaw (Guardian, UK) 8

"The Murderer / The Yellow Sea" Nan Hong-jin (7.675) 12 votos [Un Certain Regard]
Mike d'Angelo (AV Club, USA) 4.7 Hollywood audition reels. Setup intrigues but then it's generic car crashes and hatchet fights. Done with Na.
Fernando Ganzo (Lumiere, España) – 4
Luciano Monteagudo (Página12, Argentina) – 8
Roger Alan Koza (La Voz del Interior / Con los ojos abiertos, Argentina) –  7
Eulalia Iglesias (Rockdelux, Cahiers du cinéma, España) –  8
Diego Batlle (La Nación / OtrosCines, Argentina) – 7.5
Violeta Kovacsics (Diari de Tarragona, España) –  9.3
Jaime Pena (El Amante, Argentina y Cahiers du cinéma, España) – 7
Fernando Juan Lima (El Amante, Argentina) –  9
Rudiger Suchsland (FAZ / Negativ, Deutschland) –  9.50
Pamela Bienzobas (Mabuse, Chile) –  6.3
Marcelo Alderete (Mar del Plata Film Festival, Argentina) – 8
Alejandro G. Calvo (SensaCine, España) –  8

"La Nuit, elles dansent" Isabelle Lavigne et Stéphane Thibault (6.00) 4 votos [Quinzaine]
Fernando Ganzo (Lumiere, España) –  4
Luciano Barisone (Duellanti / Panoramiches, Italy) –  6
Rudiger Suchsland (FAZ / Negativ, Deutschland) –  6
Anchalee Chaiworaporn (Siam Rath, Image Magazine, Thailand) –  8

"Chatrak" Vimukthi Jayasundara (5.92) 6 votos [Quinzaine]
Eulalia Iglesias (Rockdelux, Cahiers du cinéma, España) –  6.5
Jaime Pena (El Amante, Argentina y Cahiers du cinéma, España) –  4
Carlo Chatrian (Duellanti / Panoramiches, Italy) –  7
Alvaro Arroba (La Lectora Provisoria, Argentina) –  4
Paolo Bertolin (Cineforum, Italia) – 9
Marcelo Alderete (Mar del Plata Film Festival, Argentina) –  5

"L'Exercise de L'Etat / The Minister" Pierre Schoeller (6.05) 10 votos [Un Certain Regard]
Eulalia Iglesias (Rockdelux, Cahiers du cinéma, España) – 4.5
Diego Batlle (La Nación / OtrosCines, Argentina) –  6.5
Cristina Nord (Die Tageszeitung, Deutschland) – 6.9
Kong Rithdee (The Bangkok Post. Thailand) – 5.5
Carlo Chatrian (Duellanti / Panoramiches, Italy) – 6
Fernando Juan Lima (El Amante, Argentina) –  4
Scott Foundas (Film Comment, U.S.) –  6
Rudiger Suchsland (FAZ / Negativ, Deutschland) –  7.1
Carlos Reviriego (El Cultural / Cahiers du cinéma, España) –  6

"Koi no Tsumi / Guilty of Romance" Sion Sono (8.44) 5 votos [Quinzaine]
Roger Alan Koza (La Voz del Interior / Con los ojos abiertos, Argentina) – 8
Violeta Kovacsics (Diari de Tarragona, España) -  9.2
Jaime Pena (El Amante, Argentina y Cahiers du cinéma, España) –  7.5
Fernando Juan Lima (El Amante, Argentina) -  9.5
Marcelo Alderete (Mar del Plata Film Festival, Argentina) –  8

“The Day He Arrives” Hong Sangsoo (7.65) 22 votos [Un Certain Regard]
Fernando Ganzo (Lumiere, España) –  8.80
Carlos Heredero (Cahiers du cinéma, España) – 8.50
Luciano Monteagudo (Página12, Argentina) -
Roger Alan Koza (La Voz del Interior / Con los ojos abiertos, Argentina) –  8.50
Mark Peranson (Cinema Scope, Canada) -
Eulalia Iglesias (Rockdelux, Cahiers du cinéma, España) – 7.5
Diego Batlle (La Nación / OtrosCines, Argentina) – 7.5
Cristina Nord (Die Tageszeitung, Deutschland) -
Markus Keuschnigg (Die Presse, Austria) -
Kong Rithdee (The Bangkok Post. Thailand) -
Francisco Ferreira (Expresso, Portugal) -  8.50
Violeta Kovacsics (Diari de Tarragona, España) -  8
Jaime Pena (El Amante, Argentina y Cahiers du cinéma, España) –  7.90
Olivier Pere (Les Inrockuptibles, France) -  6
Eugenio Renzi (Independencia, France) -
Luciano Barisone (Duellanti / Panoramiches, Italy) –  8
Carlo Chatrian (Duellanti / Panoramiches, Italy) – 8
Jose Luis De Lorenzo (A Sala Llena, Argentina) -  5
Fernando Juan Lima (El Amante, Argentina) –  8
Xavi Serra (Ara, España) -
Ernesto Garratt (El Mercurio, Chile) -
Nick James (Sight & Sound, England) -
Sergi Sanchez (La Razón, España) -
Sara Brito (Público, España) -
Scott Foundas (Film Comment, U.S.) -  7
Sergio Wolf (BAFICI, Argentina) -
Rudiger Suchsland (FAZ / Negativ, Deutschland) -
Alvaro Arroba (La Lectora Provisoria, Argentina) -  8.5
Pablo O. Scholz (Clarín, Argentina) –  7
Nando Salva (El Periódico, España) -
Pedro Butcher (Filme B / Folha de Sao Paulo, Brasil) -  7
Gabriele Barrera (Nick FilmTV / Best Movie / Cinecritica, Italy) -
Pamela Bienzobas (Mabuse, Chile) -
Manu Yáñez(Fotogramas, España) -
Gregory Valens (Positif, France) -
Paolo Bertolin (Cineforum, Italia) –  7.50
Marcelo Alderete (Mar del Plata Film Festival, Argentina) –  10
Belinda Van De Graaf (Trouw, Holanda) -
Arthur Mas (Independencia, France) -
Martial Pisani (Independencia, France) -
Carlos Reviriego (El Cultural / Cahiers du cinéma, España) –  7
Alejandro G. Calvo (SensaCine, España) –  7
Anchalee Chaiworaporn (Siam Rath, Image Magazine, Thailand) -  7
Mike d'Angelo (AV Club, USA) ??? Reading the reviews, it's clear that the film's central conceit completely escaped me. 2nd viewing required.

“This is Not a Film” Jafar Panahi & Mojtaba Mirtahmasb (7.14) 14 votos
Fernando Ganzo (Lumiere, España) – 4
Carlos Heredero (Cahiers du cinéma, España) –  4
Luciano Monteagudo (Página12, Argentina) –  9
Roger Alan Koza (La Voz del Interior / Con los ojos abiertos, Argentina) – 8.5
Eulalia Iglesias (Rockdelux, Cahiers du cinéma, España) – 6
Diego Batlle (La Nación / OtrosCines, Argentina) –  10
Cristina Nord (Die Tageszeitung, Deutschland) –  8
Kong Rithdee (The Bangkok Post, Thailand) – 8
Jaime Pena (El Amante, Argentina y Cahiers du cinéma, España) –  4
Jose Luis De Lorenzo (A Sala Llena, Argentina) –  6
Fernando Juan Lima (El Amante, Argentina) – 8.50
Scott Foundas (Film Comment, U.S.) – 9
Pablo O. Scholz (Clarín, Argentina) –  8
Pamela Bienzobas (Mabuse, Chile) -  7
Mike d'Angelo (AV Club, USA) 5.1

"La Piel Que Habito / The Skin I Live In" Pedro Almodóva (6,92) 28 votos [Competition]
Fernando Ganzo (Lumiere, España) –  7
Carlos Heredero (Cahiers du cinéma, España) –  5
Luciano Monteagudo (Página12, Argentina) –  6
Roger Alan Koza (La Voz del Interior / Con los ojos abiertos, Argentina) –  4
Mark Peranson (Cinema Scope, Canada) -
Eulalia Iglesias (Rockdelux, Cahiers du cinéma, España) - 8
Diego Batlle (La Nación / OtrosCines, Argentina) – 7
Cristina Nord (Die Tageszeitung, Deutschland) –  6.9
Markus Keuschnigg (Die Presse, Austria) -
Kong Rithdee (The Bangkok Post. Thailand) –  6
Francisco Ferreira (Expresso, Portugal) – 7
Violeta Kovacsics (Diari de Tarragona, España) -  7.7
Jaime Pena (El Amante, Argentina y Cahiers du cinéma, España) –  8.2
Olivier Pere (Les Inrockuptibles, France) -
Eugenio Renzi (Independencia, France) -
Luciano Barisone (Duellanti / Panoramiches, Italy) –  6
Carlo Chatrian (Duellanti / Panoramiches, Italy) -  5
Jose Luis De Lorenzo (A Sala Llena, Argentina) –  9
Fernando Juan Lima (El Amante, Argentina) –  5
Xavi Serra (Ara, España) -
Ernesto Garratt (El Mercurio, Chile) -
Nick James (Sight & Sound, England) -
Sergi Sanchez (La Razón, España) -  8.5
Sara Brito (Público, España) - 5.9
Scott Foundas (Film Comment, U.S.) -  3
Sergio Wolf (BAFICI, Argentina) -
Rudiger Suchsland (WAZ / Negativ, Deutschland) - 7.9
Alvaro Arroba (La Lectora Provisoria, Argentina) -  8.99
Pablo O. Scholz (Clarín, Argentina) –  7
Nando Salva (El Periódico, España) - 7
Pedro Butcher (Filme B / Folha de Sao Paulo, Brasil) -  7.5
Gabriele Barrera (Nick FilmTV / Best Movie / Cinecritica, Italy) -
Pamela Bienzobas (Mabuse, Chile) -  7.8
Manu Yáñez(Fotogramas, España) -
Gregory Valens (Positif, France) -
Paolo Bertolin (Cineforum, Italia) – 8.50
Marcelo Alderete (Mar del Plata Film Festival, Argentina) -
Belinda Van De Graaf (Trouw, Holanda) -
Arthur Mas (Independencia, France) -
Martial Pisani (Independencia, France) -
Carlos Reviriego (El Cultural / Cahiers du cinéma, España) - 7
Alejandro G. Calvo (SensaCine, España) - 8
Anchalee Chaiworaporn (Siam Rath, Image Magazine, Thailand) -  9
 Ioncinema:
Christophe Beney (Palmares magazine, France) 10
David Calhoun (The Out London, UK) 7.5
Per Juul Carlsen (Danish National Radio, Denmark) 7.5
Paola Casella (Europa, Italy) 10
Andrei Creţulescu (HBO Romania) 10
Carlos F. Heredero (Cahiers du cinema Espana, Spain) 5
Eric Lavallée (Ioncinema.com, Canada) 6.25
Fabien Lemercier (Cineeuropa.org, Belgium) 8.75
Guy Lodge (InContention.com, South Africa) 7.5
Elisabeth Quin (Paris Premiere, France)
Isabelle Regnier (Le Monde, France) 6.25
James Rocchi (MSN Movies, Indiewire's The Playlist, USA) 7.5
Cédric Succivalli (International Cinephil Society, France) 10
Anne Thompson (Indiewire, USA) 5 B
Clarence Tsui (South China Morning Post, Hong Kong) 5
Eduardo Valente (Revista Cinema, Brazil)
 Screen Daily:
Nick James (Sight & Sound, UK) 9
David Stratton (The Australian, Australia) 7.5
Derek Malcolm (London Evening, UK) 7.5
Jan Schulz-Ojala (Der Tagesspiegel, Deutschland) 5
Jose Carlos Avellar (Escrevercinema.com, Brazil) 7.5
Dennis Lim (The New York Times, USA) 2.5
Michel Ciment (Positif, France) 7.5
Alberto Crespi (L'Unita, Italy) 7.5
Bo Green Jensen (Weekandavisen Berlingske, Denmark) 5
Screen International (Screen International, USA) 9
 Indiewire:
Simon Abrams (Freelance, USA) 8 A-
Brian Brooks (indieWIRE, USA) 6.25 B
Joshua Brunsting (Gordon and the Whale, USA) 9 A-
Mike d'Angelo (Freelance) 4 C+
Jon Frosch (France 24) 5 B-
Michael Giltz (The Huffington Post) 3 C
Peter Howell (The Toronto Star) 4 C+
Kevin Jagernauth (The Playlist) 5 B-
Eric Kohn (indieWIRE) 5 B-
Guy Lodge (InContention) 5 B-
Patrick Z. McGavin (Lightsensitive.typepad.com) 6.25 B
Rob Nelson (Variety) 5 B
Peter Bradshaw (Guardian, UK) 8

“Melancholia” Lars von Trier (5.54) 26 votos [Competition]
Fernando Ganzo (Lumiere, España) – 5.2012
Carlos Heredero (Cahiers du cinéma, España) –  8
Luciano Monteagudo (Página12, Argentina) –  5
Roger Alan Koza (La Voz del Interior / Con los ojos abiertos, Argentina) –  4.5
Mark Peranson (Cinema Scope, Canada) -
Eulalia Iglesias (Rockdelux, Cahiers du cinéma, España) –  7.50
Diego Batlle (La Nación / OtrosCines, Argentina) –  5.50
Cristina Nord (Die Tageszeitung, Deutschland) –  4
Markus Keuschnigg (Die Presse, Austria) - 
Kong Rithdee (The Bangkok Post. Thailand) -  4
Francisco Ferreira (Expresso, Portugal) -  4
Violeta Kovacsics (Diari de Tarragona, España) –  8
Jaime Pena (El Amante, Argentina y Cahiers du cinéma, España) - 5.9
Olivier Pere (Les Inrockuptibles, France) -
Eugenio Renzi (Independencia, France) -
Luciano Barisone (Duellanti / Panoramiches, Italy) –  4
Carlo Chatrian (Duellanti / Panoramiches, Italy) -
Jose Luis De Lorenzo (A Sala Llena, Argentina) –  4
Fernando Juan Lima (El Amante, Argentina) –  4
Xavi Serra (Ara, España) -
Ernesto Garratt (El Mercurio, Chile) -
Nick James (Sight & Sound, England) -
Sergi Sanchez (La Razón, España) -  5
Sara Brito (Público, España) - 6
Scott Foundas (Film Comment, U.S.) -  8
Sergio Wolf (BAFICI, Argentina) -
Rudiger Suchsland (WAZ / Negativ, Deutschland) - 7.9
Alvaro Arroba (La Lectora Provisoria, Argentina) –  6.5
Pablo O. Scholz (Clarín, Argentina) –  6
Nando Salva (El Periódico, España) - 4
Pedro Butcher (Filme B / Folha de Sao Paulo, Brasil) -
Gabriele Barrera (Nick FilmTV / Best Movie / Cinecritica, Italy) -
Pamela Bienzobas (Mabuse, Chile) – 5.50
Manu Yáñez(Fotogramas, España) -
Gregory Valens (Positif, France) -
Christoph Huber (Die Presse, Austria) -
Marcelo Alderete (Mar del Plata Film Festival, Argentina) –  3
Belinda Van De Graaf (Trouw, Holanda) -
Arthur Mas (Independencia, France) -
Martial Pisani (Independencia, France) -
Carlos Reviriego (El Cultural / Cahiers du cinéma, España) –  4.5
Alejandro G. Calvo (SensaCine, España) -  7
Anchalee Chaiworaporn (Siam Rath, Image Magazine, Thailand) -  7
Peter Bradshaw (Guardian, UK) 4
Raffi Asdourian (The Film Stage, USA) 9 A
 Ioncinema:
Christophe Beney (Palmares magazine, France) 10
David Calhoun (The Out London, UK) 3.75
Per Juul Carlsen (Danish National Radio, Denmark) 8.75
Paola Casella (Europa, Italy) 7.5
Andrei Creţulescu (HBO Romania) 7.5
Carlos F. Heredero (Cahiers du cinema Espana, Spain) 7.5
Eric Lavallée (Ioncinema.com, Canada) 5
Fabien Lemercier (Cineeuropa.org, Belgium) 8.75 B+
Guy Lodge (InContention.com, South Africa) 8.75
Elisabeth Quin (Paris Premiere, France)
Isabelle Regnier (Le Monde, France) 10
James Rocchi (MSN Movies, Indiewire's The Playlist, USA) 8.75
Cédric Succivalli (International Cinephil Society, France) 2.5
Anne Thompson (Indiewire, USA) 10 A
Clarence Tsui (South China Morning Post, Hong Kong) 7.5
Eduardo Valente (Revista Cinema, Brazil) 2.5
 Screen Daily:
Nick James (Sight & Sound, UK) 5
David Stratton (The Australian, Australia) 1
Derek Malcolm (London Evening, UK) 7.5
Jan Schulz-Ojala (Der Tagesspiegel, Deutschland) 7.5
Jose Carlos Avellar (Escrevercinema.com, Brazil) 5
Dennis Lim (The New York Times, USA) 5
Michel Ciment (Positif, France) 9
Alberto Crespi (L'Unita, Italy) 5
Bo Green Jensen (Weekandavisen Berlingske, Denmark) 9
Screen International (Screen International, USA) 5
 Indiewire:
Mike d'Angelo (AV Club, USA) 4.2 C
Eric Kohn (Indiewire, USA) 9 A
Rob Nelson (Variety, USA) 6.25 B
Simon Abrams (Freelance, USA) 7.5 B+
David Fear (Time Out New York, USA)
Jon Frosch (France 24, USA) 5 B-
Michael Giltz (The Huffington Post, USA) 2 C-
Peter Howell (The Toronto Star, USA) 7.5 B+
Patrick Z. McGavin (Lightsensitive.typepad.com, USA) 9 A
Anne Thompson (Indiewire, USA) 9 A
David Calhoun (Time Out London, UK) 4
Kevin Jagernauth (Indiewire's The Playlist, USA) 4 C+
Simon Gallagher (filmschoolrejects.com, UK) 8 A
Karina Longworth (LA Weekly, USA) 9 A
Sasha Stone (AwardsDaily, USA) 7.5 B+
Chase Whale (Gordon and the Whale, USA) 10 A+
Joshua Brunsting (Gordon and the Whale, USA) 9 A

“Ichimei / Hara-kiri”, de Takashi Miike (6.15) 24 votos [Competition]
Fernando Ganzo (Lumiere, España) –  4
Carlos Heredero (Cahiers du cinéma, España) –  7
Luciano Monteagudo (Página12, Argentina) – 7.50
Roger Alan Koza (La Voz del Interior / Con los ojos abiertos, Argentina) -
Mark Peranson (Cinema Scope, Canada) -
Eulalia Iglesias (Rockdelux, Cahiers du cinéma, España) -
Diego Batlle (La Nación / OtrosCines, Argentina) –  8
Cristina Nord (Die Tageszeitung, Deutschland) –  7
Markus Keuschnigg (Die Presse, Austria) -
Kong Rithdee (The Bangkok Post. Thailand) -
Francisco Ferreira (Expresso, Portugal) -  2
Violeta Kovacsics (Diari de Tarragona, España) – 6
Jaime Pena (El Amante, Argentina y Cahiers du cinéma, España) –  7
Olivier Pere (Les Inrockuptibles, France) -
Eugenio Renzi (Independencia, France) -
Luciano Barisone (Duellanti / Panoramiches, Italy) –  7
Carlo Chatrian (Duellanti / Panoramiches, Italy) -
Jose Luis De Lorenzo (A Sala Llena, Argentina) –  8
Fernando Juan Lima (El Amante, Argentina) –  8
Xavi Serra (Ara, España) -
Ernesto Garratt (El Mercurio, Chile) -
Nick James (Sight & Sound, England) -
Sergi Sanchez (La Razón, España) -  6.5
Sara Brito (Público, España) - 6.5
Scott Foundas (Film Comment, U.S.) – 9
Sergio Wolf (BAFICI, Argentina) -
Rudiger Suchsland (FAZ / Negativ, Deutschland) –  4.5
Alvaro Arroba (La Lectora Provisoria, Argentina) –  5.5
Pablo O. Scholz (Clarín, Argentina) –  4
Nando Salva (El Periódico, España) - 3
Pedro Butcher (Filme B / Folha de Sao Paulo, Brasil) -  4
Gabriele Barrera (Nick FilmTV / Best Movie / Cinecritica, Italy) -
Pamela Bienzobas (Mabuse, Chile) -  6.7
Manu Yáñez(Fotogramas, España) -
Gregory Valens (Positif, France) -
Christoph Huber (Die Presse, Austria) -
Marcelo Alderete (Mar del Plata Film Festival, Argentina) - 5
Belinda Van De Graaf (Trouw, Holanda) -
Arthur Mas (Independencia, France) -
Martial Pisani (Independencia, France) -
Carlos Reviriego (El Cultural / Cahiers du cinéma, España) –  7.5
Alejandro G. Calvo (SensaCine, España) –  7
Anchalee Chaiworaporn (Siam Rath, Image Magazine, Thailand) -  7
Mike d'Angelo (AV Club, USA) 5.3
 Ioncinema:
Christophe Beney (Palmares magazine, France) 7.5
David Calhoun (The Out London, UK) 3.75
Per Juul Carlsen (Danish National Radio, Denmark) 3.75
Paola Casella (Europa, Italy) 5
Andrei Creţulescu (HBO Romania)
Carlos F. Heredero (Cahiers du cinema Espana, Spain) 7.5
Eric Lavallée (Ioncinema.com, Canada)
Fabien Lemercier (Cineeuropa.org, Belgium) 5
Guy Lodge (InContention.com, South Africa) 3.75
Elisabeth Quin (Paris Premiere, France) 5
Isabelle Regnier (Le Monde, France)
James Rocchi (MSN Movies, Indiewire's The Playlist, USA) 0
Cédric Succivalli (International Cinephil Society, France) 3.75
Anne Thompson (Indiewire, USA) 6.75
Clarence Tsui (South China Morning Post, Hong Kong) 6.75
Eduardo Valente (Revista Cinema, Brazil) 6.75
 Screen Daily:
Nick James (Sight & Sound, UK) 2.5
David Stratton (The Australian, Australia) 5
Derek Malcolm (London Evening, UK) 5
Jan Schulz-Ojala (Der Tagesspiegel, Deutschland) 2.5
Jose Carlos Avellar (Escrevercinema.com, Brazil) 5
Dennis Lim (The New York Times, USA) 5
Michel Ciment (Positif, France) 5
Alberto Crespi (L'Unita, Italy) 2.5
Bo Green Jensen (Weekandavisen Berlingske, Denmark) 5
Screen International (Screen International, USA) 5

"Oslo, 31. August" Joachim Trier (4.25) 8 votos [Un Certain Regard]
Roger Alan Koza (La Voz del Interior / Con los ojos abiertos, Argentina) – 5
Diego Batlle (La Nación / OtrosCines, Argentina) –  6
Jaime Pena (El Amante, Argentina y Cahiers du cinéma, España) –  6
Jose Luis De Lorenzo (A Sala Llena, Argentina) –  3
Fernando Juan Lima (El Amante, Argentina) –  4
Alvaro Arroba (La Lectora Provisoria, Argentina) –  1
Pablo O. Scholz (Clarín, Argentina) –  5
Carlos Reviriego (El Cultural / Cahiers du cinéma, España) –  4

"The Beaver" Jody Foster (2.80) 5 votos [Out of Competition]
Carlos Heredero (Cahiers du cinéma, España) –  3
Eulalia Iglesias (Rockdelux, Cahiers du cinéma, España) –  4
Violeta Kovacsics (Diari de Tarragona, España) -  2
Sergi Sanchez (La Razón, España) –  4
Alejandro G. Calvo (SensaCine, España) –   1
Peter Bradshaw (Guardian, UK) 2
Simon Reynolds (Digital Spy, UK) 4
David Calhoun (Time Out London, UK) 4
David Gritten (Telegraph, UK) 6
?? () 3
 Indiewire:
Kate Erbland (GordonandtheWhale.com, USA) 4 C+ 
William Goss (Film.com, USA) 4 C+
Tim Grierson (Screen International, L.A. Weekly, USA) 4 C+ 
Robert Horton (The Herald, USA) 5 B- 
Mark Jenkins (NPR, USA) 3 C 
Eric Kohn (Indiewire, USA) 6.25 B
Robert Levin (amNew York, USA) 6.25 B 
Joe Leydon (Variety, USA) 4 C+
Peter Martin (Twitch, USA) 5 B- 
Matt Patches (Freelance, USA) 6.25 B 
Bryce J Renninger (indieWIRE, USA) 6.25 B 
Matt Singer (IFC News, USA) 5 B- 
Anne Thompson (Indiewire, USA) 7.5 B+
Chase Whale (Gordon and the Whale) 3 C 

“Loverboy”, de Catalin Mitulescu (5.18) 10 votos [Un Certain Regard]
Carlos Heredero (Cahiers du cinéma, España) –  3
Luciano Monteagudo (Página12, Argentina) –  5
Diego Batlle (La Nación / OtrosCines, Argentina) –  6.5
Cristina Nord (Die Tageszeitung, Deutschland) –  5
Luciano Barisone (Duellanti / Panoramiches, Italy) –  5
Carlo Chatrian (Duellanti / Panoramiches, Italy) -  4
Jose Luis De Lorenzo (A Sala Llena, Argentina) –  6
Fernando Juan Lima (El Amante, Argentina) –  5
Pablo O. Scholz (Clarín, Argentina) –  5
Mike d'Angelo (AV Club, USA) 0 walkaout

"Skoonheid / Beauty" Oliver Hermanus (2.40) 5 votos [Un Certain Regard]
Kong Rithdee (The Bangkok Post. Thailand) –  5
Olivier Pere (Les Inrockuptibles, France) –  0
Pedro Butcher (Filme B / Folha de Sao Paulo, Brasil) –  3
Marcelo Alderete (Mar del Plata Film Festival, Argentina) –  3
Alejandro G. Calvo (SensaCine, España) –  1
Guy Lodge (InContention.com, South Africa) 7.5 B+
Michael Giltz (The Huffington Post, USA) 5  2/4

"Tatsumi" Eric Khoo (6.59) 13 voto [Un Certain Regard]
Ernando Ganzo (Lumiere, España) –  5
Carlos Heredero (Cahiers du cinéma, España) –  5
Luciano Monteagudo (Página12, Argentina) -
Roger Alan Koza (La Voz del Interior / Con los ojos abiertos, Argentina) -
Mark Peranson (Cinema Scope, Canada) -
Eulalia Iglesias (Rockdelux, Cahiers du cinéma, España) -
Diego Batlle (La Nación / OtrosCines, Argentina) –  8
Cristina Nord (Die Tageszeitung, Deutschland) -
Markus Keuschnigg (Die Presse, Austria) -
Kong Rithdee (The Bangkok Post. Thailand) -
Francisco Ferreira (Expresso, Portugal) -  6.5
Violeta Kovacsics (Diari de Tarragona, España) -
Jaime Pena (El Amante, Argentina y Cahiers du cinéma, España) –  7
Olivier Pere (Les Inrockuptibles, France) –  8
Eugenio Renzi (Independencia, France) -  5.9
Luciano Barisone (Duellanti / Panoramiches, Italy) -
Carlo Chatrian (Duellanti / Panoramiches, Italy) –  6
Jose Luis De Lorenzo (A Sala Llena, Argentina) –  8
Fernando Juan Lima (El Amante, Argentina) –  6
Xavi Serra (Ara, España) -
Ernesto Garratt (El Mercurio, Chile) -
Nick James (Sight & Sound, England) -
Sergi Sanchez (La Razón, España) -
Sara Brito (Público, España) -
Scott Foundas (Film Comment, U.S.) -
Sergio Wolf (BAFICI, Argentina) -
Rudiger Suchsland (FAZ / Negativ, Deutschland) – 7.3
Alvaro Arroba (La Lectora Provisoria, Argentina) -
Pablo O. Scholz (Clarín, Argentina) -
Nando Salva (El Periódico, España) -
Pedro Butcher (Filme B / Folha de Sao Paulo, Brasil) -
Gabriele Barrera (Nick FilmTV / Best Movie / Cinecritica, Italy) -
Pamela Bienzobas (Mabuse, Chile) -
Manu Yáñez(Fotogramas, España) -
Gregory Valens (Positif, France) -
Christoph Huber (Die Presse, Austria) -
Marcelo Alderete (Mar del Plata Film Festival, Argentina) –  6
Belinda Van De Graaf (Trouw, Holanda) -
Arthur Mas (Independencia, France) -
Martial Pisani (Independencia, France) -
Carlos Reviriego (El Cultural / Cahiers du cinéma, España) -
Alejandro G. Calvo (SensaCine, España) –  8
Anchalee Chaiworaporn (Siam Rath, Image Magazine, Thailand) -

"Hanezu No Tsuki" Naomi Kawase (6.30) 22 votos [Competition]
Fernando Ganzo (Lumiere, España) –  6
Carlos Heredero (Cahiers du cinéma, España) - 7
Luciano Monteagudo (Página12, Argentina) - 7
Roger Alan Koza (La Voz del Interior / Con los ojos abiertos, Argentina) – 5.5
Mark Peranson (Cinema Scope, Canada) -
Eulalia Iglesias (Rockdelux, Cahiers du cinéma, España) - 6
Diego Batlle (La Nación / OtrosCines, Argentina) –  7.50
Cristina Nord (Die Tageszeitung, Deutschland) -
Markus Keuschnigg (Die Presse, Austria) -
Kong Rithdee (The Bangkok Post. Thailand) - 6
Francisco Ferreira (Expresso, Portugal) -
Violeta Kovacsics (Diari de Tarragona, España) – 6.5
Jaime Pena (El Amante, Argentina y Cahiers du cinéma, España) –  7
Olivier Pere (Les Inrockuptibles, France) -
Eugenio Renzi (Independencia, France) - 4.7
Luciano Barisone (Duellanti / Panoramiches, Italy) –  8
Carlo Chatrian (Duellanti / Panoramiches, Italy) - 8.5
Jose Luis De Lorenzo (A Sala Llena, Argentina) -
Fernando Juan Lima (El Amante, Argentina) - 6
Xavi Serra (Ara, España) -
Ernesto Garratt (El Mercurio, Chile) -
Nick James (Sight & Sound, England) -
Sergi Sanchez (La Razón, España) - 5
Sara Brito (Público, España) - 5
Scott Foundas (Film Comment, U.S.) -
Sergio Wolf (BAFICI, Argentina) -
Rudiger Suchsland (WAZ / Negativ, Deutschland) - 4
Alvaro Arroba (La Lectora Provisoria, Argentina) -
Pablo O. Scholz (Clarín, Argentina) - 6
Nando Salva (El Periódico, España) - 4
Pedro Butcher (Filme B / Folha de Sao Paulo, Brasil) -
Gabriele Barrera (Nick FilmTV / Best Movie / Cinecritica, Italy) -
Pamela Bienzobas (Mabuse, Chile) -
Manu Yáñez(Fotogramas, España) -
Gregory Valens (Positif, France) -
Paolo Bertolin (Cineforum, Italia)  –  7
Marcelo Alderete (Mar del Plata Film Festival, Argentina) -
Belinda Van De Graaf (Trouw, Holanda) -
Arthur Mas (Independencia, France) -
Martial Pisani (Independencia, France) -
Carlos Reviriego (El Cultural / Cahiers du cinéma, España) –  7
Alejandro G. Calvo (SensaCine, España) - 5
Anchalee Chaiworaporn (Siam Rath, Image Magazine, Thailand) - 10
 Ioncinema:
Christophe Beney (Palmares magazine, France) 2.5
David Calhoun (The Out London, UK) 6.25
Per Juul Carlsen (Danish National Radio, Denmark) 1.25
Paola Casella (Europa, Italy) 5
Andrei Creţulescu (HBO Romania)
Carlos F. Heredero (Cahiers du cinema Espana, Spain) 7.5
Eric Lavallée (Ioncinema.com, Canada) 3.75
Fabien Lemercier (Cineeuropa.org, Belgium) 5
Guy Lodge (InContention.com, South Africa) 
Elisabeth Quin (Paris Premiere, France) 5
Isabelle Regnier (Le Monde, France) 8.75
James Rocchi (MSN Movies, Indiewire's The Playlist, USA)
Cédric Succivalli (International Cinephil Society, France) 5
Anne Thompson (Indiewire, USA)
Clarence Tsui (South China Morning Post, Hong Kong) 5
Eduardo Valente (Revista Cinema, Brazil) 5
 Screen Daily:
Nick James (Sight & Sound, UK) 5
David Stratton (The Australian, Australia) 2.5
Derek Malcolm (London Evening, UK) 2.5
Jan Schulz-Ojala (Der Tagesspiegel, Deutschland) 2.5
Jose Carlos Avellar (Escrevercinema.com, Brazil) 9
Dennis Lim (The New York Times, USA) 2.5
Michel Ciment (Positif, France) 1
Alberto Crespi (L'Unita, Italy) 5
Bo Green Jensen (Weekandavisen Berlingske, Denmark) 5
Screen International (Screen International, USA) 5
 IndieWire:
Joshua Brunsting (Chase and the Whale, USA) 2 C-
Michael Giltz (The Huffington Post, USA) 3.25 1.5/4

"Busong" Auraeus Solito (5.30) 5 votos [Quinzaine]
Jaime Pena (El Amante, Argentina y Cahiers du cinéma, España) –  4
Carlo Chatrian (Duellanti / Panoramiches, Italy) –  6
Alvaro Arroba (La Lectora Provisoria, Argentina) –  4.5
Paolo Bertolin (Cineforum, Italia) - 6
Carlos Reviriego (El Cultural / Cahiers du cinéma, España) –  6

"The Island" Kamen Kalev (5.50) 2 votos [Quinzaine]
Jaime Pena (El Amante, Argentina y Cahiers du cinéma, España) –  3
Carlo Chatrian (Duellanti / Panoramiches, Italy) –  8

"Corpo celeste" Alice Rohrwacher (6.50) 2 votos [Quinzaine]
Fernando Ganzo (Lumiere, España) –  6
Luciano Barisone (Duellanti / Panoramiches, Italy) –  7

"O abismo prateado" Karim Aïnouz (5.91) 11 votos [Quinzaine]
Carlos Heredero (Cahiers du cinéma, España) –  6
Roger Alan Koza (La Voz del Interior / Con los ojos abiertos, Argentina) – 5.5
Eulalia Iglesias (Rockdelux, Cahiers du cinéma, España) –  6
Diego Batlle (La Nación / OtrosCines, Argentina) – 6
Jaime Pena (El Amante, Argentina y Cahiers du cinéma, España) –  7.5
Luciano Barisone (Duellanti / Panoramiches, Italy) –  5
Carlo Chatrian (Duellanti / Panoramiches, Italy) –  6.5
Fernando Juan Lima (El Amante, Argentina) –  7.50
Pedro Butcher (Filme B / Folha de Sao Paulo, Brasil) – 6.5
Marcelo Alderete (Mar del Plata Film Festival, Argentina) –  2
Carlos Reviriego (El Cultural / Cahiers du cinéma, España) –  6.50

"Pater" Alain Cavalier (5.77) 22 votos [Competition]
Fernando Ganzo (Lumiere, España) -
Carlos Heredero (Cahiers du cinéma, España) -
Luciano Monteagudo (Página12, Argentina) - 6
Roger Alan Koza (La Voz del Interior / Con los ojos abiertos, Argentina) – 7.50
Mark Peranson (Cinema Scope, Canada) -
Eulalia Iglesias (Rockdelux, Cahiers du cinéma, España) -
Diego Batlle (La Nación / OtrosCines, Argentina) -  7
Cristina Nord (Die Tageszeitung, Deutschland) -
Markus Keuschnigg (Die Presse, Austria) -
Kong Rithdee (The Bangkok Post. Thailand) -  6.5
Francisco Ferreira (Expresso, Portugal) - 2
Violeta Kovacsics (Diari de Tarragona, España) -
Jaime Pena (El Amante, Argentina y Cahiers du cinéma, España) –  5.50
Olivier Pere (Les Inrockuptibles, France) –  6
Eugenio Renzi (Independencia, France) - 3
Luciano Barisone (Duellanti / Panoramiches, Italy) –  6
Carlo Chatrian (Duellanti / Panoramiches, Italy) -
Jose Luis De Lorenzo (A Sala Llena, Argentina) -  8
Fernando Juan Lima (El Amante, Argentina) –  6
Xavi Serra (Ara, España) -
Ernesto Garratt (El Mercurio, Chile) -
Nick James (Sight & Sound, England) -
Sergi Sanchez (La Razón, España) - 5
Sara Brito (Público, España) -
Scott Foundas (Film Comment, U.S.) –  8
Sergio Wolf (BAFICI, Argentina) -
Rudiger Suchsland (WAZ / Negativ, Deutschland) -
Alvaro Arroba (La Lectora Provisoria, Argentina) –  6
Pablo O. Scholz (Clarín, Argentina) - 5
Nando Salva (El Periódico, España) -
Pedro Butcher (Filme B / Folha de Sao Paulo, Brasil) -  6.5
Gabriele Barrera (Nick FilmTV / Best Movie / Cinecritica, Italy) -
Pamela Bienzobas (Mabuse, Chile) -  8
Manu Yáñez(Fotogramas, España) -
Gregory Valens (Positif, France) -
Paolo Bertolin (Cineforum, Italia)  -  5.5
Marcelo Alderete (Mar del Plata Film Festival, Argentina) - 6
Belinda Van De Graaf (Trouw, Holanda) -
Arthur Mas (Independencia, France) -
Martial Pisani (Independencia, France) -
Carlos Reviriego (El Cultural / Cahiers du cinéma, España) – 5.50
Alejandro G. Calvo (SensaCine, España) –  5
Anchalee Chaiworaporn (Siam Rath, Image Magazine, Thailand) -  3
 Ioncinema:
Christophe Beney (Palmares magazine, France) 5
David Calhoun (The Out London, UK) 
Per Juul Carlsen (Danish National Radio, Denmark)
Paola Casella (Europa, Italy)
Andrei Creţulescu (HBO Romania)
Carlos F. Heredero (Cahiers du cinema Espana, Spain)
Eric Lavallée (Ioncinema.com, Canada)
Fabien Lemercier (Cineeuropa.org, Belgium) 2.5
Guy Lodge (InContention.com, South Africa)
Elisabeth Quin (Paris Premiere, France) 10
Isabelle Regnier (Le Monde, France)
James Rocchi (MSN Movies, Indiewire's The Playlist, USA)
Cédric Succivalli (International Cinephil Society, France) 8.75
Anne Thompson (Indiewire, USA)
Clarence Tsui (South China Morning Post, Hong Kong) 2.5
Eduardo Valente (Revista Cinema, Brazil) 3.75
 Screen Daily:
Nick James (Sight & Sound, UK) 2.5
David Stratton (The Australian, Australia) 
Derek Malcolm (London Evening, UK) 5
Jan Schulz-Ojala (Der Tagesspiegel, Deutschland) 2.5
Jose Carlos Avellar (Escrevercinema.com, Brazil) 7.5
Dennis Lim (The New York Times, USA) 5
Michel Ciment (Positif, France) 7.5
Alberto Crespi (L'Unita, Italy) 7.5
Bo Green Jensen (Weekandavisen Berlingske, Denmark) 2.5
Screen International (Screen International, USA) 2.5
 Indiewire:
Mike d'Angelo (AV Club, USA) 2.6 D+
Simon Abrams (Freelance, USA) 2 C-
David Calhoun (Time Out London, UK) 4

"Play" Ruben Östlun (6.04) 5 votos [Quinzaine] Séance "Coup de coeur" prize 
Diego Batlle (La Nación / OtrosCines, Argentina) –  8
Cristina Nord (Die Tageszeitung, Deutschland) – 6.9
Jaime Pena (El Amante, Argentina y Cahiers du cinéma, España) –  6
Rudiger Suchsland (WAZ / Negativ, Deutschland) –  7.3
Marcelo Alderete (Mar del Plata Film Festival, Argentina) –  2
Mike d'Angelo (AV Club, USA) 5.9

“Impardonnables” André Techine (4.97) 11 votos [Quinzaine]
Fernando Ganzo (Lumiere, España) –  3.1416
Carlos Heredero (Cahiers du cinéma, España) -  5
Luciano Monteagudo (Página12, Argentina) –  5
Eulalia Iglesias (Rockdelux, Cahiers du cinéma, España) –  5
Cristina Nord (Die Tageszeitung, Deutschland) –  5
Kong Rithdee (The Bangkok Post. Thailand) –  6
Francisco Ferreira (Expresso, Portugal) -  3
Jaime Pena (El Amante, Argentina y Cahiers du cinéma, España) – 6.5
Carlo Chatrian (Duellanti / Panoramiches, Italy) –  5
Fernando Juan Lima (El Amante, Argentina) – 6
Carlos Reviriego (El Cultural / Cahiers du cinéma, España) –  5
Mike d'Angelo (AV Club, USA) 3.8

“Le Havre” Aki Kaurismaki (8.72) 29 votos [Competition] FIPRESCI Price
Fernando Ganzo (Lumiere, España) - 8.8
Carlos Heredero (Cahiers du cinéma, España) – 9.9
Luciano Monteagudo (Página12, Argentina) - 9
Roger Alan Koza (La Voz del Interior / Con los ojos abiertos, Argentina) – 9
Mark Peranson (Cinema Scope, Canada) -
Eulalia Iglesias (Rockdelux, Cahiers du cinéma, España) – 10
Diego Batlle (La Nación / OtrosCines, Argentina) -10
Cristina Nord (Die Tageszeitung, Deutschland) –  8
Markus Keuschnigg (Die Presse, Austria) -
Kong Rithdee (The Bangkok Post. Thailand) -  7.5
Francisco Ferreira (Expresso, Portugal) -  7
Violeta Kovacsics (Diari de Tarragona, España) -  9
Jaime Pena (El Amante, Argentina y Cahiers du cinéma, España) - 9.5
Olivier Pere (Les Inrockuptibles, France) - 8
Eugenio Renzi (Independencia, France) -
Luciano Barisone (Duellanti / Panoramiches, Italy) - 8
Carlo Chatrian (Duellanti / Panoramiches, Italy) - 9
Jose Luis De Lorenzo (A Sala Llena, Argentina) - 10
Fernando Juan Lima (El Amante, Argentina) - 10
Xavi Serra (Ara, España) -
Ernesto Garratt (El Mercurio, Chile) -
Nick James (Sight & Sound, England) -
Sergi Sanchez (La Razón, España) - 9
Sara Brito (Público, España) – 8.8
Scott Foundas (Film Comment, U.S.) -
Sergio Wolf (BAFICI, Argentina) - 8
Rudiger Suchsland (WAZ / Negativ, Deutschland) -
Alvaro Arroba (La Lectora Provisoria, Argentina) - 7.9
Pablo O. Scholz (Clarín, Argentina) –  7
Nando Salva (El Periódico, España) – 8
Pedro Butcher (Filme B / Folha de Sao Paulo, Brasil) -  8.5
Gabriele Barrera (Nick FilmTV / Best Movie / Cinecritica, Italy) -
Pamela Bienzobas (Mabuse, Chile) -  8
Manu Yáñez(Fotogramas, España) -
Gregory Valens (Positif, France) -
Paolo Bertolin (Cineforum, Italia) –  9.50
Marcelo Alderete (Mar del Plata Film Festival, Argentina) - 8
Belinda Van De Graaf (Trouw, Holanda) -
Arthur Mas (Independencia, France) -
Martial Pisani (Independencia, France) -
Carlos Reviriego (El Cultural / Cahiers du cinéma, España) - 8.5
Alejandro G. Calvo (SensaCine, España) – 9
Anchalee Chaiworaporn (Siam Rath, Image Magazine, Thailand) -  10
   PROMEDIO: 8.72 (29 votos) EN ASCENSO
 Ioncinema:
Christophe Beney (Palmares magazine, France) 5
David Calhoun (The Out London, UK) 6.25
Per Juul Carlsen (Danish National Radio, Denmark) 7.5
Paola Casella (Europa, Italy) 7.5
Andrei Creţulescu (HBO Romania) 10
Carlos F. Heredero (Cahiers du cinema Espana, Spain) 10
Eric Lavallée (Ioncinema.com, Canada) 5
Fabien Lemercier (Cineeuropa.org, Belgium) 5
Guy Lodge (InContention.com, South Africa)
Elisabeth Quin (Paris Premiere, France) 10
Isabelle Regnier (Le Monde, France)
James Rocchi (MSN Movies, Indiewire's The Playlist, USA) 7.5
Cédric Succivalli (International Cinephil Society, France) 7.5
Anne Thompson (Indiewire, USA)
Clarence Tsui (South China Morning Post, Hong Kong) 7.5
Eduardo Valente (Revista Cinema, Brazil)
Peter Bradshaw (Guardian, UK)
Mike d'Angelo (AV Club, USA) 5.1 C+ Crowd seems ready to eat up anything heartwarming this year, even when it's as willfully programmatic as this.
Kevin Jagernauth (Indiewire's The Playlist, USA) 9 A
David Gritten (Telegraph, UK) 8
 Screen Daily:
Nick James (Sight & Sound, UK) 7.5
David Stratton (The Australian, Australia) 7.5
Derek Malcolm (London Evening, UK) 7.5
Jan Schulz-Ojala (Der Tagesspiegel, Deutschland) 7.5
Jose Carlos Avellar (Escrevercinema.com, Brazil) 9
Dennis Lim (The New York Times, USA) 7.5
Michel Ciment (Positif, France) 7.5
Alberto Crespi (L'Unita, Italy) 9
Bo Green Jensen (Weekandavisen Berlingske, Denmark) 7.5
Screen International (Screen International, USA) 7.5
 IndieWire:
Joshua Brunsting (Chase and the Whale, USA) 9 A
Eric Kohn (Indiewire, USA) 8 A-
Michael Giltz (The Huffington Post, USA) 6.25 2.5/4

“Et maintenant, on va ou?” Nadine Labaki (3.125) 8 votos [Un Certain Regard]
Carlos Heredero (Cahiers du cinéma, España) -  2
Eulalia Iglesias (Rockdelux, Cahiers du cinéma, España) –  5
Diego Batlle (La Nación / OtrosCines, Argentina) -  5
Kong Rithdee (The Bangkok Post. Thailand) –  4
Jose Luis De Lorenzo (A Sala Llena, Argentina) –  3
Fernando Juan Lima (El Amante, Argentina) –  2
Manu Yáñez(Fotogramas, España) -  2
Alejandro G. Calvo (SensaCine, España) –  2

"Code Blue" Urszula Antonia (5.00) 2 votos [Quinzaine]
Jose Luis De Lorenzo (A Sala Llena, Argentina) -  4
Fernando Juan Lima (El Amante, Argentina) -  6

"Unlawful Killing" Keith Allen
Simon Gallagher (filmschoolrejects.com, UK) 6.25 B
Matt Holmes (Obsessedwithfilm.com, USA) 3

“Hors Satan” Bruno Dumont (5.97) 26 votos [Un Certain Regard]
Fernando Ganzo (Lumiere, España) –  2.01
Carlos Heredero (Cahiers du cinéma, España) –  3
Luciano Monteagudo (Página12, Argentina) -  8
Roger Alan Koza (La Voz del Interior / Con los ojos abiertos, Argentina) –  8
Mark Peranson (Cinema Scope, Canada) -
Eulalia Iglesias (Rockdelux, Cahiers du cinéma, España) –  8
Diego Batlle (La Nación / OtrosCines, Argentina) -  8
Cristina Nord (Die Tageszeitung, Deutschland) –  4.9
Kong Rithdee (The Bangkok Post. Thailand) –  7
Francisco Ferreira (Expresso, Portugal) -  4
Violeta Kovacsics (Diari de Tarragona, España) –  6
Jaime Pena (El Amante, Argentina y Cahiers du cinéma, España) –  4.5
Eugenio Renzi (Independencia, France) -  2.4
Luciano Barisone (Duellanti / Panoramiches, Italy) -  5
Carlo Chatrian (Duellanti / Panoramiches, Italy) –  7
Jose Luis De Lorenzo (A Sala Llena, Argentina) –  3
Fernando Juan Lima (El Amante, Argentina) –  8
Sara Brito (Público, España) –  7.5
Scott Foundas (Film Comment, U.S.) –  8
Sergio Wolf (BAFICI, Argentina) –  8
Rudiger Suchsland (WAZ / Negativ, Deutschland) –  6.5
Alvaro Arroba (La Lectora Provisoria, Argentina) –  2
Pablo O. Scholz (Clarín, Argentina) – 6
Manu Yáñez(Fotogramas, España) -  7
Marcelo Alderete (Mar del Plata Film Festival, Argentina) –  7
Carlos Reviriego (El Cultural / Cahiers du cinéma, España) –  8.5
Alejandro G. Calvo (SensaCine, España) -  6
Simon Gallagher (filmschoolrejects.com, UK) 0   a pointless and pretentious exercise
Kevin Jagernauth (Indiewire's The Playlist, USA) 1.8 D- Devilishly Dull The walkouts for “Hors Satan” started at the half hour mark and continued to be peppered through the film right up until about fifteen minutes from the end
Mike d'Angelo (AV Club, USA) 4.4 Welcome back, the Bruno Dumont I always kind of hated. Nice fakeout with HADEWIJCH, I totally fell for it.
  Indiewire:
Michael Giltz (The Huffington Post, USA) 5 2/4 (2 C-)
Rob Nelson (Variety, USA) 6.25 B
Guy Lodge (InContention.com, South Africa) 1.5 D+

“The Tree of Life” Terrence Malick (7.09) 30 votos [Competition] Palm d'Or
Fernando Ganzo (Lumiere, España) – 6.666
Carlos Heredero (Cahiers du cinéma, España) –  6.5
Luciano Monteagudo (Página12, Argentina) -  6
Roger Alan Koza (La Voz del Interior / Con los ojos abiertos, Argentina) –  7
Mark Peranson (Cinema Scope, Canada) -
Eulalia Iglesias (Rockdelux, Cahiers du cinéma, España) – 1
Diego Batlle (La Nación / OtrosCines, Argentina) –  8
Cristina Nord (Die Tageszeitung, Deutschland) –  6
Markus Keuschnigg (Die Presse, Austria) -
Kong Rithdee (The Bangkok Post. Thailand) –  7.5
Francisco Ferreira (Expresso, Portugal) - 5.01
Violeta Kovacsics (Diari de Tarragona, España) –  7
Jaime Pena (El Amante, Argentina y Cahiers du cinéma, España) –  10
Olivier Pere (Les Inrockuptibles, France) -
Eugenio Renzi (Independencia, France) -
Luciano Barisone (Duellanti / Panoramiches, Italy) –  7
Carlo Chatrian (Duellanti / Panoramiches, Italy) –  7.5
Jose Luis De Lorenzo (A Sala Llena, Argentina) - 8
Fernando Juan Lima (El Amante, Argentina) –  10
Xavi Serra (Ara, España) -
Ernesto Garratt (El Mercurio, Chile) -
Nick James (Sight & Sound, England) -
Sergi Sanchez (La Razón, España) -  7
Sara Brito (Público, España) – 6.9
Scott Foundas (Film Comment, U.S.) –  10
Sergio Wolf (BAFICI, Argentina) -
Rudiger Suchsland (WAZ / Negativ, Deutschland) – 9.2
Alvaro Arroba (La Lectora Provisoria, Argentina) - 4.3
Pablo O. Scholz (Clarín, Argentina) -  8
Nando Salva (El Periódico, España) - 6
Pedro Butcher (Filme B / Folha de Sao Paulo, Brasil) –  8
Gabriele Barrera (Nick FilmTV / Best Movie / Cinecritica, Italy) -
Pamela Bienzobas (Mabuse, Chile) -
Manu Yáñez(Fotogramas, España) - 6.9
Robert Koehler (CinemaScope, Variety. U.S.) –  3
Paolo Bertolin (Cineforum, Italia) –  8
Gregory Valens (Positif, France) -
Marcelo Alderete (Mar del Plata Film Festival, Argentina) –  7
Belinda Van De Graaf (Trouw, Holanda) -
Arthur Mas (Independencia, France) -
Martial Pisani (Independencia, France) -
Carlos Reviriego (El Cultural / Cahiers du cinéma, España) –  9.1
Alejandro G. Calvo (SensaCine, España) –  9
Anchalee Chaiworaporn (Siam Rath, Image Magazine, Thailand) –  7
  PROMEDIO: 7.41 (23 votos) EN ASCENSO
Mike d'Angelo (AV Club, USA) 7 Was blown away so long as it kept speeding through time & space. A lesser thing once it settles in the '50s.
Peter Bradshaw (Guardian, UK) 10
 Ioncinema:
Christophe Beney (Palmares magazine, France) 7.5
David Calhoun (The Out London, UK) 6
Per Juul Carlsen (Danish National Radio, Denmark) 6.25
Paola Casella (Europa, Italy) 6.25
Andrei Creţulescu (HBO Romania) 6.25
Carlos F. Heredero (Cahiers du cinema Espana, Spain) 7.5
Eric Lavallée (Ioncinema.com, Canada) 8.75
Fabien Lemercier (Cineeuropa.org, Belgium) 10
Guy Lodge (InContention.com, South Africa) 4 C+ (fixed)
Elisabeth Quin (Paris Premiere, France)
Isabelle Regnier (Le Monde, France) 5
James Rocchi (MSN Movies, Indiewire's The Playlist, USA) 7.5
Cédric Succivalli (International Cinephil Society, France) 10
Anne Thompson (Indiewire, USA) 8 A-
Clarence Tsui (South China Morning Post, Hong Kong) 7.5
Eduardo Valente (Revista Cinema, Brazil) 5
Eric Kohn (Indiewire, USA) 8 A-
Kevin Jagernauth (Indiewire's The Playlist, USA) 6.25 B
Simon Gallagher (filmschoolrejects.com, UK) 3 C
Laremy Legel (Film.com, USA) 6.25 B
Simon Reynolds (Digital Spy, UK) 8
Raffi Asdourian (The Film Stage, USA) 5 B-
 Screen Daily:
Nick James (Sight & Sound, UK) 5
David Stratton (The Australian, Australia) 5
Derek Malcolm (London Evening, UK) 7.5
Jan Schulz-Ojala (Der Tagesspiegel, Deutschland) 2.5
Jose Carlos Avellar (Escrevercinema.com, Brazil) 5
Dennis Lim (The New York Times, USA) 9
Michel Ciment (Positif, France) 9
Alberto Crespi (L'Unita, Italy) 9
Bo Green Jensen (Weekandavisen Berlingske, Denmark) 9
Screen International (Screen International, USA) 5
 IndieWire:
Simon Abrams (Freelance, USA) 10 A+
Joshua Brunsting (Chase and the Whale, USA) 7.5 B+
David Fear (Time Out New York, USA) 7.5 B+
Jon Frosch (France 24, France) 9 A
Michael Giltz (The Huffington Post, USA) 9 A 4/4
Patrick Z. McGavin (Lightsensitive.typepad.com, USA) 9 A
Rob Nelson (Variety, USA) 8 A-
Jonathan Rosenbaum (Chicago Reader, USA) 4 C+
Chase Whale (Gordon and the Whale, USA) 2 C-

“L'Apollonide” Bertrand Bonello (6.10) 22 votos [Competition]
Fernando Ganzo (Lumiere, España) - 9
Carlos Heredero (Cahiers du cinéma, España) - 3
Luciano Monteagudo (Página12, Argentina) - 5
Roger Alan Koza (La Voz del Interior / Con los ojos abiertos, Argentina) -
Mark Peranson (Cinema Scope, Canada) -
Eulalia Iglesias (Rockdelux, Cahiers du cinéma, España) -
Diego Batlle (La Nación / OtrosCines, Argentina) -  8
Cristina Nord (Die Tageszeitung, Deutschland) -
Markus Keuschnigg (Die Presse, Austria) -
Kong Rithdee (The Bangkok Post. Thailand) -  6.5
Francisco Ferreira (Expresso, Portugal) - 9
Violeta Kovacsics (Diari de Tarragona, España) - 9
Jaime Pena (El Amante, Argentina y Cahiers du cinéma, España) –  8.8
Olivier Pere (Les Inrockuptibles, France) - 8
Eugenio Renzi (Independencia, France) -
Luciano Barisone (Duellanti / Panoramiches, Italy) –  5
Carlo Chatrian (Duellanti / Panoramiches, Italy) - 5
Jose Luis De Lorenzo (A Sala Llena, Argentina) - 4
Fernando Juan Lima (El Amante, Argentina) -
Xavi Serra (Ara, España) -
Ernesto Garratt (El Mercurio, Chile) -
Nick James (Sight & Sound, England) -
Sergi Sanchez (La Razón, España) - 4
Sara Brito (Público, España) - 6
Scott Foundas (Film Comment, USA) - 5
Sergio Wolf (BAFICI, Argentina) -
Rudiger Suchsland (WAZ / Negativ, Deutschland) -
Alvaro Arroba (La Lectora Provisoria, Argentina) -
Pablo O. Scholz (Clarín, Argentina) - 0
Nando Salva (El Periódico, España) - 4
Pedro Butcher (Filme B / Folha de Sao Paulo, Brasil) -  9
Gabriele Barrera (Nick FilmTV / Best Movie / Cinecritica, Italy) -
Pamela Bienzobas (Mabuse, Chile) -
Manu Yáñez(Fotogramas, España) - 8
Gregory Valens (Positif, France) -
Christoph Huber (Die Presse, Austria) -
Marcelo Alderete (Mar del Plata Film Festival, Argentina) -
Belinda Van De Graaf (Trouw, Holanda) -
Arthur Mas (Independencia, France) -
Martial Pisani (Independencia, France) -
Carlos Reviriego (El Cultural / Cahiers du cinéma, España) –  9
Alejandro G. Calvo (SensaCine, España) - 8
Anchalee Chaiworaporn (Siam Rath, Image Magazine, Thailand) - 1
Mike d'Angelo (AV Club, USA) 6.9
 Screen Daily:
Nick James (Sight & Sound, UK) 1
David Stratton (The Australian, Australia) 2.5
Derek Malcolm (London Evening, UK) 2.5
Jan Schulz-Ojala (Der Tagesspiegel, Deutschland) 1
Jose Carlos Avellar (Escrevercinema.com, Brazil) 2.5
Dennis Lim (The New York Times, USA) 7.5
Michel Ciment (Positif, France) 2.5
Alberto Crespi (L'Unita, Italy) 2.5
Bo Green Jensen (Weekandavisen Berlingske, Denmark) 5
Screen International (Screen International, USA) 2.5
 Ioncinema:
Christophe Beney (Palmares magazine, France)
David Calhoun (The Out London, UK) 2.5
Per Juul Carlsen (Danish National Radio, Denmark) 3.75
Paola Casella (Europa, Italy) 2.5
Andrei Creţulescu (HBO Romania)
Carlos F. Heredero (Cahiers du cinema Espana, Spain) 2.5
Eric Lavallée (Ioncinema.com, Canada)
Fabien Lemercier (Cineeuropa.org, Belgium) 7.5
Guy Lodge (InContention.com, South Africa) 2 C- (changed)
Elisabeth Quin (Paris Premiere, France) 7.5
Isabelle Regnier (Le Monde, France) 10
James Rocchi (MSN Movies, Indiewire's The Playlist, USA) 1.25
Cédric Succivalli (International Cinephil Society, France)
Anne Thompson (Indiewire, USA)
Clarence Tsui (South China Morning Post, Hong Kong) 2.5
Eduardo Valente (Revista Cinema, Brazil) 7.5
Kevin Jagernauth (Indiewire's The Playlist, USA) 0 F
Geoff Andrews (Time Out London, UK) 2
Simon Gallagher (filmschoolrejects.com, UK) 2 C-
 Indiewire:
Simon Abrams (Freelance, USA) 7.5 B+
Joshua Brunsting (Chase and the Whale, USA) 1.5 D+
David Fear (Time Out New York, USA) 4 C+
Jon Frosch (France 24, USA) 7.5 B+
Michael Giltz (The Huffington Post, USA) 1 D- 1.5/4
Patrick Z. McGavin (Lightsensitive.typepad.com, USA) 1 D

“Take Shelter” Jeff Nichols (6.90) 10 votos [Semaine] (Sundance) Semain Best Picture + Prix SACD
Kevin Jagernauth (Indiewire's The Playlist, USA) 8 A- (Sundance)
Eric Kohn (Indiewire, USA) 9 A (Sundance)
Eric D. Snider (Film.com, USA) 7.5 B+ (Sundance)
Matt Goldberg (Collider.com, USA) 4 C+ (Sundance)
Chris Bumbray (JoBlo.com/DVD Clinic, USA) 9 (Sundance)
Jordan Raup (TheFilmstage, USA) 8.5 A- (Sundance)
Chase Whale (Gordon and the Whale, USA) 10 Sundance
Blake (Bitchin Film Reviews, USA) 8.5 Sundance
Carlos Heredero (Cahiers du cinéma, España) -  7
Roger Alan Koza (La Voz del Interior / Con los ojos abiertos, Argentina) –  7
Cristina Nord (Die Tageszeitung, Deutschland) –  6.50
Violeta Kovacsics (Diari de Tarragona, España) -  6
Jaime Pena (El Amante, Argentina y Cahiers du cinéma, España) –  8
Olivier Pere (Les Inrockuptibles, France) –  8
Luciano Barisone (Duellanti / Panoramiches, Italy) –  6
Carlo Chatrian (Duellanti / Panoramiches, Italy) -  7.5
Marcelo Alderete (Mar del Plata Film Festival, Argentina) –  6
Carlos Reviriego (El Cultural / Cahiers du cinéma, España) –  7
Mike d'Angelo (AV Club, USA) 5.9
Paul Martin (Indies Movies Online, USA) 6

“Duch, Master of the Forges of Hell” Rithy Panh (8.13) 13 votos [Special Screenings]
Fernando Ganzo (Lumiere, España) –  8
Carlos Heredero (Cahiers du cinéma, España) -  8.5
Luciano Monteagudo (Página12, Argentina) –  9
Cristina Nord (Die Tageszeitung, Deutschland) –  6.3
Kong Rithdee (The Bangkok Post. Thailand) -  6
Francisco Ferreira (Expresso, Portugal) – 10
Violeta Kovacsics (Diari de Tarragona, España) -  7
Jaime Pena (El Amante, Argentina y Cahiers du cinéma, España) –  8.4
Luciano Barisone (Duellanti / Panoramiches, Italy) –  9
Carlo Chatrian (Duellanti / Panoramiches, Italy) -  9
Alvaro Arroba (La Lectora Provisoria, Argentina) –  9.5
Pablo O. Scholz (Clarín, Argentina) –  7
Marcelo Alderete (Mar del Plata Film Festival, Argentina) –  8

"Martha Marcy May Marlene" Sean Durkin (6.07) 13 votos [Un Certain Regard] (Sundance)
Imdb (79 votes) 7.6
Kate Erbland (Gordon and the Whale, USA) 9 Sundance
Raffi Asdourian (The Film Stage, USA) 8 A- Sundance
Alan Bacchus (Daily Film Dose, USA) 9 Sundance
Blake Griffin (We got this covered, USA) 8.5 Sundance
Blake (Bitchin Film Reviews, USA) 8.5 Sundance
Kevin Jagernauth (Indiewire's The Playlist, USA) 10 A+ (Sundance)
Eric Kohn (Indiewire, USA) 8.5 A- (Sundance)
Matt Goldberg (Collider.com, USA) 9 A (Sundance)
Edward Douglas (ComingSoon.net, USA) 9 (Sundance)
Chris Bumbray (JoBlo.com/DVD Clinic, USA) 9 (Sundance)
Amanda Mae Meyncke (Film.com, USA) 8.5 A- (Sundance)
Mike d'Angelo (AV Club, USA) 8.2
Diego Batlle (La Nación / OtrosCines, Argentina) –  7
Kong Rithdee (The Bangkok Post. Thailand) -  7.5
Jaime Pena (El Amante, Argentina y Cahiers du cinéma, España) –  5.9
Olivier Pere (Les Inrockuptibles, France) –  7
Jose Luis De Lorenzo (A Sala Llena, Argentina) –  6
Fernando Juan Lima (El Amante, Argentina) -  6.5
Sergi Sanchez (La Razón, España) -  7
Scott Foundas (Film Comment, USA) –  6
Nando Salva (El Periódico, España) –  7
Pamela Bienzobas (Mabuse, Chile) –  6
Manu Yáñez(Fotogramas, España) -  5
Carlos Reviriego (El Cultural / Cahiers du cinéma, España) –  3
Alejandro G. Calvo (SensaCine, España) –  5
Simon Reynolds (Digital Spy, UK) 6
Christopher Campbell (Spout, USA) 8 A- 
Edward Douglas (Comingsoon.net, USA) 9 A 
Gregory Ellwood (Hitfix, USA) 6.25 B 
David Fear (Time Out New York, USA) 8 A- 
Jon Frosch (France 24, USA) 7.5 B+ 
Stephen Garrett (Time Out New York, USA) 7.5 B+ 
Michael Giltz (The Huffington Post, USA) 7.5 3/4 (6.25 B)
Brandon Harris (Filmmaker Magazine, USA) 9 A 
Eugene Hernandez (Film Society of Lincoln Center, USA) 6.25 B 
Jake Jacobson (Westwood One Radio, USA) 4 C+ 
Peter Knegt (indieWIRE, USA) 7.5 B+ 
Guy Lodge (InContention) 8 A- 
Patrick Z. McGavin (Lightsensitive.typepad.com, USA) 8 A- 
Rob Nelson (Variety, USA) 7.5 B+ 
Mark Olsen (Freelance, USA) 9 A 
Katey Rich (Cinema Blend, USA) 7.5 B+ 
James Rocchi (MSN Movies, USA) 10 A+ 
Kyle Smith (New York Post, USA) 8 A- 
Kim Voynar (Movie City News, USA) 9 A 

"Walk Away Renée" Jonathan Caouette (5.08) 6 votos [Semaine]
Fernando Ganzo (Lumiere, España) –  4
Cristina Nord (Die Tageszeitung, Deutschland) –  6
Carlo Chatrian (Duellanti / Panoramiches, Italy) –  6.5
Sergio Wolf (BAFICI, Argentina) -  3
Pamela Bienzobas (Mabuse, Chile) –  6
Carlos Reviriego (El Cultural / Cahiers du cinéma, España) –  5
Eric Kohn (Indiewire, USA) 6.25 B

“Halt auf freier Strecke / Stopped on Tracks” Andreas Dresen (5.63) 9 votos [Un Certain Regard] Main Price UCR
Carlos Heredero (Cahiers du cinéma, España) -  7
Eulalia Iglesias (Rockdelux, Cahiers du cinéma, España) – 6.5
Diego Batlle (La Nación / OtrosCines, Argentina) –  5
Cristina Nord (Die Tageszeitung, Deutschland) – 6.5
Kong Rithdee (The Bangkok Post. Thailand) -  6
Jose Luis De Lorenzo (A Sala Llena, Argentina) -  7
Fernando Juan Lima (El Amante, Argentina) -  4
Rudiger Suchsland (FAZ / Negativ, Deutschland) –  2.7
Pablo O. Scholz (Clarín, Argentina) –  6
Sukhdev Sandhu (Telegraph, UK) 8

"The Artist" Michel Hazanaviciu  (5.66) 19 votos [Competition]
Mike d'Angelo (AV Club, USA) 5.2 Depicting the end of the silent era *as* a silent film is an inspired idea. Film itself is less inspired.
Matt Holmes (Obsessedwithfilm.com, USA) 9
Fernando Ganzo (Lumiere, España) 6.5
Carlos Heredero (Cahiers du cinéma, España) 4.5
Luciano Monteagudo (Página12, Argentina)
Roger Alan Koza (La Voz del Interior / Con los ojos abiertos, Argentina)
Mark Peranson (Cinema Scope, Canada)
Eulalia Iglesias (Rockdelux, Cahiers du cinéma, España) –  6.5
Diego Batlle (La Nación / OtrosCines, Argentina) 6
Cristina Nord (Die Tageszeitung, Deutschland)
Markus Keuschnigg (Die Presse, Austria)
Kong Rithdee (The Bangkok Post. Thailand) 5
Francisco Ferreira (Expresso, Portugal) 2
Violeta Kovacsics (Diari de Tarragona, España) 5
Jaime Pena (El Amante, Argentina y Cahiers du cinéma, España) 5
Olivier Pere (Locarno Film Festival, Switzerland) 6
Eugenio Renzi (Independencia, France)
Luciano Barisone (Duellanti / Panoramiches, Italy) 6
Carlo Chatrian (Duellanti / Panoramiches, Italy)
Jose Luis De Lorenzo (A Sala Llena, Argentina)
Fernando Juan Lima (El Amante, Argentina)
Xavi Serra (Ara, España)
Ernesto Garratt (El Mercurio, Chile)
Nick James (Sight & Sound, England) –  7
Sergi Sanchez (La Razón, España) –  8
Sara Brito (Público, España) 4.5
Scott Foundas (Film Comment, USA)
Sergio Wolf (BAFICI, Argentina) 5
Rudiger Suchsland (WAZ / Negativ, Deutschland)
Alvaro Arroba (La Lectora Provisoria, Argentina)
Pablo O. Scholz (Clarín, Argentina) 6
Nando Salva (El Periódico, España) 6
Pedro Butcher (Filme B / Folha de Sao Paulo, Brasil) 5
Gabriele Barrera (Nick FilmTV / Best Movie / Cinecritica, Italy)
Pamela Bienzobas (Mabuse, Chile) 6
Manu Yáñez(Fotogramas, España)
Gregory Valens (Positif, France)
Christoph Huber (Die Presse, Austria)
Marcelo Alderete (Mar del Plata Film Festival, Argentina)
Belinda Van De Graaf (Trouw, Holanda)
Arthur Mas (Independencia, France)
Martial Pisani (Independencia, France)
Carlos Reviriego (El Cultural / Cahiers du cinéma, España)
Alejandro G. Calvo (SensaCine, España)
Anchalee Chaiworaporn (Siam Rath, Image Magazine, Thailand) 7
  PROMEDIO: 5.91 (17 votos) EN DESCENSO
David Calhoun (Time Out London, UK) 8
Simon Gallagher (filmschoolrejects.com, UK) 10 A+
Raffi Asdourian (The Film Stage, USA) 8 A-
 Screen Daily:
Nick James (Sight & Sound, UK) 7.5
David Stratton (The Australian, Australia) 9
Derek Malcolm (London Evening, UK) 5
Jan Schulz-Ojala (Der Tagesspiegel, Deutschland) 9
Jose Carlos Avellar (Escrevercinema.com, Brazil) 5
Dennis Lim (The New York Times, USA) 2.5
Michel Ciment (Positif, France) 5
Alberto Crespi (L'Unita, Italy) 7.5
Bo Green Jensen (Weekandavisen Berlingske, Denmark) 7.5
Screen International (Screen International, USA) 9
 Ioncinema:
Christophe Beney (Palmares magazine, France) 2.5
Per Juul Carlsen (Danish National Radio, Denmark) 7.5
Paola Casella (Europa, Italy) 7.5
Andrei Creţulescu (HBO Romania) 8.75
Carlos F. Heredero (Cahiers du cinema Espana, Spain) 2.5
Eric Lavallée (Ioncinema.com, Canada)
Fabien Lemercier (Cineeuropa.org, Belgium) 5
Guy Lodge (InContention.com, South Africa) 8.75 B+
Elisabeth Quin (Paris Premiere, France) 10
Isabelle Regnier (Le Monde, France) 6.25
James Rocchi (MSN Movies, Indiewire's The Playlist, USA) 8.75
Cédric Succivalli (International Cinephil Society, France) 7.5
Anne Thompson (Indiewire, USA)
Clarence Tsui (South China Morning Post, Hong Kong) 7.5
Eduardo Valente (Revista Cinema, Brazil) 3.75
Laremy Legel (Film.com, USA) 9 A
#Alex Billington (Firstshowing, USA) 10
Sukhdev Sandhu (Telegraph, UK) 10
Paul Martin (Indies Movies Online, USA) 10
 Indiewire:
David Fear (Time Out New York, USA) 6.25 B
Jon Frosch (France 24, USA) 7.5 B+
Michael Giltz (The Huffington Post, USA) 8.75 B+ 3.5/4
Patrick Z. McGavin (Lightsensitive.typepad.com, USA) 3 C
Eric Kohn (Indiewire, USA) 7.5 B+

“Le gamin au vélo” Jean-Pierre et Luc Dardenne (7.86) 31 votos [Competition] Grand prix
Fernando Ganzo (Lumiere, España)
Carlos Heredero (Cahiers du cinéma, España) 7.5
Luciano Monteagudo (Página12, Argentina) –  8
Roger Alan Koza (La Voz del Interior / Con los ojos abiertos, Argentina) – 8
Mark Peranson (Cinema Scope, Canada)
Eulalia Iglesias (Rockdelux, Cahiers du cinéma, España) –  8
Diego Batlle (La Nación / OtrosCines, Argentina) – 8
Cristina Nord (Die Tageszeitung, Deutschland) – 6.8
Markus Keuschnigg (Die Presse, Austria)
Kong Rithdee (The Bangkok Post. Thailand) –  7
Francisco Ferreira (Expresso, Portugal) 7
Violeta Kovacsics (Diari de Tarragona, España) 8
Jaime Pena (El Amante, Argentina y Cahiers du cinéma, España) –  7.8
Olivier Pere (Locarno Film Festival, Switzerland) 8.5
Eugenio Renzi (Independencia, France) – 7.1
Luciano Barisone (Duellanti / Panoramiches, Italy) –  7
Carlo Chatrian (Duellanti / Panoramiches, Italy) –  8
Jose Luis De Lorenzo (A Sala Llena, Argentina) 8
Fernando Juan Lima (El Amante, Argentina) –  7
Xavi Serra (Ara, España)
Ernesto Garratt (El Mercurio, Chile)
Nick James (Sight & Sound, England) –  8
Sergi Sanchez (La Razón, España) –  9
Sara Brito (Público, España) 9
Scott Foundas (Film Comment, USA) –  10
Sergio Wolf (BAFICI, Argentina) 8
Rudiger Suchsland (WAZ / Negativ, Deutschland) 8.1
Alvaro Arroba (La Lectora Provisoria, Argentina) –  7
Pablo O. Scholz (Clarín, Argentina) 7
Nando Salva (El Periódico, España) –  8
Pedro Butcher (Filme B / Folha de Sao Paulo, Brasil) –  8
Gabriele Barrera (Nick FilmTV / Best Movie / Cinecritica, Italy)
Pamela Bienzobas (Mabuse, Chile)
Manu Yáñez(Fotogramas, España) 8.50
Gregory Valens (Positif, France)
Christoph Huber (Die Presse, Austria)
Marcelo Alderete (Mar del Plata Film Festival, Argentina) 8
Belinda Van De Graaf (Trouw, Holanda)
Arthur Mas (Independencia, France)
Martial Pisani (Independencia, France)
Carlos Reviriego (El Cultural / Cahiers du cinéma, España) –  7.5
Alejandro G. Calvo (SensaCine, España) –   8
Anchalee Chaiworaporn (Siam Rath, Image Magazine, Thailand) 8
Mike d'Angelo (AV Club, USA) 6.4
Kevin Jagernauth (Indiewire's The Playlist, USA) 7.5 B+
 Screen Daily:
Nick James (Sight & Sound, UK) 7.5
David Stratton (The Australian, Australia) 7.5
Derek Malcolm (London Evening, UK) 7.5
Jan Schulz-Ojala (Der Tagesspiegel, Deutschland) 7.5
Jose Carlos Avellar (Escrevercinema.com, Brazil) 9
Dennis Lim (The New York Times, USA) 7.5
Michel Ciment (Positif, France) 7.5
Alberto Crespi (L'Unita, Italy) 7.5
Bo Green Jensen (Weekandavisen Berlingske, Denmark) 5
Screen International (Screen International, USA) 9
 Ioncinema:
Christophe Beney (Palmares magazine, France) 7.5
David Calhoun (Time Out London, UK) 8.375
Per Juul Carlsen (Danish National Radio, Denmark) 7.5
Paola Casella (Europa, Italy) 7.5
Andrei Creţulescu (HBO Romania) 8.75
Carlos F. Heredero (Cahiers du cinema Espana, Spain) 7.5
Eric Lavallée (Ioncinema.com, Canada) 6.25
Fabien Lemercier (Cineeuropa.org, Belgium) 2.5
Guy Lodge (InContention.com, South Africa) 7.5 B
Elisabeth Quin (Paris Premiere, France) 10
Isabelle Regnier (Le Monde, France) 7.5
James Rocchi (MSN Movies, Indiewire's The Playlist, USA) 8.75
Cédric Succivalli (International Cinephil Society, France) 8.75
Anne Thompson (Indiewire, USA)
Clarence Tsui (South China Morning Post, Hong Kong) 5
Eduardo Valente (Revista Cinema, Brazil) 6.25
Sukhdev Sandhu (Telegraph, UK) 8
Raffi Asdourian (The Film Stage, USA) 9 A
 IndieWire:
David Fear (Time Out New York, USA) 7.5 B+
Jon Frosch (France 24, France) 6.25 B
Michael Giltz (The Huffington Post, USA) 8 A-
Patrick Z. McGavin (Lightsensitive.typepad.com, USA) 7.5 B+

"Bonsaï" Cristián Jiménez (5.00) 5 votos [Un Certain Regard]
Roger Alan Koza (La Voz del Interior / Con los ojos abiertos, Argentina) –  6
Jaime Pena (El Amante, Argentina y Cahiers du cinéma, España) –  4.5
Jose Luis De Lorenzo (A Sala Llena, Argentina) –  3
Fernando Juan Lima (El Amante, Argentina) –  4
Pamela Bienzobas (Mabuse, Chile) –  7.5
#Mike d'Angelo (AV Club, USA) 0
Michael Giltz (The Huffington Post, USA) 5 2/4

“Porfirio” Alejandro Landes (6.50) 4 votos [Quinzaine]
Carlos Heredero (Cahiers du cinéma, España) –  6.5
Roger Alan Koza (La Voz del Interior / Con los ojos abiertos, Argentina) –  6
Luciano Barisone (Duellanti / Panoramiches, Italy) –  7
Carlo Chatrian (Duellanti / Panoramiches, Italy) –  6.5
Blake Williams (Ioncinema.com, Canada) 7

“17 filles” Delphine & Muriel Coulin (6.02) 6 votos [Semaine]
Eulalia Iglesias (Rockdelux, Cahiers du cinéma, España) –  5
Diego Batlle (La Nación / OtrosCines, Argentina) –  7
Jaime Pena (El Amante, Argentina y Cahiers du cinéma, España) –  4
Luciano Barisone (Duellanti / Panoramiches, Italy) –  7
Carlo Chatrian (Duellanti / Panoramiches, Italy) –  6
Rudiger Suchsland (FAZ / Negativ, Deutschland) -  7.3
Michael Giltz (The Huffington Post, USA) 5  2/4

“La Fin du silence” Roland Edzar (3.75) 4 votos [Quinzaine]
Roger Alan Koza (La Voz del Interior / Con los ojos abiertos, Argentina) –  3
Luciano Barisone (Duellanti / Panoramiches, Italy) –  5
Marcelo Alderete (Mar del Plata Film Festival, Argentina) – 1
Carlos Reviriego (El Cultural / Cahiers du cinéma, España) – 6
?? (Outnow, CH) 5
Michael Giltz (The Huffington Post, USA) 5 B- 2/4

“Les neiges du Kilimandjaro” Robert Guediguian (4.36) 7 votos [Un Certain Regard]
Roger Alan Koza (La Voz del Interior / Con los ojos abiertos, Argentina) –  4.5
Francisco Ferreira (Expresso, Portugal) –  0
Jaime Pena (El Amante, Argentina y Cahiers du cinéma, España) –  3.5
Carlo Chatrian (Duellanti / Panoramiches, Italy) –  6.5
Jose Luis De Lorenzo (A Sala Llena, Argentina) –  7
Fernando Juan Lima (El Amante, Argentina) –  4
Rudiger Suchsland (WAZ / Negativ, Deutschland) –  5
Kevin Jagernauth (Indiewire's The Playlist, USA) 4 C+

“Wu Xia” Peter Ho Sun-Chan (5.78) 9 votos
Fernando Ganzo (Lumiere, España) –  3
Kong Rithdee (The Bangkok Post. Thailand) –  5
Jaime Pena (El Amante, Argentina y Cahiers du cinéma, España) –  6
Carlo Chatrian (Duellanti / Panoramiches, Italy) –  7
Jose Luis De Lorenzo (A Sala Llena, Argentina) –  6
Fernando Juan Lima (El Amante, Argentina) –  7
Rudiger Suchsland (WAZ / Negativ, Deutschland) –  7
Marcelo Alderete (Mar del Plata Film Festival, Argentina) –  4
Alejandro G. Calvo (SensaCine, España) –  7
Kevin Jagernauth (Indiewire's The Playlist, USA) 4 C+
#Alex Billington (Firstshowing, USA) 9
Raffi Asdourian (The Film Stage, USA) 7.5 B+
  Indiewire:
Joshua Brunsting (Chase and the Whale, USA) 6.25 B
Michael Giltz (The Huffington Post, USA) 6.25 2.5/4 (5 B-)

“Michael” Markus Schleinzer (4.58) 25 votos [Competition]
Fernando Ganzo (Lumiere, España) –  2
Carlos Heredero (Cahiers du cinéma, España) 4
Luciano Monteagudo (Página12, Argentina) –  7
Roger Alan Koza (La Voz del Interior / Con los ojos abiertos, Argentina)
Mark Peranson (Cinema Scope, Canada)
Eulalia Iglesias (Rockdelux, Cahiers du cinéma, España) –  6
Diego Batlle (La Nación / OtrosCines, Argentina) –  6
Cristina Nord (Die Tageszeitung, Deutschland) –  5.8
Markus Keuschnigg (Die Presse, Austria)
Kong Rithdee (The Bangkok Post. Thailand) –  6.5
Francisco Ferreira (Expresso, Portugal) 0
Violeta Kovacsics (Diari de Tarragona, España) 6
Jaime Pena (El Amante, Argentina y Cahiers du cinéma, España) –  4.5
Olivier Pere (Locarno Film Festival, Switzerland)
Eugenio Renzi (Independencia, France) –  0
Luciano Barisone (Duellanti / Panoramiches, Italy) –  1
Carlo Chatrian (Duellanti / Panoramiches, Italy) –  4
Jose Luis De Lorenzo (A Sala Llena, Argentina)
Fernando Juan Lima (El Amante, Argentina)
Xavi Serra (Ara, España)
Ernesto Garratt (El Mercurio, Chile)
Nick James (Sight & Sound, England) –  7
Sergi Sanchez (La Razón, España) –  4
Sara Brito (Público, España) 6.8
Scott Foundas (Film Comment, USA) –  9
Sergio Wolf (BAFICI, Argentina)
Rudiger Suchsland (WAZ / Negativ, Deutschland) 7.8
Alvaro Arroba (La Lectora Provisoria, Argentina) –  0
Pablo O. Scholz (Clarín, Argentina)  -  8
Nando Salva (El Periódico, España) –  2
Pedro Butcher (Filme B / Folha de Sao Paulo, Brasil) –  3
Gabriele Barrera (Nick FilmTV / Best Movie / Cinecritica, Italy)
Pamela Bienzobas (Mabuse, Chile)
Manu Yáñez(Fotogramas, España)
Gregory Valens (Positif, France)
Christoph Huber (Die Presse, Austria)
Marcelo Alderete (Mar del Plata Film Festival, Argentina)
Belinda Van De Graaf (Trouw, Holanda)
Arthur Mas (Independencia, France)
Martial Pisani (Independencia, France)
Carlos Reviriego (El Cultural / Cahiers du cinéma, España) –  6
Alejandro G. Calvo (SensaCine, España) –  3
Anchalee Chaiworaporn (Siam Rath, Image Magazine, Thailand) 5
  PROMEDIO: 4.54 (23 votos) EN ASCENSO
 Screen Daily:
Nick James (Sight & Sound, UK) 7.5
David Stratton (The Australian, Australia) 2.5
Derek Malcolm (London Evening, UK) 5
Jan Schulz-Ojala (Der Tagesspiegel, Deutschland) 5
Jose Carlos Avellar (Escrevercinema.com, Brazil) 5
Dennis Lim (The New York Times, USA) 7.5
Michel Ciment (Positif, France) 2.5
Alberto Crespi (L'Unita, Italy) 2.5
Bo Green Jensen (Weekandavisen Berlingske, Denmark) 5
Screen International (Screen International, USA) 7.5
Mike d'Angelo (AV Club, USA) 3.2 Evil is banal. The end. No, wait, let me sadistically fuck with you for a few minutes. Okay, *now* the end.
Eric Kohn (Indiewire, USA) 8.5 A- a triumph of uneasy cinema
 Ioncinema:
Christophe Beney (Palmares magazine, France) 2.5
David Calhoun (Time Out London, UK) 7.5
Per Juul Carlsen (Danish National Radio, Denmark) 7.5
Paola Casella (Europa, Italy) 6.25
Andrei Creţulescu (HBO Romania)
Carlos F. Heredero (Cahiers du cinema Espana, Spain) 5
Eric Lavallée (Ioncinema.com, Canada) 6.25
Fabien Lemercier (Cineeuropa.org, Belgium) 2.5
Guy Lodge (InContention.com, South Africa) 5
Elisabeth Quin (Paris Premiere, France) 2.5
Isabelle Regnier (Le Monde, France) 3.75
James Rocchi (MSN Movies, Indiewire's The Playlist, USA) 6.25
Cédric Succivalli (International Cinephil Society, France) 7.5
Anne Thompson (Indiewire, USA)
Clarence Tsui (South China Morning Post, Hong Kong)
Eduardo Valente (Revista Cinema, Brazil)
Simon Gallagher (filmschoolrejects.com, UK) 6.25 B
Joshua Brunsting (Chase and the Whale, USA) 3 C
Jon Frosch (France 24, USA) 6.25 B
Michael Giltz (The Huffington Post, USA) 7.5 B+ 3/4

"Bé Omid É Didar / Goodbye" Mohammad Rasoulof (6.68) 17 votos [Un Certain Regard] Best Director UCR
Carlos Heredero (Cahiers du cinéma, España) 8
Luciano Monteagudo (Página12, Argentina) 7
Eulalia Iglesias (Rockdelux, Cahiers du cinéma, España) 6.5
Diego Batlle (La Nación / OtrosCines, Argentina) 7
Cristina Nord (Die Tageszeitung, Deutschland) 7
Kong Rithdee (The Bangkok Post. Thailand) –  7
Violeta Kovacsics (Diari de Tarragona, España) -  7
Jaime Pena (El Amante, Argentina y Cahiers du cinéma, España) –  6
Fernando Juan Lima (El Amante, Argentina) -  6.5
Sergi Sanchez (La Razón, España) 7
Sara Brito (Público, España) 8
Scott Foundas (Film Comment, USA) –  5
Alvaro Arroba (La Lectora Provisoria, Argentina) –  7
Pablo O. Scholz (Clarín, Argentina) 7
Pedro Butcher (Filme B / Folha de Sao Paulo, Brasil) –  6.5
Pamela Bienzobas (Mabuse, Chile) –  5.5
Alejandro G. Calvo (SensaCine, España) –  6
Eric Kohn (Indiewire, USA) 8 A-

“Pirates of the Caribbean: On Stranger Tides” Rob Marshall (4.32) 6 votos [Special Screenings]
Diego Batlle (La Nación / OtrosCines, Argentina) 7
Jose Luis De Lorenzo (A Sala Llena, Argentina) 4
Sergi Sanchez (La Razón, España) 3
Sara Brito (Público, España) 4
Rudiger Suchsland (WAZ / Negativ, Deutschland) 6.9
Alejandro G. Calvo (SensaCine, España) 1
David Calhoun (Time Out London, UK) 2
Matt Holmes (Obsessedwithfilm.com, USA) 2
Simon Gallagher (filmschoolrejects.com, UK) 3 C
Sukhdev Sandhu (Telegraph, UK) 4
Simon Reynolds (Digital Spy, UK) 6
Anne Thompson (Indiewire, USA) 5 B-

“Tous au Lazarc” Christian Rouaud (4.66) 3 votos [Special Screenings]
Jaime Pena (El Amante, Argentina y Cahiers du cinéma, España) 5
Luciano Barisone (Duellanti / Panoramiches, Italy) 5
Carlo Chatrian (Duellanti / Panoramiches, Italy) 4

“Eldfjall” Rúnar Rúnarsson [Quinzaine]
Arthur Mas (Independencia, France) -  5.50

“Hearat Shulayim / Footnote” Joseph Cedar (5,21) 29 votos [Competition] Best Screenplay
Mike d'Angelo (AV Club, USA) 5.6
Fernando Ganzo (Lumiere, España) 5
Carlos Heredero (Cahiers du cinéma, España) 5
Luciano Monteagudo (Página12, Argentina) 4
Roger Alan Koza (La Voz del Interior / Con los ojos abiertos, Argentina) 6
Mark Peranson (Cinema Scope, Canada)
Eulalia Iglesias (Rockdelux, Cahiers du cinéma, España)
Diego Batlle (La Nación / OtrosCines, Argentina) 5.5
Cristina Nord (Die Tageszeitung, Deutschland) 6.5
Markus Keuschnigg (Die Presse, Austria)
Kong Rithdee (The Bangkok Post. Thailand) 6
Francisco Ferreira (Expresso, Portugal) 0
Violeta Kovacsics (Diari de Tarragona, España) 5
Jaime Pena (El Amante, Argentina y Cahiers du cinéma, España) 7.5
Olivier Pere (Locarno Film Festival, Switzerland)
Eugenio Renzi (Independencia, France) 4.8
Luciano Barisone (Duellanti / Panoramiches, Italy) 6
Carlo Chatrian (Duellanti / Panoramiches, Italy)
Jose Luis De Lorenzo (A Sala Llena, Argentina) 7
Fernando Juan Lima (El Amante, Argentina) 5.5
Xavi Serra (Ara, España)
Ernesto Garratt (El Mercurio, Chile)
Nick James (Sight & Sound, England) 4
Sergi Sanchez (La Razón, España) 6.5
Sara Brito (Público, España)
Scott Foundas (Film Comment, USA) 7
Sergio Wolf (BAFICI, Argentina) 3
Rudiger Suchsland (WAZ / Negativ, Deutschland) 7.5
Alvaro Arroba (La Lectora Provisoria, Argentina) 7
Pablo O. Scholz (Clarín, Argentina) 5
Nando Salva (El Periódico, España) 6.5
Pedro Butcher (Filme B / Folha de Sao Paulo, Brasil) 2
Gabriele Barrera (Nick FilmTV / Best Movie / Cinecritica, Italy)
Pamela Bienzobas (Mabuse, Chile) 4.25
Manu Yáñez(Fotogramas, España) 5
Gregory Valens (Positif, France)
Christoph Huber (Die Presse, Austria)
Marcelo Alderete (Mar del Plata Film Festival, Argentina)
Belinda Van De Graaf (Trouw, Holanda) 4
Arthur Mas (Independencia, France)
Martial Pisani (Independencia, France)
Carlos Reviriego (El Cultural / Cahiers du cinéma, España) 6.5
Alejandro G. Calvo (SensaCine, España) 5
Anchalee Chaiworaporn (Siam Rath, Image Magazine, Thailand) 4
  PROMEDIO: 5.21 (29 votos) EN DESCENSO
Eric Kohn (Indiewire, USA) 7.5 B+
 Screen Daily:
Nick James (Sight & Sound, UK) 2.5
David Stratton (The Australian, Australia) 7.5
Derek Malcolm (London Evening, UK) 7.5
Jan Schulz-Ojala (Der Tagesspiegel, Deutschland) 7.5
Jose Carlos Avellar (Escrevercinema.com, Brazil) 2.5
Dennis Lim (The New York Times, USA) 2.5
Michel Ciment (Positif, France) 2.5
Alberto Crespi (L'Unita, Italy) 5
Bo Green Jensen (Weekandavisen Berlingske, Denmark) 5
Screen International (Screen International, USA) 7.5
 Ioncinema:
Christophe Beney (Palmares magazine, France) 0
David Calhoun (Time Out London, UK) 8
Per Juul Carlsen (Danish National Radio, Denmark) 5
Paola Casella (Europa, Italy) 5
Andrei Creţulescu (HBO Romania)
Carlos F. Heredero (Cahiers du cinema Espana, Spain) 5
Eric Lavallée (Ioncinema.com, Canada) 3.75
Fabien Lemercier (Cineeuropa.org, Belgium)
Guy Lodge (InContention.com, South Africa) 3.75
Elisabeth Quin (Paris Premiere, France) 5
Isabelle Regnier (Le Monde, France) 7.5
James Rocchi (MSN Movies, Indiewire's The Playlist, USA) 6.25
Cédric Succivalli (International Cinephil Society, France) 1.25
Anne Thompson (Indiewire, USA) 7.5 B+
Clarence Tsui (South China Morning Post, Hong Kong) 5
Eduardo Valente (Revista Cinema, Brazil) 1.25
 Indiewire:
Simon Abrams (Freelance, USA) 1.2 D
David Fear (Time Out New York, USA) 6.25 B
Jon Frosch (France 24, USA) 8 A-
Michael Giltz (The Huffington Post, USA) 8.75 A-
Peter Howell (The Toronto Star, USA) 7.5 B+
Patrick Z. McGavin (Lightsensitive.typepad.com, USA) 3 C

“The Slut” Hagar Ben Asher (5.17) 3 votos [Semaine]
Olivier Pere (Locarno Film Festival, Switzerland) 2
Fernando Juan Lima (El Amante, Argentina) 6.50
Rudiger Suchsland (WAZ / Negativ, Deutschland) 7
Michael Giltz (The Huffington Post, USA) 5 2/4

“Arirang” Kim Ki-duk (3.89) 14 votos [Un Certain Regard] Main Price UCR
Mike d'Angelo (AV Club, USA) 0.7
Fernando Ganzo (Lumiere, España) 1
Carlos Heredero (Cahiers du cinéma, España) 0
Diego Batlle (La Nación / OtrosCines, Argentina) 3
Kong Rithdee (The Bangkok Post. Thailand) 4
Violeta Kovacsics (Diari de Tarragona, España) 1
Jose Luis De Lorenzo (A Sala Llena, Argentina) 6
Fernando Juan Lima (El Amante, Argentina) 4
Nick James (Sight & Sound, England) – 3
Rudiger Suchsland (WAZ / Negativ, Deutschland) 6.5
Pablo O. Scholz (Clarín, Argentina) 4
Pedro Butcher (Filme B / Folha de Sao Paulo, Brasil) 5
Pamela Bienzobas (Mabuse, Chile) 3
Marcelo Alderete (Mar del Plata Film Festival, Argentina) 5
Belinda Van De Graaf (Trouw, Holanda) 9
Eric Kohn (Indiewire, USA) 8 A-
Raffi Asdourian (The Film Stage, USA) 4 C+

“Toomelah” Ivan Sen (3.00) 3 votos [Un Certain Regard]
Jose Luis De Lorenzo (A Sala Llena, Argentina) 3
Fernando Juan Lima (El Amante, Argentina) 3
Sergio Wolf (BAFICI, Argentina) 3
Guy Lodge (InContention.com, South Africa) 5 B-

“Miss Bala” Gerardo Naranjo (5.68) 19 votos [Un Certain Regard]
Fernando Ganzo (Lumiere, España) – 6
Carlos Heredero (Cahiers du cinéma, España)
Luciano Monteagudo (Página12, Argentina) –  6
Roger Alan Koza (La Voz del Interior / Con los ojos abiertos, Argentina) – 5.50
Mark Peranson (Cinema Scope, Canada)
Eulalia Iglesias (Rockdelux, Cahiers du cinéma, España)
Diego Batlle (La Nación / OtrosCines, Argentina) – 6
Cristina Nord (Die Tageszeitung, Deutschland) – 2
Markus Keuschnigg (Die Presse, Austria)
Kong Rithdee (The Bangkok Post, Thailand) – 7
Francisco Ferreira (Expresso, Portugal)
Violeta Kovacsics (Diari de Tarragona, España)
Jaime Pena (El Amante, Argentina y Cahiers du cinéma, España) – 4.9
Olivier Pere (Locarno Film Festival, Switzerland)
Eugenio Renzi (Independencia, France)
Luciano Barisone (Duellanti / Panoramiches, Italy) – 5
Carlo Chatrian (Duellanti / Panoramiches, Italy)
Jose Luis De Lorenzo (A Sala Llena, Argentina) – 6
Fernando Juan Lima (El Amante, Argentina) – 5.5
Xavi Serra (Ara, España)
Ernesto Garratt (El Mercurio, Chile)
Nick James (Sight & Sound, England) – 7
Sergi Sanchez (La Razón, España)
Sara Brito (Público, España)
Scott Foundas (Film Comment, USA) – 6
Sergio Wolf (BAFICI, Argentina)
Rudiger Suchsland (WAZ / Negativ, Deutschland) 7.5
Alvaro Arroba (La Lectora Provisoria, Argentina) – 5.5
Pablo O. Scholz (Clarín, Argentina) – 7
Nando Salva (El Periódico, España)
Pedro Butcher (Filme B / Folha de Sao Paulo, Brasil)
Gabriele Barrera (Nick FilmTV / Best Movie / Cinecritica, Italy)
Pamela Bienzobas (Mabuse, Chile)
Manu Yáñez(Fotogramas, España) 6
Gregory Valens (Positif, France)
Christoph Huber (Die Presse, Austria)
Marcelo Alderete (Mar del Plata Film Festival, Argentina) – 2
Belinda Van De Graaf (Trouw, Holanda)
Arthur Mas (Independencia, France)
Martial Pisani (Independencia, France)
Carlos Reviriego (El Cultural / Cahiers du cinéma, España) – 7
Alejandro G. Calvo (SensaCine, España) –  6
Anchalee Chaiworaporn (Siam Rath, Image Magazine, Thailand)
  PROMEDIO: 5.66 (18 votos) EN ASCENSO
Mike d'Angelo (AV Club, USA) 7.9
Simon Gallagher (filmschoolrejects.com, UK) 6.25 B
Peter Willis (Obsessedwithfilm.com, USA) 8
Kevin Jagernauth (Indiewire's The Playlist, USA) 8 A-
#Alex Billington (Firstshowing, USA) 9
Raffi Asdourian (The Film Stage, USA) 7.5 B+

“Jeanne Captive” Philippe Ramos (5.39) 11 votos [Quinzaine]
Fernando Ganzo (Lumiere, España) 2
Carlos Heredero (Cahiers du cinéma, España) 6
Eulalia Iglesias (Rockdelux, Cahiers du cinéma, España) 7.5
Diego Batlle (La Nación / OtrosCines, Argentina) 7
Violeta Kovacsics (Diari de Tarragona, España) 6
Jaime Pena (El Amante, Argentina y Cahiers du cinéma, España) 5.9
Carlo Chatrian (Duellanti / Panoramiches, Italy) 4
Alvaro Arroba (La Lectora Provisoria, Argentina) 4.5
Pedro Butcher (Filme B / Folha de Sao Paulo, Brasil) 4
Arthur Mas (Independencia, France) 4.9
Carlos Reviriego (El Cultural / Cahiers du cinéma, España) 7.5
Blake Williams (Ioncinema.com, Canada) 4
Paul Martin (Indies Movies Online, USA) 4
Michael Giltz (The Huffington Post, USA) 6.25 B- 2.5/4

“Michel Petrucciani” Michael Radford (6.89) 7 votos [Special Screenings]
Eulalia Iglesias (Rockdelux, Cahiers du cinéma, España) 5.5
Kong Rithdee (The Bangkok Post. Thailand) 7
Luciano Barisone (Duellanti / Panoramiches, Italy) 7
Carlo Chatrian (Duellanti / Panoramiches, Italy) 7
Fernando Juan Lima (El Amante, Argentina) –  8
Rudiger Suchsland (FAZ / Negativ, Deutschland) –  7
Pamela Bienzobas (Mabuse, Chile) –  6.7
	  Indiewire:
Michael Giltz (The Huffington Post, USA) 6.25 2.5/4 (2 C-)

“The Other Side of Sleep” Rebecca Daly (3,00) 4 votos [Quinzaine]
Olivier Pere (Locarno Film Festival, Switzerland) 3
Carlo Chatrian (Duellanti / Panoramiches, Italy) 2
Sergio Wolf (BAFICI, Argentina) –  5
Marcelo Alderete (Mar del Plata Film Festival, Argentina) 2
James Rocchi (MSN Movies, Indiewire's The Playlist, USA) Memory-and-murder tale is well-shot, well-acted, Arnold-influenced ... but lacks the necessary drive of story.
Emma Rowley (Indies Movies Online, USA) 6

“Las Acacias” Pablo Giorgelli (6.86) 9 votos [Semaine] Camera d'Or, Soutien ACID/CCAS and the Prix OFAJ de la (Toute) jeune Critique
Carlos Heredero (Cahiers du cinéma, España) 6.5
Luciano Monteagudo (Página12, Argentina) 7
Roger Alan Koza (La Voz del Interior / Con los ojos abiertos, Argentina) 7
Diego Batlle (La Nación / OtrosCines, Argentina) 7.5
Jaime Pena (El Amante, Argentina y Cahiers du cinéma, España) –  4.7
Luciano Barisone (Duellanti / Panoramiches, Italy) 8
Fernando Juan Lima (El Amante, Argentina) –  8
Pablo O. Scholz (Clarín, Argentina) 7
Marcelo Alderete (Mar del Plata Film Festival, Argentina) –  6

“Habemus Papam” Nanni Moretti (6.45) 29 votos [Competition]
Fernando Ganzo (Lumiere, España) – 8
Carlos Heredero (Cahiers du cinéma, España) – 6
Luciano Monteagudo (Página12, Argentina) – 8
Roger Alan Koza (La Voz del Interior / Con los ojos abiertos, Argentina)
Mark Peranson (Cinema Scope, Canada)
Eulalia Iglesias (Rockdelux, Cahiers du cinéma, España) – 7.5
Diego Batlle (La Nación / OtrosCines, Argentina) – 8
Cristina Nord (Die Tageszeitung, Deutschland) – 7.2
Markus Keuschnigg (Die Presse, Austria)
Kong Rithdee (The Bangkok Post. Thailand) – 6.5
Francisco Ferreira (Expresso, Portugal)
Violeta Kovacsics (Diari de Tarragona, España) – 5
Jaime Pena (El Amante, Argentina y Cahiers du cinéma, España) – 9
Olivier Pere (Locarno Film Festival, Switzerland) – 1
Eugenio Renzi (Independencia, France) – 5.1
Luciano Barisone (Duellanti / Panoramiches, Italy)
Carlo Chatrian (Duellanti / Panoramiches, Italy) – 8.5
Jose Luis De Lorenzo (A Sala Llena, Argentina) – 8
Fernando Juan Lima (El Amante, Argentina) – 9
Xavi Serra (Ara, España)
Ernesto Garratt (El Mercurio, Chile)
Nick James (Sight & Sound, England) – 5
Sergi Sanchez (La Razón, España) – 7
Sara Brito (Público, España) – 5.9
Scott Foundas (Film Comment, USA) – 7
Sergio Wolf (BAFICI, Argentina)
Rudiger Suchsland (WAZ / Negativ, Deutschland) – 1
Alvaro Arroba (La Lectora Provisoria, Argentina) – 9
Pablo O. Scholz (Clarín, Argentina) – 6
Nando Salva (El Periódico, España) – 7
Pedro Butcher (Filme B / Folha de Sao Paulo, Brasil) – 6
Gabriele Barrera (Nick FilmTV / Best Movie / Cinecritica, Italy)
Pamela Bienzobas (Mabuse, Chile) – 7.25
Manu Yáñez(Fotogramas, España) 6
Gregory Valens (Positif, France)
Christoph Huber (Die Presse, Austria)
Marcelo Alderete (Mar del Plata Film Festival, Argentina)
Belinda Van De Graaf (Trouw, Holanda) – 7
Arthur Mas (Independencia, France)
Martial Pisani (Independencia, France)
Carlos Reviriego (El Cultural / Cahiers du cinéma, España) – 6
Alejandro G. Calvo (SensaCine, España) – 3
Anchalee Chaiworaporn (Siam Rath, Image Magazine, Thailand) 7
  PROMEDIO: 6.45 (29 votos) EN ASCENSO
Mike d'Angelo (AV Club, USA) 6
Simon Gallagher (filmschoolrejects.com, UK) 7.5 B+
David Calhoun (Time Out London, UK) 6
Eric Kohn (Indiewire, USA) 4 C+
 Screen Daily:
Nick James (Sight & Sound, UK) 5
David Stratton (The Australian, Australia) 7.5
Derek Malcolm (London Evening, UK) 5
Jan Schulz-Ojala (Der Tagesspiegel, Deutschland) 7.5
Jose Carlos Avellar (Escrevercinema.com, Brazil) 2.5
Dennis Lim (The New York Times, USA) 5
Michel Ciment (Positif, France) 5
Alberto Crespi (L'Unita, Italy) 7.5
Bo Green Jensen (Weekandavisen Berlingske, Denmark) 7.5
Screen International (Screen International, USA) 5
 Ioncinema:
Christophe Beney (Palmares magazine, France) 5
Per Juul Carlsen (Danish National Radio, Denmark) 5
Paola Casella (Europa, Italy) 6.25
Andrei Creţulescu (HBO Romania) 6.25
Carlos F. Heredero (Cahiers du cinema Espana, Spain) 5
Eric Lavallée (Ioncinema.com, Canada) 3.75
Fabien Lemercier (Cineeuropa.org, Belgium) 5
Guy Lodge (InContention.com, South Africa) 5
Elisabeth Quin (Paris Premiere, France) 10
Isabelle Regnier (Le Monde, France) 6.25
James Rocchi (MSN Movies, Indiewire's The Playlist, USA)
Cédric Succivalli (International Cinephil Society, France) 3.75
Anne Thompson (Indiewire, USA) 5 B-
Clarence Tsui (South China Morning Post, Hong Kong) 7.5
Eduardo Valente (Revista Cinema, Brazil) 5
Kevin Jagernauth (Indiewire's The Playlist, USA) 6.25 B
Sukhdev Sandhu (Telegraph, UK) 6
Andrew Pulver (Guardian, UK) 6
Laremy Legel (Film.com, USA) 1.5 D+
 Indiewire:
Simon Abrams (Freelance, USA) 7.5 B+
Michael Giltz (The Huffington Post, USA) 7.5 3/4 6.25 B
Peter Howell (The Toronto Star, USA) 5 B-
Patrick Z. McGavin (Lightsensitive.typepad.com, USA) 5 B-

“La fée” Dominique Abel, Fiona Gordon and Bruno Romy (6.60) 2 votos [Quinzaine]
Cristina Nord (Die Tageszeitung, Deutschland) 7
Arthur Mas & Martial Pisani (Independencia, France) 6.2
James Rocchi (MSN Movies, Indiewire's The Playlist, USA) Cloying too-cute cartoony comedy; from France/Belgium; I think it gave everyone in the Quinzane theater diabetes.
Blake Williams (Ioncinema.com, Canada) 5
Michael Giltz (The Huffington Post, USA) 7.5 3/4

“Labrador” Frederikke Aspock (3.17) 3 votos  [Special Screenings]
Roger Alan Koza (La Voz del Interior / Con los ojos abiertos, Argentina) 4.5
Alvaro Arroba (La Lectora Provisoria, Argentina) 1
Pablo O. Scholz (Clarín, Argentina) 4

“Bollywood”  R. Omprakash Mehra, Jeffrey Zimbalis (2.00) 2 votos  [Special Screenings]
Fernando Ganzo (Lumiere, España) – 0
Luciano Barisone (Duellanti / Panoramiches, Italy) – 4
Mayer Nissim (Digital Spy, UK) 6

“La guerre est declarée” Valérie Donzelli (6,73) 11 votos [Semaine]
Fernando Ganzo (Lumiere, España) 8.5
Eulalia Iglesias (Rockdelux, Cahiers du cinéma, España) 7.5
Violeta Kovacsics (Diari de Tarragona, España) 5
Jaime Pena (El Amante, Argentina y Cahiers du cinéma, España) 7
Eugenio Renzi (Independencia, France) 8
Luciano Barisone (Duellanti / Panoramiches, Italy) 6
Fernando Juan Lima (El Amante, Argentina) 6
Scott Foundas (Film Comment, USA) 4
Alvaro Arroba (La Lectora Provisoria, Argentina) –  7.5
Pamela Bienzobas (Mabuse, Chile) 7.5
Alejandro G. Calvo (SensaCine, España) –  7

“Trabalhar cansa / Hard Labor” Marco Dutra, Juliana Rojas (6,425) 12 votos [Un Certain Regard]
Fernando Ganzo (Lumiere, España)
Carlos Heredero (Cahiers du cinéma, España)
Luciano Monteagudo (Página12, Argentina) 6
Roger Alan Koza (La Voz del Interior / Con los ojos abiertos, Argentina) 6
Mark Peranson (Cinema Scope, Canada)
Eulalia Iglesias (Rockdelux, Cahiers du cinéma, España)
Diego Batlle (La Nación / OtrosCines, Argentina) 6
Cristina Nord (Die Tageszeitung, Deutschland)
Markus Keuschnigg (Die Presse, Austria)
Kong Rithdee (The Bangkok Post. Thailand) 6.5
Francisco Ferreira (Expresso, Portugal)
Violeta Kovacsics (Diari de Tarragona, España)
Jaime Pena (El Amante, Argentina y Cahiers du cinéma, España) 6.1
Olivier Pere (Locarno Film Festival, Switzerland)
Eugenio Renzi (Independencia, France)
Luciano Barisone (Duellanti / Panoramiches, Italy) 7
Carlo Chatrian (Duellanti / Panoramiches, Italy) 7.5
Jose Luis De Lorenzo (A Sala Llena, Argentina) 7
Fernando Juan Lima (El Amante, Argentina) 7
Xavi Serra (Ara, España)
Ernesto Garratt (El Mercurio, Chile)
Nick James (Sight & Sound, England)
Sergi Sanchez (La Razón, España)
Sara Brito (Público, España)
Scott Foundas (Film Comment, USA)
Sergio Wolf (BAFICI, Argentina)
Rudiger Suchsland (Deutschland)
Alvaro Arroba (La Lectora Provisoria, Argentina)
Pablo O. Scholz (Clarín, Argentina)
Nando Salva (El Periódico, España)
Pedro Butcher (Filme B / Folha de Sao Paulo, Brasil) 6
Gabriele Barrera (Nick FilmTV / Best Movie / Cinecritica, Italy)
Pamela Bienzobas (Mabuse, Chile)
Manu Yáñez(Fotogramas, España)
Gregory Valens (Positif, France)
Christoph Huber (Die Presse, Austria)
Marcelo Alderete (Mar del Plata Film Festival, Argentina)
Belinda Van De Graaf (Trouw, Holanda)
Arthur Mas (Independencia, France)
Martial Pisani (Independencia, France)
Carlos Reviriego (El Cultural / Cahiers du cinéma, España) 6
Alejandro G. Calvo (SensaCine, España) 6
Anchalee Chaiworaporn (Siam Rath, Image Magazine, Thailand)
  PROMEDIO: 6,425 (12 votos)
Paul Martin (Indies Movies Online, USA) 8

“Polisse” Maiwenn Le Besco (2,95) 28 votos [Competition] Special Jury Price
Fernando Ganzo (Lumiere, España) 0
Carlos Heredero (Cahiers du cinéma, España) 5
Luciano Monteagudo (Página12, Argentina) 1
Roger Alan Koza (La Voz del Interior / Con los ojos abiertos, Argentina)
Mark Peranson (Cinema Scope, Canada)
Eulalia Iglesias (Rockdelux, Cahiers du cinéma, España) 3
Diego Batlle (La Nación / OtrosCines, Argentina) 4
Cristina Nord (Die Tageszeitung, Deutschland) 3
Markus Keuschnigg (Die Presse, Austria)
Kong Rithdee (The Bangkok Post. Thailand) 5
Francisco Ferreira (Expresso, Portugal) 0
Violeta Kovacsics (Diari de Tarragona, España) 2
Jaime Pena (El Amante, Argentina y Cahiers du cinéma, España) 3
Olivier Pere (Locarno Film Festival, Switzerland)
Eugenio Renzi (Independencia, France) 2.7
Luciano Barisone (Duellanti / Panoramiches, Italy) 4
Carlo Chatrian (Duellanti / Panoramiches, Italy)
Jose Luis De Lorenzo (A Sala Llena, Argentina) 1
Fernando Juan Lima (El Amante, Argentina) 2
Xavi Serra (Ara, España)
Ernesto Garratt (El Mercurio, Chile)
Nick James (Sight & Sound, England) 4
Sergi Sanchez (La Razón, España) 0
Sara Brito (Público, España) 1
Scott Foundas (Film Comment, USA) 0
Sergio Wolf (BAFICI, Argentina)
Rudiger Suchsland (WAZ, Negativ, Deutschland) 1
Alvaro Arroba (La Lectora Provisoria, Argentina) 0
Pablo O. Scholz (Clarín, Argentina) 4
Nando Salva (El Periódico, España) 0
Pedro Butcher (Filme B / Folha de Sao Paulo, Brasil) 4
Gabriele Barrera (Nick FilmTV / Best Movie / Cinecritica, Italy)
Pamela Bienzobas (Mabuse, Chile)
Manu Yáñez(Fotogramas, España) 6
Gregory Valens (Positif, France)
Christoph Huber (Die Presse, Austria)
Marcelo Alderete (Mar del Plata Film Festival, Argentina)
Belinda Van De Graaf (Trouw, Holanda) 8
Arthur Mas (Independencia, France)
Martial Pisani (Independencia, France)
Carlos Reviriego (El Cultural / Cahiers du cinéma, España) 7
Alejandro G. Calvo (SensaCine, España) 6
Anchalee Chaiworaporn (Siam Rath, Image Magazine, Thailand) 5
  PROMEDIO: 2.95 (28 votos) EN ASCENSO
 Screen Daily:
Nick James (Sight & Sound, UK) 5
David Stratton (The Australian, Australia) 7.5
Derek Malcolm (London Evening, UK) 5
Jan Schulz-Ojala (Der Tagesspiegel, Deutschland) 2.5
Jose Carlos Avellar (Escrevercinema.com, Brazil) 2.5
Dennis Lim (The New York Times, USA) 1
Michel Ciment (Positif, France) 5
Alberto Crespi (L'Unita, Italy) 5
Bo Green Jensen (Weekandavisen Berlingske, Denmark) 5
Screen International (Screen International, USA) 5
 Ioncinema:
Christophe Beney (Palmares magazine, France) 7.5
David Calhoun (Time Out London, UK) 6
Per Juul Carlsen (Danish National Radio, Denmark) 0
Paola Casella (Europa, Italy)
Andrei Creţulescu (HBO Romania)
Carlos F. Heredero (Cahiers du cinema Espana, Spain) 5
Eric Lavallée (Ioncinema.com, Canada)
Fabien Lemercier (Cineeuropa.org, Belgium) 5
Guy Lodge (InContention.com, South Africa) 6.25
Elisabeth Quin (Paris Premiere, France)
Isabelle Regnier (Le Monde, France) 3.75
James Rocchi (MSN Movies, Indiewire's The Playlist, USA)
Cédric Succivalli (International Cinephil Society, France) 8.75
Anne Thompson (Indiewire, USA)
Clarence Tsui (South China Morning Post, Hong Kong) 7.5
Eduardo Valente (Revista Cinema, Brazil) 5
Mike d'Angelo (AV Club, USA) 5.5
Raffi Asdourian (The Film Stage, USA) 7.5 B+
 Indiewire:
Eric Kohn (Indiewire, USA) 6.25 B
Simon Abrams (Freelance, USA) 0 F
David Fear (Time Out New York, USA) 8 A-
Jon Frosch (France 24, USA) 7.5 B+
Michael Giltz (The Huffington Post, USA) 6.25 2.5/4 (5 B-)
Peter Howell (The Toronto Star, USA) 4 C+
Patrick Z. McGavin (Lightsensitive.typepad.com, USA) 3 C

“Restless” Gus Van Sant (6.84) 27 votos [Un Certain Regard]
Fernando Ganzo (Lumiere, España) 8
Carlos Heredero (Cahiers du cinéma, España) 8
Luciano Monteagudo (Página12, Argentina) 7
Roger Alan Koza (La Voz del Interior / Con los ojos abiertos, Argentina) 7.5
Mark Peranson (Cinema Scope, Canada)
Eulalia Iglesias (Rockdelux, Cahiers du cinéma, España) 6
Diego Batlle (La Nación / OtrosCines, Argentina) 7
Cristina Nord (Die Tageszeitung, Deutschland) 6.8
Markus Keuschnigg (Die Presse, Austria)
Kong Rithdee (The Bangkok Post. Thailand) 6
Francisco Ferreira (Expresso, Portugal) 6.69
Violeta Kovacsics (Diari de Tarragona, España) 8
Jaime Pena (El Amante, Argentina y Cahiers du cinéma, España) 6.2
Olivier Pere (Locarno Film Festival, Switzerland)
Eugenio Renzi (Independencia, France) 7.1
Luciano Barisone (Duellanti / Panoramiches, Italy) 8
Carlo Chatrian (Duellanti / Panoramiches, Italy)
Jose Luis De Lorenzo (A Sala Llena, Argentina) 4
Fernando Juan Lima (El Amante, Argentina) 7.5
Xavi Serra (Ara, España)
Ernesto Garratt (El Mercurio, Chile)
Nick James (Sight & Sound, England)
Sergi Sanchez (La Razón, España) 6
Sara Brito (Público, España) 6.8
Scott Foundas (Film Comment, USA)
Sergio Wolf (BAFICI, Argentina)
Rudiger Suchsland (FAZ / Negativ, Deutschland) 7.5
Alvaro Arroba (La Lectora Provisoria, Argentina) 8.5
Pablo O. Scholz (Clarín, Argentina) 7
Nando Salva (El Periódico, España)
Pedro Butcher (Filme B / Folha de Sao Paulo, Brasil) 6
Gabriele Barrera (Nick FilmTV / Best Movie / Cinecritica, Italy)
Pamela Bienzobas (Mabuse, Chile) 7
Manu Yáñez(Fotogramas, España) 8
Gregory Valens (Positif, France)
Christoph Huber (Die Presse, Austria)
Marcelo Alderete (Mar del Plata Film Festival, Argentina) 5
Belinda Van De Graaf (Trouw, Holanda) 5
Arthur Mas (Independencia, France)
Martial Pisani (Independencia, France)
Carlos Reviriego (El Cultural / Cahiers du cinéma, España) 7
Alejandro G. Calvo (SensaCine, España) 8
Anchalee Chaiworaporn (Siam Rath, Image Magazine, Thailand)
  PROMEDIO: 6.84 (27 votos)
Mike d'Angelo (AV Club, USA) 3.4
Simon Gallagher (filmschoolrejects.com, UK) 7.5 B+
Guy Lodge (InContention.com, South Africa) 3.75
David Calhoun (Time Out London, UK) 4
Eric Kohn (Indiewire, USA) 6.25 B
Blake Williams (Ioncinema.com, Canada) 5
Dominik Kamalzadeh (Standard, Austria)  mit einer irritierenden Portion Kitsch und Sentimentalität
Sukhdev Sandhu (Telegraph, UK) 2
Peter Bradshaw (Guardian, UK) 4
Laremy Legel (Film.com, USA) 5 B-
Mayer Nissim (Digital Spy, UK) 8
Raffi Asdourian (The Film Stage, USA) 7.5 B+
Michael Giltz (The Huffington Post, USA) 3.75 1.5/4

"We Need to Talk About Kevin" Lynne Ramsay (4,47) 26 votos [Competition]
Fernando Ganzo (Lumiere, España)
Carlos Heredero (Cahiers du cinéma, España) 4
Luciano Monteagudo (Página12, Argentina) 5
Roger Alan Koza (La Voz del Interior / Con los ojos abiertos, Argentina)
Mark Peranson (Cinema Scope, Canada)
Eulalia Iglesias (Rockdelux, Cahiers du cinéma, España) 4
Diego Batlle (La Nación / OtrosCines, Argentina) 5.5
Cristina Nord (Die Tageszeitung, Deutschland) 6
Markus Keuschnigg (Die Presse, Austria)
Kong Rithdee (The Bangkok Post. Thailand) 6
Francisco Ferreira (Expresso, Portugal) 0
Violeta Kovacsics (Diari de Tarragona, España) 3
Jaime Pena (El Amante, Argentina y Cahiers du cinéma, España) 2
Olivier Pere (Locarno Film Festival, Switzerland) 1
Eugenio Renzi (Independencia, France)
Luciano Barisone (Duellanti / Panoramiches, Italy) 4
Carlo Chatrian (Duellanti / Panoramiches, Italy)
Jose Luis De Lorenzo (A Sala Llena, Argentina)
Fernando Juan Lima (El Amante, Argentina)
Xavi Serra (Ara, España)
Ernesto Garratt (El Mercurio, Chile)
Nick James (Sight & Sound, England) 8
Sergi Sanchez (La Razón, España) 7
Sara Brito (Público, España) 5.5
Scott Foundas (Film Comment, USA) 8
Sergio Wolf (BAFICI, Argentina)
Rudiger Suchsland (FAZ / Negativ, Deutschland) 4
Alvaro Arroba (La Lectora Provisoria, Argentina) 2
Pablo O. Scholz (Clarín, Argentina) 6
Nando Salva (El Periódico, España) 5
Pedro Butcher (Filme B / Folha de Sao Paulo, Brasil) 1
Gabriele Barrera (Nick FilmTV / Best Movie / Cinecritica, Italy)
Pamela Bienzobas (Mabuse, Chile) 5.5
Manu Yáñez(Fotogramas, España) 3
Gregory Valens (Positif, France)
Christoph Huber (Die Presse, Austria)
Marcelo Alderete (Mar del Plata Film Festival, Argentina)
Belinda Van De Graaf (Trouw, Holanda) 5
Arthur Mas (Independencia, France)
Martial Pisani (Independencia, France)
Carlos Reviriego (El Cultural / Cahiers du cinéma, España) 4
Alejandro G. Calvo (SensaCine, España) 4
Anchalee Chaiworaporn (Siam Rath, Image Magazine, Thailand) 7
  PROMEDIO: 4,47 (26 votos)
 Ioncinema:
Christophe Beney (Palmares magazine, France) 7.5
David Calhoun (Time Out London, UK) 10
Per Juul Carlsen (Danish National Radio, Denmark) 7.5
Paola Casella (Europa, Italy) 6.25
Andrei Creţulescu (HBO Romania)
Carlos F. Heredero (Cahiers du cinema Espana, Spain) 5
Eric Lavallée (Ioncinema.com, Canada) 6.25
Fabien Lemercier (Cineeuropa.org, Belgium) 7.5
Guy Lodge (InContention.com, South Africa) 8 A- (fixed)
Elisabeth Quin (Paris Premiere, France) 7.5
Isabelle Regnier (Le Monde, France) 1.25
James Rocchi (MSN Movies, Indiewire's The Playlist, USA) 8.375
Cédric Succivalli (International Cinephil Society, France) 6.25
Anne Thompson (Indiewire, USA) 8.375
Clarence Tsui (South China Morning Post, Hong Kong) 8.375
Eduardo Valente (Revista Cinema, Brazil) 0
Mike d'Angelo (AV Club, USA) 6.3
Matt Holmes (Obsessedwithfilm.com, USA) 9
Simon Gallagher (filmschoolrejects.com, UK) 8 A-
Eric Kohn (Indiewire, USA) 9 A
Dominik Kamalzadeh (Standard, Austria) Betörend scheitern
Sukhdev Sandhu (Telegraph, UK) 8
Peter Bradshaw (Guardian, UK) 8
Laremy Legel (Film.com, USA) 7.5 B+
Simon Reynolds (Digital Spy, UK) 8
Emma Rowley (Indies Movies Online, USA) 8
Imani Carter (The Film Stage, USA) 9 A
 Indiewire:
Simon Abrams (Freelance, USA) 3 C
David Fear (Time Out New York, USA) 5 B-
Jon Frosch (France 24, USA) 7.5 B+
Michael Giltz (The Huffington Post, USA) 6.25 2.5/4 (5 B-)
Karina Longworth (LA Weekly, USA) 6.25 B
Patrick Z. McGavin (Lightsensitive.typepad.com, USA) 7.5 B+
 Screen Daily:
Nick James (Sight & Sound, UK) 7.5
David Stratton (The Australian, Australia) 5
Derek Malcolm (London Evening, UK) 7.5
Jan Schulz-Ojala (Der Tagesspiegel, Deutschland) 2.5
Jose Carlos Avellar (Escrevercinema.com, Brazil) 7.5
Dennis Lim (The New York Times, USA) 5
Michel Ciment (Positif, France) 7.5
Alberto Crespi (L'Unita, Italy) 5
Bo Green Jensen (Weekandavisen Berlingske, Denmark) 7.5
Screen International (Screen International, USA) 7.5

“Sleeping Beauty” Julia Leigh (4,16) 27 votos [Competition]
Fernando Ganzo (Lumiere, España)
Carlos Heredero (Cahiers du cinéma, España) 6
Luciano Monteagudo (Página12, Argentina) 5
Roger Alan Koza (La Voz del Interior / Con los ojos abiertos, Argentina)
Mark Peranson (Cinema Scope, Canada)
Eulalia Iglesias (Rockdelux, Cahiers du cinéma, España) 4
Diego Batlle (La Nación / OtrosCines, Argentina) 5
Cristina Nord (Die Tageszeitung, Deutschland) 1
Markus Keuschnigg (Die Presse, Austria)
Kong Rithdee (The Bangkok Post. Thailand) 6
Francisco Ferreira (Expresso, Portugal) 0
Violeta Kovacsics (Diari de Tarragona, España) 3
Jaime Pena (El Amante, Argentina y Cahiers du cinéma, España) 6
Ernesto Garratt (El Mercurio, Chile)
Olivier Pere (Locarno Film Festival, Switzerland)
Eugenio Renzi (Independencia, France) 1.3
Luciano Barisone (Duellanti / Panoramiches, Italy) 5
Carlo Chatrian (Duellanti / Panoramiches, Italy)
Jose Luis De Lorenzo (A Sala Llena, Argentina) 7
Fernando Juan Lima (El Amante, Argentina) 7
Xavi Serra (Ara, España)
Nick James (Sight & Sound, England) 6
Sergi Sanchez (La Razón, España) 4
Sara Brito (Público, España)
Scott Foundas (Film Comment, USA) 4
Sergio Wolf (BAFICI, Argentina)
Rudiger Suchsland (Deutschland) 7
Alvaro Arroba (La Lectora Provisoria, Argentina) 2
Pablo O. Scholz (Clarín, Argentina) 4
Nando Salva (El Periódico, España) 2
Pedro Butcher (Filme B / Folha de Sao Paulo, Brasil) 4
Gabriele Barrera (Nick FilmTV / Best Movie / Cinecritica, Italy)
Pamela Bienzobas (Mabuse, Chile) 4
Manu Yáñez(Fotogramas, España) 4
Gregory Valens (Positif, France)
Christoph Huber (Die Presse, Austria)
Marcelo Alderete (Mar del Plata Film Festival, Argentina)
Belinda Van De Graaf (Holanda) 2
Arthur Mas (Independencia, France)
Martial Pisani (Independencia, France)
Carlos Reviriego (El Cultural / Cahiers du cinéma, España) 4
Alejandro G. Calvo (SensaCine, España) 5
Anchalee Chaiworaporn (Siam Rath, Image Magazine, Thailand) 4
  Puntaje/Average:  4,16 (27 votos)
 Screen Daily:
Nick James (Sight & Sound, UK) 5
David Stratton (The Australian, Australia) 5
Derek Malcolm (London Evening, UK) 5
Jan Schulz-Ojala (Der Tagesspiegel, Deutschland) 5
Jose Carlos Avellar (Escrevercinema.com, Brazil) 2.5
Dennis Lim (The New York Times, USA) 5
Michel Ciment (Positif, France) 2.5
Alberto Crespi (L'Unita, Italy) 1
Bo Green Jensen (Weekandavisen Berlingske, Denmark) 2.5
Screen International (Screen International, USA) 5
 Ioncinema:
Christophe Beney (Palmares magazine, France) 2.5
David Calhoun (Time Out London, UK) 6
Per Juul Carlsen (Danish National Radio, Denmark) 2.5
Paola Casella (Europa, Italy) 2.5
Andrei Creţulescu (HBO Romania) 5
Carlos F. Heredero (Cahiers du cinema Espana, Spain) 5
Eric Lavallée (Ioncinema.com, Canada) 5
Fabien Lemercier (Cineeuropa.org, Belgium) 2.5
Guy Lodge (InContention.com, South Africa) 8.375
Elisabeth Quin (Paris Premiere, France) 5
Isabelle Regnier (Le Monde, France) 2.5
James Rocchi (MSN Movies, Indiewire's The Playlist, USA) 7.5 B+
Cédric Succivalli (International Cinephil Society, France) 6.25
Anne Thompson (Indiewire, USA) 5
Clarence Tsui (South China Morning Post, Hong Kong) 5
Eduardo Valente (Revista Cinema, Brazil) 2.5
Mike d'Angelo (AV Club, USA) 4.9
Matt Holmes (Obsessedwithfilm.com, USA) 4
Simon Gallagher (filmschoolrejects.com, UK) 1.8 D-
Eric Kohn (Indiewire, USA) 7.5 B+
Dominik Kamalzadeh (Standard, Austria) Bemüht kontroversiell
Sukhdev Sandhu (Telegraph, UK) 8
Peter Bradshaw (Guardian, UK) 6
Laremy Legel (Film.com, USA) 1.8 D-
Mayer Nissim (Digital Spy, UK) 6
Emma Rowley (Indies Movies Online, USA) 4
 Indiewire:
Simon Abrams (Freelance, USA) 8 A-
Brian Brooks (indieWIRE, USA) 4 C+
David Fear (Time Out New York, USA) 8 A-
Jon Frosch (France 24, USA) 3 C
Michael Giltz (The Huffington Post, USA) 2 C- 1.5/4
Peter Howell (The Toronto Star, USA) 5 B-
Patrick Z. McGavin (Lightsensitive.typepad.com, USA) 7.5 B
Raffi Asdourian (The Film Stage, USA) 3 C

“Midnight in Paris” Woody Allen (5,97) 29 votos [Out of Competition]
Fernando Ganzo (Lumiere, España)
Carlos Heredero (Cahiers du cinéma, España) 5
Luciano Monteagudo (Página12, Argentina) 6
Roger Alan Koza (La Voz del Interior / Con los ojos abiertos, Argentina) 6.5
Mark Peranson (Cinema Scope, Canada)
Eulalia Iglesias (Rockdelux, Cahiers du cinéma, España) 7
Diego Batlle (La Nación / OtrosCines, Argentina) 6.5
Cristina Nord (Die Tageszeitung, Deutschland) 6
Markus Keuschnigg (Die Presse, Austria)
Kong Rithdee (The Bangkok Post. Thailand) 5
Francisco Ferreira (Expresso, Portugal) 2
Violeta Kovacsics (Diari de Tarragona, España) 6
Jaime Pena (El Amante, Argentina y Cahiers du cinéma, España) 4
Olivier Pere (Locarno Film Festival, Switzerland) 6
Eugenio Renzi (Independencia, France)
Luciano Barisone (Duellanti / Panoramiches, Italy) 4
Carlo Chatrian (Duellanti / Panoramiches, Italy)
Jose Luis De Lorenzo (A Sala Llena, Argentina) 5
Fernando Juan Lima (El Amante, Argentina) 6.5
Xavi Serra (Ara, España)
Ernesto Garratt (El Mercurio, Chile) 6
Nick James (Sight & Sound, England) 5
Sergi Sanchez (La Razón, España) 7
Sara Brito (Público, España) 6.5
Scott Foundas (Film Comment, USA) 10
Sergio Wolf (BAFICI, Argentina)
Rudiger Suchsland (Deutschland) 6.5
Alvaro Arroba (La Lectora Provisoria, Argentina) 3
Pablo O. Scholz (Clarín, Argentina) 7
Nando Salva (El Periódico, España) 6.5
Pedro Butcher (Filme B / Folha de Sao Paulo, Brasil) 8
Gabriele Barrera (Nick FilmTV / Best Movie / Cinecritica, Italy)
Pamela Bienzobas (Mabuse, Chile) 6
Manu Yáñez(Fotogramas, España) 7
Gregory Valens (Positif, France)
Christoph Huber (Die Presse, Austria)
Marcelo Alderete (Mar del Plata Film Festival, Argentina)
Belinda Van De Graaf (Holanda) 7
Arthur Mas (Independencia, France)
Martial Pisani (Independencia, France)
Carlos Reviriego (El Cultural / Cahiers du cinéma, España) 6
Alejandro G. Calvo (SensaCine, España) 6
Anchalee Chaiworaporn (Siam Rath, Image Magazine, Thailand)
  PROMEDIO: 5,97 (29 votos)
 Ioncinema:
Christophe Beney (Palmares magazine, France) 7.5
David Calhoun (Time Out London, UK) 6
Per Juul Carlsen (Danish National Radio, Denmark) 7.5
Paola Casella (Europa, Italy) 7.5
Andrei Creţulescu (HBO Romania)
Carlos F. Heredero (Cahiers du cinema Espana, Spain) 5
Eric Lavallée (Ioncinema.com, Canada) 3.75
Fabien Lemercier (Cineeuropa.org, Belgium) 5
Guy Lodge (InContention.com, South Africa) 6.25 B (wrong on indiewire)
Elisabeth Quin (Paris Premiere, France) 7.5
Isabelle Regnier (Le Monde, France) 7.5
James Rocchi (MSN Movies, Indiewire's The Playlist, USA) 7.5
Cédric Succivalli (International Cinephil Society, France) 6.25
Anne Thompson (Indiewire, USA) 8.75
Clarence Tsui (South China Morning Post, Hong Kong) 6.25
Eduardo Valente (Revista Cinema, Brazil) 3.75
Mike d'Angelo (AV Club, USA) 4.5
Matt Holmes (Obsessedwithfilm.com, USA) 8
Simon Gallagher (filmschoolrejects.com, UK) 7.5 B+
Todd McCarthy (The Hollywood Reporter, USA) 9
Pete Hammond (Boxoffice Magazine, USA) 9
Andrew O'Hehir (Salon.com, USA) 8
Peter Debruge (Variety, USA) 8
Blake Williams (Ioncinema.com, Canada) 4
Eric Kohn (Indiewire, USA) 6.25 B
Sukhdev Sandhu (Telegraph, UK) 4
Peter Bradshaw (Guardian, UK) 6
Laremy Legel (Film.com, USA) 9 A
Simon Reynolds (Digital Spy, UK) 8
Paul Martin (Indies Movies Online, USA) 6
 Indiewire:
Simon Abrams (Freelance, USA) 6.25 B
Brian Brooks (indieWIRE, USA) 6.25 B
David Fear (Time Out New York, USA)  6.25 B
Jon Frosch (France 24, USA) 7.5 B+
Michael Giltz (The Huffington Post, USA) 5 (2 C-) 2/4
Tim Grierson (Screen International, L.A. Weekly, USA) 6.25 B
Eugene Hernandez (Film Society of Lincoln Center, USA) 6.25 B
Peter Howell (The Toronto Star, USA) 5 B-
Karina Longworth (LA Weekly, USA) 6.25 B
Jonathan Rosenbaum (Chicago Reader, USA) 5 B-

"."
--
http://micropsia.otroscines.com/2011/05/
http://www.ioncinema.com/
http://www.facebook.com/notes/reini-urban/cannes-2011-critics/10150578683465012

Source at http://rurban.xarch.at/film/Cannes2011.txt
Result at http://rurban.xarch.at/film/Cannes2011.sorted.html
History at http://github.com/rurban/cannes-critics-ratings/

Last year:
http://letrasdecine.blogspot.com/2010/05
http://www.facebook.com/notes/reini-urban/cannes-2010-critics/10150174713060012
http://rurban.xarch.at/film/Cannes2010.zip

EOF

my @critics;
$critics[0] = "
Alejandro G. Calvo (Sensacine, España) 
Alex Vicente (Público, España) 
Alexandra Zawia (Wiener Zeitung, Furche, Celluloid, Austria) 
Arthur Mas (Independencia, France) 
Boris Nelepo (Kinote daily, Russia)
Camille Brunel (Independencia, France) 
Carlo Chatrian (Duellanti, Panoramiches, Italy) 
Carlos Heredero (Caimán CDC, España) 
Carlos Reviriego (elcultural.es y de Caiman. Cuadernos de cine, España) 
Cristina Nord (Die Tageszeitung, Deutschland) 
Dana Linssen (De Filmkrant, Netherlands) 
Diego Batlle (La Nación, OtrosCines, Argentina) 
Diego Lerer (Clarín, Micropsia, Argentina) 
Eugenio Renzi (Independencia, France) 
Eulalia Iglesias (RockDeLux y Caimán CDC, España) 
Fernando Ganzo (Lumiere, España) 
Fernando Juan Lima (El Amante, Argentina) 
Francisco Ferreira (Expresso, Portugal) 
Gabriele Barrera (Segnocinema, Duellanti, Blow Up, Best Movie, Italy) 
Gonzalo de Pedro (Caimán, CDC, España) 
Jaime Pena (El Amante, España/Argentina) 
Javier H. Estrada (Caimán CDC, España) 
José Luis de Lorenzo (A Sala Llena, Argentina) 
Kong Rithdee (The Bangkok Post, Thailand) 
Luciano Barisone (Duellanti/Panoramiche, Italy) 
Luciano Monteagudo (Página/12, Argentina) 
Manu Yáñez (Fotogramas, OtrosCines, España) 
Marcelo Alderete (Festival de Mar del Plata, Argentina) 
Martial Pisani (Independencia, France) 
Nando Salva (El Periódico, España) 
Neil Young (Hollywood Reporter, Tribune, UK) 
Noémie Luciani (Independencia, France) 
Olivier Père (Les Inrockuptibles, France) 
Pamela Bienzobas (Mabuse, Chile) 
Paolo Bertolin (Venice International Film Festival, Italy) 
Paolo Moretti (Venice International Film Festival, Italy)
Pedro Butcher (Folha do Sao Paulo, Filme B, Brasil) 
Philipp Engel (Go Mag, España) 
Robert Koehler (Variety, USA) 
Roger Alan Koza (La Voz del Interior, Con los ojos abiertos, Argentina) 
Rüdiger Suchsland (FAZ, Negativ-film, Deutschland) 
Sergio Wolf (BAFICI, Argentina) 
Scott Foundas (Film Comment, USA) 
Thomas Fioretti (Independencia, France) 
Violeta Kovacsics (España) 
Xavi Serra (Ara, España) 
";
# ioncinema
$critics[1] = "
Christophe Beney (Palmares magazine, France) 
David Calhoun (The Out London, UK) 
Per Juul Carlsen (Danish National Radio, Denmark) 
Paola Casella (Europa, Italy) 
Mike d'Angelo (AV Club, USA) 
Carlos F. Heredero (Cahiers du cinema Espana, Spain) 
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
$critics[3] = "
Nick James (Sight & Sound, UK)
David Stratton (The Australian, Australia)
Derek Malcolm (London Evening, UK)
Jan Schulz-Ojala (Der Tagesspiegel, Deutschland)
Jose Carlos Avellar (Escrevercinema.com, Brazil)
Dennis Lim (The New York Times, USA)
Michel Ciment (Positif, France)
Alberto Crespi (L'Unita, Italy) 
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
Michael Giltz (The Huffington Post, USA) 
Michal Oleszczyk (Hammer to Nail, USA)
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
Kate Muir (The Times, UK)
";

our $HEADER = <<"EOF";
<i>Third edition of the survey / poll of films at Cannes 2011. This year we have
gathered over 40 international critics (with a clear majority of Spanish and
Argentines, will excuse the other) that will send their scores from 1 to 10 for
all films presented in this festival and will update as soon as possible those
votes, scores and averages.</i> - Diego Lerer<p>

<small>Updated daily from http://micropsia.otroscines.com/ (Diego Lerer), http://www.ioncinema.com/, Mike d Angelo and more US critics.
Same <a href=" http://www.facebook.com/notes/reini-urban/cannes-2010-critics/10150174713060012">as last year</a>: 0-10 points, only >6.00 avg and >3 international critics [avg/num stddev]. stddev>2: <i>controversial</i>.
All sections (updated daily, official selection competition: bold)</small><p>

EOF
our $FOOTER = "
<pre>
--
http://micropsia.otroscines.com/
http://www.ioncinema.com/
http://www.facebook.com/notes/reini-urban/cannes-2011-critics/10150578683465012
http://www.screendaily.com/Journals/1/Files/2011/6/1/Screen%20Cannes%20Jury%20Grid%202011.pdf

Source at http://rurban.xarch.at/film/Cannes2011.txt
Result at http://rurban.xarch.at/film/Cannes2011.sorted.html
History at http://github.com/rurban/cannes-critics-ratings/

</pre>";

$FOOTER =~ s{http://(.+)\n}{<a href="http://$1">$1</a>\n}g;
1;
