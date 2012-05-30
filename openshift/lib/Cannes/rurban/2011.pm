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
DIEGO BATLLE (La Nación / OtrosCines, Argentina) – 6
RUDIGER SUCHSLAND (FAZ / Negativ, Germany) – 8
NANDO SALVA (El Periódico, España) – 1
 Indiewire:
Simon Abrams (Freelance, USA) 5 B-
Jon Frosch (France 24,USA) 9 A
Eric Kohn (indieWIRE, USA) 6.25 B
Guy Lodge (InContention, USA) 1.5 D+
James Rocchi (Indiewire's The Playlist, USA) 1.2 D

“The Source” Radu Mihaileanu (1.10) 5 votos [Competition]
FERNANDO GANZO (Lumiere, España) -
CARLOS HEREDERO (Cahiers du cinéma, España) -
LUCIANO MONTEAGUDO (Página12, Argentina) -
ROGER ALAN KOZA (La Voz del Interior / Con los ojos abiertos, Argentina) -
MARK PERANSON (Cinema Scope, Canada) -
EULALIA IGLESIAS (Rockdelux, Cahiers du cinéma, España) -
DIEGO BATLLE (La Nación / OtrosCines, Argentina) -
CRISTINA NORD (Die Tageszeitung, Germany) – 3.5
MARKUS KEUSCHNIGG (Die Presse, Austria) -
KONG RITHDEE (The Bangkok Post. Thailand) -
FRANCISCO FERREIRA (Expresso, Portugal) -
VIOLETA KOVACSICS (Diari de Tarragona, España) -
JAIME PENA (El Amante, Argentina y Cahiers du cinéma, España) – 0
OLIVIER PERE (Les Inrockuptibles, France) -
EUGENIO RENZI (Independencia, France) -
LUCIANO BARISONE (Duellanti / Panoramiches, Italy) -
CARLO CHATRIAN (Duellanti / Panoramiches, Italy) -
JOSE LUIS DE LORENZO (A Sala Llena, Argentina) -
FERNANDO JUAN LIMA (El Amante, Argentina) -
XAVI SERRA (Ara, España) -
ERNESTO GARRATT (El Mercurio, Chile) -
NICK JAMES (Sight & Sound, England) -
SERGI SANCHEZ (La Razón, España) -
SARA BRITO (Público, España) -
SCOTT FOUNDAS (Film Comment, U.S.) -
SERGIO WOLF (BAFICI, Argentina) -
RUDIGER SUCHSLAND (FAZ / Negativ, Germany) –  1
ALVARO ARROBA (La Lectora Provisoria, Argentina) -
PABLO O. SCHOLZ (Clarín, Argentina) -
NANDO SALVA (El Periódico, España) –  0
PEDRO BUTCHER (Filme B / Folha de Sao Paulo, Brasil) -
GABRIELE BARRERA (Nick FilmTV / Best Movie / Cinecritica, Italy) -
PAMELA BIENZOBAS (Mabuse, Chile) -
MANU YAÑEZ (Fotogramas, España) -
GREGORY VALENS (Positif, France) -
CHRISTOPH HUBER (Die Presse, Austria) -
MARCELO ALDERETE (Mar del Plata Film Festival, Argentina) -
BELINDA VAN DE GRAAF (Trouw, Holanda) -
ARTHUR MAS (Independencia, France) -
MARTIAL PISANI (Independencia, France) -
CARLOS REVIRIEGO (El Cultural / Cahiers du cinéma, España) -
ALEJANDRO G. CALVO (SensaCine, España) -
ANCHALEE CHAIWORAPORN (Siam Rath, Image Magazine, Thailand) – 1
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
Jan Schulz-Ojala (Der Tagesspiegel, Germany) 2.5
Jose Carlos Avellar (Escrevercinema.com, Brazil) 5
Dennis Lim (The New York Times, USA) 
Michel Ciment (Positif, France) 1
Alberto Crespi (L'Unita, Italy) 
Bo Green Jensen (Weekandavisen Berlingske, Denmark) 5
Screen International (Screen International, USA) 7.5

“Once Upon a Time in Anatolya” Nuri Bilge Ceylan (7.12) 12 votos [Competition] Grand prix
FERNANDO GANZO (Lumiere, España) – 5.5
CARLOS HEREDERO (Cahiers du cinéma, España) -
LUCIANO MONTEAGUDO (Página12, Argentina) –  8
ROGER ALAN KOZA (La Voz del Interior / Con los ojos abiertos, Argentina) – 7.5
MARK PERANSON (Cinema Scope, Canada) -
EULALIA IGLESIAS (Rockdelux, Cahiers du cinéma, España) -
DIEGO BATLLE (La Nación / OtrosCines, Argentina) – 7
CRISTINA NORD (Die Tageszeitung, Germany) -
MARKUS KEUSCHNIGG (Die Presse, Austria) -
KONG RITHDEE (The Bangkok Post. Thailand) -
FRANCISCO FERREIRA (Expresso, Portugal) -
VIOLETA KOVACSICS (Diari de Tarragona, España) -
JAIME PENA (El Amante, Argentina y Cahiers du cinéma, España) –  6
OLIVIER PERE (Les Inrockuptibles, France) -
EUGENIO RENZI (Independencia, France) -
LUCIANO BARISONE (Duellanti / Panoramiches, Italy) -
CARLO CHATRIAN (Duellanti / Panoramiches, Italy) -
JOSE LUIS DE LORENZO (A Sala Llena, Argentina) -
FERNANDO JUAN LIMA (El Amante, Argentina) -
XAVI SERRA (Ara, España) -
ERNESTO GARRATT (El Mercurio, Chile) -
NICK JAMES (Sight & Sound, England) -
SERGI SANCHEZ (La Razón, España) -
SARA BRITO (Público, España) – 6.9
SCOTT FOUNDAS (Film Comment, U.S.) – 10
SERGIO WOLF (BAFICI, Argentina) -
RUDIGER SUCHSLAND (FAZ / Negativ, Germany) –  7.50
ALVARO ARROBA (La Lectora Provisoria, Argentina) -
PABLO O. SCHOLZ (Clarín, Argentina) – 5
NANDO SALVA (El Periódico, España) – 8
PEDRO BUTCHER (Filme B / Folha de Sao Paulo, Brasil) -
GABRIELE BARRERA (Nick FilmTV / Best Movie / Cinecritica, Italy) -
PAMELA BIENZOBAS (Mabuse, Chile) -
MANU YAÑEZ (Fotogramas, España) -
GREGORY VALENS (Positif, France) -
CHRISTOPH HUBER (Die Presse, Austria) -
MARCELO ALDERETE (Mar del Plata Film Festival, Argentina) -
BELINDA VAN DE GRAAF (Trouw, Holanda) -
ARTHUR MAS (Independencia, France) -
MARTIAL PISANI (Independencia, France) -
CARLOS REVIRIEGO (El Cultural / Cahiers du cinéma, España) – 6
ALEJANDRO G. CALVO (SensaCine, España) -
ANCHALEE CHAIWORAPORN (Siam Rath, Image Magazine, Thailand) - 8
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
Jan Schulz-Ojala (Der Tagesspiegel, Germany) 5
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
DIEGO BATLLE (La Nación / OtrosCines, Argentina) – 7

"Les Géants" Bouli Lanner [Quinzaine] Art Cinema award + Prix SACD

"Atmen" Karl Markovic [Quinzaine] Label Europa Cinemas award

“This Must Be the Place” Paolo Sorrentino (3.075) 19 votos [Competition] Ecumenical Jury prize
FERNANDO GANZO (Lumiere, España) -
CARLOS HEREDERO (Cahiers du cinéma, España) –  3
LUCIANO MONTEAGUDO (Página12, Argentina) - 3
ROGER ALAN KOZA (La Voz del Interior / Con los ojos abiertos, Argentina) –  2
MARK PERANSON (Cinema Scope, Canada) -
EULALIA IGLESIAS (Rockdelux, Cahiers du cinéma, España) - 6
DIEGO BATLLE (La Nación / OtrosCines, Argentina) –  5.5
CRISTINA NORD (Die Tageszeitung, Germany) –  1
MARKUS KEUSCHNIGG (Die Presse, Austria) -
KONG RITHDEE (The Bangkok Post. Thailand) -
FRANCISCO FERREIRA (Expresso, Portugal) -
VIOLETA KOVACSICS (Diari de Tarragona, España) -
JAIME PENA (El Amante, Argentina y Cahiers du cinéma, España) - 1
OLIVIER PERE (Les Inrockuptibles, France) -
EUGENIO RENZI (Independencia, France) -
LUCIANO BARISONE (Duellanti / Panoramiches, Italy) –  5
CARLO CHATRIAN (Duellanti / Panoramiches, Italy) -
JOSE LUIS DE LORENZO (A Sala Llena, Argentina) - 5
FERNANDO JUAN LIMA (El Amante, Argentina) - 5
XAVI SERRA (Ara, España) -
ERNESTO GARRATT (El Mercurio, Chile) -
NICK JAMES (Sight & Sound, England) -
SERGI SANCHEZ (La Razón, España) - 2
SARA BRITO (Público, España) - 0
SCOTT FOUNDAS (Film Comment, U.S.) - 2
SERGIO WOLF (BAFICI, Argentina) -
RUDIGER SUCHSLAND (WAZ / Negativ, Germany) –  0
ALVARO ARROBA (La Lectora Provisoria, Argentina) -
PABLO O. SCHOLZ (Clarín, Argentina) - 5
NANDO SALVA (El Periódico, España) - 0
PEDRO BUTCHER (Filme B / Folha de Sao Paulo, Brasil) -
GABRIELE BARRERA (Nick FilmTV / Best Movie / Cinecritica, Italy) -
PAMELA BIENZOBAS (Mabuse, Chile) -
MANU YAÑEZ (Fotogramas, España) -
GREGORY VALENS (Positif, France) -
CHRISTOPH HUBER (Die Presse, Austria) -
MARCELO ALDERETE (Mar del Plata Film Festival, Argentina) - 5
BELINDA VAN DE GRAAF (Trouw, Holanda) -
ARTHUR MAS (Independencia, France) -
MARTIAL PISANI (Independencia, France) -
CARLOS REVIRIEGO (El Cultural / Cahiers du cinéma, España) –  0
ALEJANDRO G. CALVO (SensaCine, España) –  3
ANCHALEE CHAIWORAPORN (Siam Rath, Image Magazine, Thailand) - 8
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
Jan Schulz-Ojala (Der Tagesspiegel, Germany) 7.5
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
RUDIGER SUCHSLAND (WAZ / Negativ, Germany) – 7

"Corman's World" Alex Stapleton
MARCELO ALDERETE (Mar del Plata Film Festival, Argentina) –  6
Simon Reynolds (DigiatSpy, USA) 8

"Blue Bird" Gust Van den Berghe [Quinzaine]
CRISTINA NORD (Die Tageszeitung, Germany) – 6.8
RUDIGER SUCHSLAND (WAZ / Negativ, Germany) – 2

"Sauna on Moon" Zou Pen [Semaine]
RUDIGER SUCHSLAND (WAZ / Negativ, Germany) – 5.8
CARLO CHATRIAN (Duellanti / Panoramiches, Italy) –  5
ROGER ALAN KOZA (La Voz del Interior / Con los ojos abiertos, Argentina) – 6.5
PAOLO BERTOLIN (Cineforum, Italia) - 5
SCOTT FOUNDAS (Film Comment, U.S.) - 6

"Après le sud" Jean-Jacques Jauffre [Quinzaine]
JAIME PENA (El Amante, Argentina y Cahiers du cinéma, España) –  2

"Avé" Konstantin Bojano [Semaine]
CARLO CHATRIAN (Duellanti / Panoramiches, Italy) –  6.50
RUDIGER SUCHSLAND (WAZ / Negativ, Germany) – 7.00

"El velador / The Night Watchman" Natalia Almada (6,00) 2 votos [Quinzaine]
ROGER ALAN KOZA (La Voz del Interior / Con los ojos abiertos, Argentina) –  6
?? () 6

"My Little Princess" Eva Ionescu [Semaine]
SERGIO WOLF (BAFICI, Argentina) – 1
RUDIGER SUCHSLAND (WAZ / Negativ, Germany) – 3.9

"Snowtown" Justin Kurzel [Semaine] (Adelaide) Special Mention
Kevin Jagernauth (Indiewire's The Playlist, USA) 4 C+
CARLOS HEREDERO (Cahiers du cinéma, España) –  2
Michael Giltz (The Huffington Post, USA) 5  2/4

"Dias De Gracia (Days Of Grace)" Everardo Gout
EULALIA IGLESIAS (Rockdelux, Cahiers du cinéma, España) – 3
MARCELO ALDERETE  (Mar del Plata Film Festival, Argentina) –  0

"La Khaoufa Baada Al'Yaoum (No More Fear)" Mourad Ben Cheikh
LUCIANO MONTEAGUDO (Página12, Argentina) –  6

"La Conquête (The Conquest)" Xavier Durringer
RUDIGER SUCHSLAND (WAZ / Negativ, Germany) –  7
SERGI SANCHEZ (La Razón, España) – 5.5
DIEGO BATLLE (La Nación / OtrosCines, Argentina) –  6
NANDO SALVA (El Periódico, España) – 3
Agnès C Poirier (Guardian, UK) 4

"The Big Fix" Josh Tickell [Special Screenings]
Simon Gallagher (filmschoolrejects.com, UK) 8 A-
EULALIA IGLESIAS (Rockdelux, Cahiers du cinéma, España) – 3
MARCELO ALDERETE (Mar del Plata Film Festival, Argentina) –  0
CARLO CHATRIAN (Duellanti / Panoramiches, Italy) –  4
ALEJANDRO G. CALVO (SensaCine, España) –  5

"Okhotnik / The Hunter" Bakur Bakuradze [Un Certain Regard]
LUCIANO MONTEAGUDO (Página12, Argentina) – 5
EULALIA IGLESIAS (Rockdelux, Cahiers du cinéma, España) - 7
DIEGO BATLLE (La Nación / OtrosCines, Argentina) – 6
JAIME PENA (El Amante, Argentina y Cahiers du cinéma, España) – 4
JOSE LUIS DE LORENZO (A Sala Llena, Argentina) - 3
FERNANDO JUAN LIMA (El Amante, Argentina) - 2
RUDIGER SUCHSLAND (WAZ / Negativ, Germany) –  4
FERNANDO GANZO (Lumiere, España) – 3

“Return” Liza Johnson [Quinzaine]
Mike d'Angelo (AV Club, USA) 6.1 Promising debut
SERGIO WOLF (BAFICI, Argentina) – 6

"En ville" Valérie Mréjen et Bertrand Schefe [Quinzaine]

"Des Jeunes Gens Mödernes" Jérôme de Missol [Quinzaine]

"Pourquoi tu pleures?" Katia Lewkowic

"Sur la planche" Leïla Kilani [Quinzaine]

“Drive” Nicolas Winding Refn (7.28) 21 votos [Competition] Best Director
Mike d'Angelo (AV Club, USA) 7.6 B+
FERNANDO GANZO (Lumiere, España) -
CARLOS HEREDERO (Cahiers du cinéma, España) - 6.5
LUCIANO MONTEAGUDO (Página12, Argentina) - 5
ROGER ALAN KOZA (La Voz del Interior / Con los ojos abiertos, Argentina) – 7
MARK PERANSON (Cinema Scope, Canada) -
EULALIA IGLESIAS (Rockdelux, Cahiers du cinéma, España) - 9
DIEGO BATLLE (La Nación / OtrosCines, Argentina) – 7.5
CRISTINA NORD (Die Tageszeitung, Germany) – 7.5
MARKUS KEUSCHNIGG (Die Presse, Austria) -
KONG RITHDEE (The Bangkok Post. Thailand) – 8
FRANCISCO FERREIRA (Expresso, Portugal) -
VIOLETA KOVACSICS (Diari de Tarragona, España) -
JAIME PENA (El Amante, Argentina y Cahiers du cinéma, España) – 7.9
OLIVIER PERE (Les Inrockuptibles, France) – 8.5
EUGENIO RENZI (Independencia, France) -
LUCIANO BARISONE (Duellanti / Panoramiches, Italy) – 5
CARLO CHATRIAN (Duellanti / Panoramiches, Italy) - 5
JOSE LUIS DE LORENZO (A Sala Llena, Argentina) -
FERNANDO JUAN LIMA (El Amante, Argentina) -
XAVI SERRA (Ara, España) -
ERNESTO GARRATT (El Mercurio, Chile) -
NICK JAMES (Sight & Sound, England) -
SERGI SANCHEZ (La Razón, España) - 7
SARA BRITO (Público, España) -
SCOTT FOUNDAS (Film Comment, U.S.) -
SERGIO WOLF (BAFICI, Argentina) -
RUDIGER SUCHSLAND (WAZ / Negativ, Germany) - 8
ALVARO ARROBA (La Lectora Provisoria, Argentina) -
PABLO O. SCHOLZ (Clarín, Argentina) – 6
NANDO SALVA (El Periódico, España) -
PEDRO BUTCHER (Filme B / Folha de Sao Paulo, Brasil) -
GABRIELE BARRERA (Nick FilmTV / Best Movie / Cinecritica, Italy) -
PAMELA BIENZOBAS (Mabuse, Chile) -
MANU YAÑEZ (Fotogramas, España) -
GREGORY VALENS (Positif, France) -
CHRISTOPH HUBER (Die Presse, Austria) -
MARCELO ALDERETE (Mar del Plata Film Festival, Argentina) -
BELINDA VAN DE GRAAF (Trouw, Holanda) -
ARTHUR MAS (Independencia, France) -
MARTIAL PISANI (Independencia, France) -
CARLOS REVIRIEGO (El Cultural / Cahiers du cinéma, España) - 8
ALEJANDRO G. CALVO (SensaCine, España) - 9
ANCHALEE CHAIWORAPORN (Siam Rath, Image Magazine, Thailand) -
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
Jan Schulz-Ojala (Der Tagesspiegel, Germany) 7.5
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
FERNANDO GANZO (Lumiere, España) – 4
LUCIANO MONTEAGUDO (Página12, Argentina) – 8
ROGER ALAN KOZA (La Voz del Interior / Con los ojos abiertos, Argentina) –  7
EULALIA IGLESIAS (Rockdelux, Cahiers du cinéma, España) –  8
DIEGO BATLLE (La Nación / OtrosCines, Argentina) – 7.5
VIOLETA KOVACSICS (Diari de Tarragona, España) –  9.3
JAIME PENA (El Amante, Argentina y Cahiers du cinéma, España) – 7
FERNANDO JUAN LIMA (El Amante, Argentina) –  9
RUDIGER SUCHSLAND (FAZ / Negativ, Germany) –  9.50
PAMELA BIENZOBAS (Mabuse, Chile) –  6.3
MARCELO ALDERETE (Mar del Plata Film Festival, Argentina) – 8
ALEJANDRO G. CALVO (SensaCine, España) –  8

"La Nuit, elles dansent" Isabelle Lavigne et Stéphane Thibault (6.00) 4 votos [Quinzaine]
FERNANDO GANZO (Lumiere, España) –  4
LUCIANO BARISONE (Duellanti / Panoramiches, Italy) –  6
RUDIGER SUCHSLAND (FAZ / Negativ, Germany) –  6
ANCHALEE CHAIWORAPORN (Siam Rath, Image Magazine, Thailand) –  8

"Chatrak" Vimukthi Jayasundara (5.92) 6 votos [Quinzaine]
EULALIA IGLESIAS (Rockdelux, Cahiers du cinéma, España) –  6.5
JAIME PENA (El Amante, Argentina y Cahiers du cinéma, España) –  4
CARLO CHATRIAN (Duellanti / Panoramiches, Italy) –  7
ALVARO ARROBA (La Lectora Provisoria, Argentina) –  4
PAOLO BERTOLIN (Cineforum, Italia) – 9
MARCELO ALDERETE (Mar del Plata Film Festival, Argentina) –  5

"L'Exercise de L'Etat / The Minister" Pierre Schoeller (6.05) 10 votos [Un Certain Regard]
EULALIA IGLESIAS (Rockdelux, Cahiers du cinéma, España) – 4.5
DIEGO BATLLE (La Nación / OtrosCines, Argentina) –  6.5
CRISTINA NORD (Die Tageszeitung, Germany) – 6.9
KONG RITHDEE (The Bangkok Post. Thailand) – 5.5
CARLO CHATRIAN (Duellanti / Panoramiches, Italy) – 6
FERNANDO JUAN LIMA (El Amante, Argentina) –  4
SCOTT FOUNDAS (Film Comment, U.S.) –  6
RUDIGER SUCHSLAND (FAZ / Negativ, Germany) –  7.1
CARLOS REVIRIEGO (El Cultural / Cahiers du cinéma, España) –  6

"Koi no Tsumi / Guilty of Romance" Sion Sono (8.44) 5 votos [Quinzaine]
ROGER ALAN KOZA (La Voz del Interior / Con los ojos abiertos, Argentina) – 8
VIOLETA KOVACSICS (Diari de Tarragona, España) -  9.2
JAIME PENA (El Amante, Argentina y Cahiers du cinéma, España) –  7.5
FERNANDO JUAN LIMA (El Amante, Argentina) -  9.5
MARCELO ALDERETE (Mar del Plata Film Festival, Argentina) –  8

“The Day He Arrives” Hong Sangsoo (7.65) 22 votos [Un Certain Regard]
FERNANDO GANZO (Lumiere, España) –  8.80
CARLOS HEREDERO (Cahiers du cinéma, España) – 8.50
LUCIANO MONTEAGUDO (Página12, Argentina) -
ROGER ALAN KOZA (La Voz del Interior / Con los ojos abiertos, Argentina) –  8.50
MARK PERANSON (Cinema Scope, Canada) -
EULALIA IGLESIAS (Rockdelux, Cahiers du cinéma, España) – 7.5
DIEGO BATLLE (La Nación / OtrosCines, Argentina) – 7.5
CRISTINA NORD (Die Tageszeitung, Germany) -
MARKUS KEUSCHNIGG (Die Presse, Austria) -
KONG RITHDEE (The Bangkok Post. Thailand) -
FRANCISCO FERREIRA (Expresso, Portugal) -  8.50
VIOLETA KOVACSICS (Diari de Tarragona, España) -  8
JAIME PENA (El Amante, Argentina y Cahiers du cinéma, España) –  7.90
OLIVIER PERE (Les Inrockuptibles, France) -  6
EUGENIO RENZI (Independencia, France) -
LUCIANO BARISONE (Duellanti / Panoramiches, Italy) –  8
CARLO CHATRIAN (Duellanti / Panoramiches, Italy) – 8
JOSE LUIS DE LORENZO (A Sala Llena, Argentina) -  5
FERNANDO JUAN LIMA (El Amante, Argentina) –  8
XAVI SERRA (Ara, España) -
ERNESTO GARRATT (El Mercurio, Chile) -
NICK JAMES (Sight & Sound, England) -
SERGI SANCHEZ (La Razón, España) -
SARA BRITO (Público, España) -
SCOTT FOUNDAS (Film Comment, U.S.) -  7
SERGIO WOLF (BAFICI, Argentina) -
RUDIGER SUCHSLAND (FAZ / Negativ, Germany) -
ALVARO ARROBA (La Lectora Provisoria, Argentina) -  8.5
PABLO O. SCHOLZ (Clarín, Argentina) –  7
NANDO SALVA (El Periódico, España) -
PEDRO BUTCHER (Filme B / Folha de Sao Paulo, Brasil) -  7
GABRIELE BARRERA (Nick FilmTV / Best Movie / Cinecritica, Italy) -
PAMELA BIENZOBAS (Mabuse, Chile) -
MANU YAÑEZ (Fotogramas, España) -
GREGORY VALENS (Positif, France) -
PAOLO BERTOLIN (Cineforum, Italia) –  7.50
MARCELO ALDERETE (Mar del Plata Film Festival, Argentina) –  10
BELINDA VAN DE GRAAF (Trouw, Holanda) -
ARTHUR MAS (Independencia, France) -
MARTIAL PISANI (Independencia, France) -
CARLOS REVIRIEGO (El Cultural / Cahiers du cinéma, España) –  7
ALEJANDRO G. CALVO (SensaCine, España) –  7
ANCHALEE CHAIWORAPORN (Siam Rath, Image Magazine, Thailand) -  7
Mike d'Angelo (AV Club, USA) ??? Reading the reviews, it's clear that the film's central conceit completely escaped me. 2nd viewing required.

“This is Not a Film” Jafar Panahi & Mojtaba Mirtahmasb (7.14) 14 votos
FERNANDO GANZO (Lumiere, España) – 4
CARLOS HEREDERO (Cahiers du cinéma, España) –  4
LUCIANO MONTEAGUDO (Página12, Argentina) –  9
ROGER ALAN KOZA (La Voz del Interior / Con los ojos abiertos, Argentina) – 8.5
EULALIA IGLESIAS (Rockdelux, Cahiers du cinéma, España) – 6
DIEGO BATLLE (La Nación / OtrosCines, Argentina) –  10
CRISTINA NORD (Die Tageszeitung, Germany) –  8
KONG RITHDEE (The Bangkok Post, Thailand) – 8
JAIME PENA (El Amante, Argentina y Cahiers du cinéma, España) –  4
JOSE LUIS DE LORENZO (A Sala Llena, Argentina) –  6
FERNANDO JUAN LIMA (El Amante, Argentina) – 8.50
SCOTT FOUNDAS (Film Comment, U.S.) – 9
PABLO O. SCHOLZ (Clarín, Argentina) –  8
PAMELA BIENZOBAS (Mabuse, Chile) -  7
Mike d'Angelo (AV Club, USA) 5.1

"La Piel Que Habito / The Skin I Live In" Pedro Almodóva (6,92) 28 votos [Competition]
FERNANDO GANZO (Lumiere, España) –  7
CARLOS HEREDERO (Cahiers du cinéma, España) –  5
LUCIANO MONTEAGUDO (Página12, Argentina) –  6
ROGER ALAN KOZA (La Voz del Interior / Con los ojos abiertos, Argentina) –  4
MARK PERANSON (Cinema Scope, Canada) -
EULALIA IGLESIAS (Rockdelux, Cahiers du cinéma, España) - 8
DIEGO BATLLE (La Nación / OtrosCines, Argentina) – 7
CRISTINA NORD (Die Tageszeitung, Germany) –  6.9
MARKUS KEUSCHNIGG (Die Presse, Austria) -
KONG RITHDEE (The Bangkok Post. Thailand) –  6
FRANCISCO FERREIRA (Expresso, Portugal) – 7
VIOLETA KOVACSICS (Diari de Tarragona, España) -  7.7
JAIME PENA (El Amante, Argentina y Cahiers du cinéma, España) –  8.2
OLIVIER PERE (Les Inrockuptibles, France) -
EUGENIO RENZI (Independencia, France) -
LUCIANO BARISONE (Duellanti / Panoramiches, Italy) –  6
CARLO CHATRIAN (Duellanti / Panoramiches, Italy) -  5
JOSE LUIS DE LORENZO (A Sala Llena, Argentina) –  9
FERNANDO JUAN LIMA (El Amante, Argentina) –  5
XAVI SERRA (Ara, España) -
ERNESTO GARRATT (El Mercurio, Chile) -
NICK JAMES (Sight & Sound, England) -
SERGI SANCHEZ (La Razón, España) -  8.5
SARA BRITO (Público, España) - 5.9
SCOTT FOUNDAS (Film Comment, U.S.) -  3
SERGIO WOLF (BAFICI, Argentina) -
RUDIGER SUCHSLAND (WAZ / Negativ, Germany) - 7.9
ALVARO ARROBA (La Lectora Provisoria, Argentina) -  8.99
PABLO O. SCHOLZ (Clarín, Argentina) –  7
NANDO SALVA (El Periódico, España) - 7
PEDRO BUTCHER (Filme B / Folha de Sao Paulo, Brasil) -  7.5
GABRIELE BARRERA (Nick FilmTV / Best Movie / Cinecritica, Italy) -
PAMELA BIENZOBAS (Mabuse, Chile) -  7.8
MANU YAÑEZ (Fotogramas, España) -
GREGORY VALENS (Positif, France) -
PAOLO BERTOLIN (Cineforum, Italia) – 8.50
MARCELO ALDERETE (Mar del Plata Film Festival, Argentina) -
BELINDA VAN DE GRAAF (Trouw, Holanda) -
ARTHUR MAS (Independencia, France) -
MARTIAL PISANI (Independencia, France) -
CARLOS REVIRIEGO (El Cultural / Cahiers du cinéma, España) - 7
ALEJANDRO G. CALVO (SensaCine, España) - 8
ANCHALEE CHAIWORAPORN (Siam Rath, Image Magazine, Thailand) -  9
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
Jan Schulz-Ojala (Der Tagesspiegel, Germany) 5
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
FERNANDO GANZO (Lumiere, España) – 5.2012
CARLOS HEREDERO (Cahiers du cinéma, España) –  8
LUCIANO MONTEAGUDO (Página12, Argentina) –  5
ROGER ALAN KOZA (La Voz del Interior / Con los ojos abiertos, Argentina) –  4.5
MARK PERANSON (Cinema Scope, Canada) -
EULALIA IGLESIAS (Rockdelux, Cahiers du cinéma, España) –  7.50
DIEGO BATLLE (La Nación / OtrosCines, Argentina) –  5.50
CRISTINA NORD (Die Tageszeitung, Germany) –  4
MARKUS KEUSCHNIGG (Die Presse, Austria) - 
KONG RITHDEE (The Bangkok Post. Thailand) -  4
FRANCISCO FERREIRA (Expresso, Portugal) -  4
VIOLETA KOVACSICS (Diari de Tarragona, España) –  8
JAIME PENA (El Amante, Argentina y Cahiers du cinéma, España) - 5.9
OLIVIER PERE (Les Inrockuptibles, France) -
EUGENIO RENZI (Independencia, France) -
LUCIANO BARISONE (Duellanti / Panoramiches, Italy) –  4
CARLO CHATRIAN (Duellanti / Panoramiches, Italy) -
JOSE LUIS DE LORENZO (A Sala Llena, Argentina) –  4
FERNANDO JUAN LIMA (El Amante, Argentina) –  4
XAVI SERRA (Ara, España) -
ERNESTO GARRATT (El Mercurio, Chile) -
NICK JAMES (Sight & Sound, England) -
SERGI SANCHEZ (La Razón, España) -  5
SARA BRITO (Público, España) - 6
SCOTT FOUNDAS (Film Comment, U.S.) -  8
SERGIO WOLF (BAFICI, Argentina) -
RUDIGER SUCHSLAND (WAZ / Negativ, Germany) - 7.9
ALVARO ARROBA (La Lectora Provisoria, Argentina) –  6.5
PABLO O. SCHOLZ (Clarín, Argentina) –  6
NANDO SALVA (El Periódico, España) - 4
PEDRO BUTCHER (Filme B / Folha de Sao Paulo, Brasil) -
GABRIELE BARRERA (Nick FilmTV / Best Movie / Cinecritica, Italy) -
PAMELA BIENZOBAS (Mabuse, Chile) – 5.50
MANU YAÑEZ (Fotogramas, España) -
GREGORY VALENS (Positif, France) -
CHRISTOPH HUBER (Die Presse, Austria) -
MARCELO ALDERETE (Mar del Plata Film Festival, Argentina) –  3
BELINDA VAN DE GRAAF (Trouw, Holanda) -
ARTHUR MAS (Independencia, France) -
MARTIAL PISANI (Independencia, France) -
CARLOS REVIRIEGO (El Cultural / Cahiers du cinéma, España) –  4.5
ALEJANDRO G. CALVO (SensaCine, España) -  7
ANCHALEE CHAIWORAPORN (Siam Rath, Image Magazine, Thailand) -  7
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
Jan Schulz-Ojala (Der Tagesspiegel, Germany) 7.5
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
FERNANDO GANZO (Lumiere, España) –  4
CARLOS HEREDERO (Cahiers du cinéma, España) –  7
LUCIANO MONTEAGUDO (Página12, Argentina) – 7.50
ROGER ALAN KOZA (La Voz del Interior / Con los ojos abiertos, Argentina) -
MARK PERANSON (Cinema Scope, Canada) -
EULALIA IGLESIAS (Rockdelux, Cahiers du cinéma, España) -
DIEGO BATLLE (La Nación / OtrosCines, Argentina) –  8
CRISTINA NORD (Die Tageszeitung, Germany) –  7
MARKUS KEUSCHNIGG (Die Presse, Austria) -
KONG RITHDEE (The Bangkok Post. Thailand) -
FRANCISCO FERREIRA (Expresso, Portugal) -  2
VIOLETA KOVACSICS (Diari de Tarragona, España) – 6
JAIME PENA (El Amante, Argentina y Cahiers du cinéma, España) –  7
OLIVIER PERE (Les Inrockuptibles, France) -
EUGENIO RENZI (Independencia, France) -
LUCIANO BARISONE (Duellanti / Panoramiches, Italy) –  7
CARLO CHATRIAN (Duellanti / Panoramiches, Italy) -
JOSE LUIS DE LORENZO (A Sala Llena, Argentina) –  8
FERNANDO JUAN LIMA (El Amante, Argentina) –  8
XAVI SERRA (Ara, España) -
ERNESTO GARRATT (El Mercurio, Chile) -
NICK JAMES (Sight & Sound, England) -
SERGI SANCHEZ (La Razón, España) -  6.5
SARA BRITO (Público, España) - 6.5
SCOTT FOUNDAS (Film Comment, U.S.) – 9
SERGIO WOLF (BAFICI, Argentina) -
RUDIGER SUCHSLAND (FAZ / Negativ, Germany) –  4.5
ALVARO ARROBA (La Lectora Provisoria, Argentina) –  5.5
PABLO O. SCHOLZ (Clarín, Argentina) –  4
NANDO SALVA (El Periódico, España) - 3
PEDRO BUTCHER (Filme B / Folha de Sao Paulo, Brasil) -  4
GABRIELE BARRERA (Nick FilmTV / Best Movie / Cinecritica, Italy) -
PAMELA BIENZOBAS (Mabuse, Chile) -  6.7
MANU YAÑEZ (Fotogramas, España) -
GREGORY VALENS (Positif, France) -
CHRISTOPH HUBER (Die Presse, Austria) -
MARCELO ALDERETE (Mar del Plata Film Festival, Argentina) - 5
BELINDA VAN DE GRAAF (Trouw, Holanda) -
ARTHUR MAS (Independencia, France) -
MARTIAL PISANI (Independencia, France) -
CARLOS REVIRIEGO (El Cultural / Cahiers du cinéma, España) –  7.5
ALEJANDRO G. CALVO (SensaCine, España) –  7
ANCHALEE CHAIWORAPORN (Siam Rath, Image Magazine, Thailand) -  7
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
Jan Schulz-Ojala (Der Tagesspiegel, Germany) 2.5
Jose Carlos Avellar (Escrevercinema.com, Brazil) 5
Dennis Lim (The New York Times, USA) 5
Michel Ciment (Positif, France) 5
Alberto Crespi (L'Unita, Italy) 2.5
Bo Green Jensen (Weekandavisen Berlingske, Denmark) 5
Screen International (Screen International, USA) 5

"Oslo, 31. August" Joachim Trier (4.25) 8 votos [Un Certain Regard]
ROGER ALAN KOZA (La Voz del Interior / Con los ojos abiertos, Argentina) – 5
DIEGO BATLLE (La Nación / OtrosCines, Argentina) –  6
JAIME PENA (El Amante, Argentina y Cahiers du cinéma, España) –  6
JOSE LUIS DE LORENZO (A Sala Llena, Argentina) –  3
FERNANDO JUAN LIMA (El Amante, Argentina) –  4
ALVARO ARROBA (La Lectora Provisoria, Argentina) –  1
PABLO O. SCHOLZ (Clarín, Argentina) –  5
CARLOS REVIRIEGO (El Cultural / Cahiers du cinéma, España) –  4

"The Beaver" Jody Foster (2.80) 5 votos [Out of Competition]
CARLOS HEREDERO (Cahiers du cinéma, España) –  3
EULALIA IGLESIAS (Rockdelux, Cahiers du cinéma, España) –  4
VIOLETA KOVACSICS (Diari de Tarragona, España) -  2
SERGI SANCHEZ (La Razón, España) –  4
ALEJANDRO G. CALVO (SensaCine, España) –   1
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
CARLOS HEREDERO (Cahiers du cinéma, España) –  3
LUCIANO MONTEAGUDO (Página12, Argentina) –  5
DIEGO BATLLE (La Nación / OtrosCines, Argentina) –  6.5
CRISTINA NORD (Die Tageszeitung, Germany) –  5
LUCIANO BARISONE (Duellanti / Panoramiches, Italy) –  5
CARLO CHATRIAN (Duellanti / Panoramiches, Italy) -  4
JOSE LUIS DE LORENZO (A Sala Llena, Argentina) –  6
FERNANDO JUAN LIMA (El Amante, Argentina) –  5
PABLO O. SCHOLZ (Clarín, Argentina) –  5
Mike d'Angelo (AV Club, USA) 0 walkaout

"Skoonheid / Beauty" Oliver Hermanus (2.40) 5 votos [Un Certain Regard]
KONG RITHDEE (The Bangkok Post. Thailand) –  5
OLIVIER PERE (Les Inrockuptibles, France) –  0
PEDRO BUTCHER (Filme B / Folha de Sao Paulo, Brasil) –  3
MARCELO ALDERETE (Mar del Plata Film Festival, Argentina) –  3
ALEJANDRO G. CALVO (SensaCine, España) –  1
Guy Lodge (InContention.com, South Africa) 7.5 B+
Michael Giltz (The Huffington Post, USA) 5  2/4

"Tatsumi" Eric Khoo (6.59) 13 voto [Un Certain Regard]
ERNANDO GANZO (Lumiere, España) –  5
CARLOS HEREDERO (Cahiers du cinéma, España) –  5
LUCIANO MONTEAGUDO (Página12, Argentina) -
ROGER ALAN KOZA (La Voz del Interior / Con los ojos abiertos, Argentina) -
MARK PERANSON (Cinema Scope, Canada) -
EULALIA IGLESIAS (Rockdelux, Cahiers du cinéma, España) -
DIEGO BATLLE (La Nación / OtrosCines, Argentina) –  8
CRISTINA NORD (Die Tageszeitung, Germany) -
MARKUS KEUSCHNIGG (Die Presse, Austria) -
KONG RITHDEE (The Bangkok Post. Thailand) -
FRANCISCO FERREIRA (Expresso, Portugal) -  6.5
VIOLETA KOVACSICS (Diari de Tarragona, España) -
JAIME PENA (El Amante, Argentina y Cahiers du cinéma, España) –  7
OLIVIER PERE (Les Inrockuptibles, France) –  8
EUGENIO RENZI (Independencia, France) -  5.9
LUCIANO BARISONE (Duellanti / Panoramiches, Italy) -
CARLO CHATRIAN (Duellanti / Panoramiches, Italy) –  6
JOSE LUIS DE LORENZO (A Sala Llena, Argentina) –  8
FERNANDO JUAN LIMA (El Amante, Argentina) –  6
XAVI SERRA (Ara, España) -
ERNESTO GARRATT (El Mercurio, Chile) -
NICK JAMES (Sight & Sound, England) -
SERGI SANCHEZ (La Razón, España) -
SARA BRITO (Público, España) -
SCOTT FOUNDAS (Film Comment, U.S.) -
SERGIO WOLF (BAFICI, Argentina) -
RUDIGER SUCHSLAND (FAZ / Negativ, Germany) – 7.3
ALVARO ARROBA (La Lectora Provisoria, Argentina) -
PABLO O. SCHOLZ (Clarín, Argentina) -
NANDO SALVA (El Periódico, España) -
PEDRO BUTCHER (Filme B / Folha de Sao Paulo, Brasil) -
GABRIELE BARRERA (Nick FilmTV / Best Movie / Cinecritica, Italy) -
PAMELA BIENZOBAS (Mabuse, Chile) -
MANU YAÑEZ (Fotogramas, España) -
GREGORY VALENS (Positif, France) -
CHRISTOPH HUBER (Die Presse, Austria) -
MARCELO ALDERETE (Mar del Plata Film Festival, Argentina) –  6
BELINDA VAN DE GRAAF (Trouw, Holanda) -
ARTHUR MAS (Independencia, France) -
MARTIAL PISANI (Independencia, France) -
CARLOS REVIRIEGO (El Cultural / Cahiers du cinéma, España) -
ALEJANDRO G. CALVO (SensaCine, España) –  8
ANCHALEE CHAIWORAPORN (Siam Rath, Image Magazine, Thailand) -

"Hanezu No Tsuki" Naomi Kawase (6.30) 22 votos [Competition]
FERNANDO GANZO (Lumiere, España) –  6
CARLOS HEREDERO (Cahiers du cinéma, España) - 7
LUCIANO MONTEAGUDO (Página12, Argentina) - 7
ROGER ALAN KOZA (La Voz del Interior / Con los ojos abiertos, Argentina) – 5.5
MARK PERANSON (Cinema Scope, Canada) -
EULALIA IGLESIAS (Rockdelux, Cahiers du cinéma, España) - 6
DIEGO BATLLE (La Nación / OtrosCines, Argentina) –  7.50
CRISTINA NORD (Die Tageszeitung, Germany) -
MARKUS KEUSCHNIGG (Die Presse, Austria) -
KONG RITHDEE (The Bangkok Post. Thailand) - 6
FRANCISCO FERREIRA (Expresso, Portugal) -
VIOLETA KOVACSICS (Diari de Tarragona, España) – 6.5
JAIME PENA (El Amante, Argentina y Cahiers du cinéma, España) –  7
OLIVIER PERE (Les Inrockuptibles, France) -
EUGENIO RENZI (Independencia, France) - 4.7
LUCIANO BARISONE (Duellanti / Panoramiches, Italy) –  8
CARLO CHATRIAN (Duellanti / Panoramiches, Italy) - 8.5
JOSE LUIS DE LORENZO (A Sala Llena, Argentina) -
FERNANDO JUAN LIMA (El Amante, Argentina) - 6
XAVI SERRA (Ara, España) -
ERNESTO GARRATT (El Mercurio, Chile) -
NICK JAMES (Sight & Sound, England) -
SERGI SANCHEZ (La Razón, España) - 5
SARA BRITO (Público, España) - 5
SCOTT FOUNDAS (Film Comment, U.S.) -
SERGIO WOLF (BAFICI, Argentina) -
RUDIGER SUCHSLAND (WAZ / Negativ, Germany) - 4
ALVARO ARROBA (La Lectora Provisoria, Argentina) -
PABLO O. SCHOLZ (Clarín, Argentina) - 6
NANDO SALVA (El Periódico, España) - 4
PEDRO BUTCHER (Filme B / Folha de Sao Paulo, Brasil) -
GABRIELE BARRERA (Nick FilmTV / Best Movie / Cinecritica, Italy) -
PAMELA BIENZOBAS (Mabuse, Chile) -
MANU YAÑEZ (Fotogramas, España) -
GREGORY VALENS (Positif, France) -
PAOLO BERTOLIN (Cineforum, Italia)  –  7
MARCELO ALDERETE (Mar del Plata Film Festival, Argentina) -
BELINDA VAN DE GRAAF (Trouw, Holanda) -
ARTHUR MAS (Independencia, France) -
MARTIAL PISANI (Independencia, France) -
CARLOS REVIRIEGO (El Cultural / Cahiers du cinéma, España) –  7
ALEJANDRO G. CALVO (SensaCine, España) - 5
ANCHALEE CHAIWORAPORN (Siam Rath, Image Magazine, Thailand) - 10
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
Jan Schulz-Ojala (Der Tagesspiegel, Germany) 2.5
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
JAIME PENA (El Amante, Argentina y Cahiers du cinéma, España) –  4
CARLO CHATRIAN (Duellanti / Panoramiches, Italy) –  6
ALVARO ARROBA (La Lectora Provisoria, Argentina) –  4.5
PAOLO BERTOLIN (Cineforum, Italia) - 6
CARLOS REVIRIEGO (El Cultural / Cahiers du cinéma, España) –  6

"The Island" Kamen Kalev (5.50) 2 votos [Quinzaine]
JAIME PENA (El Amante, Argentina y Cahiers du cinéma, España) –  3
CARLO CHATRIAN (Duellanti / Panoramiches, Italy) –  8

"Corpo celeste" Alice Rohrwacher (6.50) 2 votos [Quinzaine]
FERNANDO GANZO (Lumiere, España) –  6
LUCIANO BARISONE (Duellanti / Panoramiches, Italy) –  7

"O abismo prateado" Karim Aïnouz (5.91) 11 votos [Quinzaine]
CARLOS HEREDERO (Cahiers du cinéma, España) –  6
ROGER ALAN KOZA (La Voz del Interior / Con los ojos abiertos, Argentina) – 5.5
EULALIA IGLESIAS (Rockdelux, Cahiers du cinéma, España) –  6
DIEGO BATLLE (La Nación / OtrosCines, Argentina) – 6
JAIME PENA (El Amante, Argentina y Cahiers du cinéma, España) –  7.5
LUCIANO BARISONE (Duellanti / Panoramiches, Italy) –  5
CARLO CHATRIAN (Duellanti / Panoramiches, Italy) –  6.5
FERNANDO JUAN LIMA (El Amante, Argentina) –  7.50
PEDRO BUTCHER (Filme B / Folha de Sao Paulo, Brasil) – 6.5
MARCELO ALDERETE (Mar del Plata Film Festival, Argentina) –  2
CARLOS REVIRIEGO (El Cultural / Cahiers du cinéma, España) –  6.50

"Pater" Alain Cavalier (5.77) 22 votos [Competition]
FERNANDO GANZO (Lumiere, España) -
CARLOS HEREDERO (Cahiers du cinéma, España) -
LUCIANO MONTEAGUDO (Página12, Argentina) - 6
ROGER ALAN KOZA (La Voz del Interior / Con los ojos abiertos, Argentina) – 7.50
MARK PERANSON (Cinema Scope, Canada) -
EULALIA IGLESIAS (Rockdelux, Cahiers du cinéma, España) -
DIEGO BATLLE (La Nación / OtrosCines, Argentina) -  7
CRISTINA NORD (Die Tageszeitung, Germany) -
MARKUS KEUSCHNIGG (Die Presse, Austria) -
KONG RITHDEE (The Bangkok Post. Thailand) -  6.5
FRANCISCO FERREIRA (Expresso, Portugal) - 2
VIOLETA KOVACSICS (Diari de Tarragona, España) -
JAIME PENA (El Amante, Argentina y Cahiers du cinéma, España) –  5.50
OLIVIER PERE (Les Inrockuptibles, France) –  6
EUGENIO RENZI (Independencia, France) - 3
LUCIANO BARISONE (Duellanti / Panoramiches, Italy) –  6
CARLO CHATRIAN (Duellanti / Panoramiches, Italy) -
JOSE LUIS DE LORENZO (A Sala Llena, Argentina) -  8
FERNANDO JUAN LIMA (El Amante, Argentina) –  6
XAVI SERRA (Ara, España) -
ERNESTO GARRATT (El Mercurio, Chile) -
NICK JAMES (Sight & Sound, England) -
SERGI SANCHEZ (La Razón, España) - 5
SARA BRITO (Público, España) -
SCOTT FOUNDAS (Film Comment, U.S.) –  8
SERGIO WOLF (BAFICI, Argentina) -
RUDIGER SUCHSLAND (WAZ / Negativ, Germany) -
ALVARO ARROBA (La Lectora Provisoria, Argentina) –  6
PABLO O. SCHOLZ (Clarín, Argentina) - 5
NANDO SALVA (El Periódico, España) -
PEDRO BUTCHER (Filme B / Folha de Sao Paulo, Brasil) -  6.5
GABRIELE BARRERA (Nick FilmTV / Best Movie / Cinecritica, Italy) -
PAMELA BIENZOBAS (Mabuse, Chile) -  8
MANU YAÑEZ (Fotogramas, España) -
GREGORY VALENS (Positif, France) -
PAOLO BERTOLIN (Cineforum, Italia)  -  5.5
MARCELO ALDERETE (Mar del Plata Film Festival, Argentina) - 6
BELINDA VAN DE GRAAF (Trouw, Holanda) -
ARTHUR MAS (Independencia, France) -
MARTIAL PISANI (Independencia, France) -
CARLOS REVIRIEGO (El Cultural / Cahiers du cinéma, España) – 5.50
ALEJANDRO G. CALVO (SensaCine, España) –  5
ANCHALEE CHAIWORAPORN (Siam Rath, Image Magazine, Thailand) -  3
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
Jan Schulz-Ojala (Der Tagesspiegel, Germany) 2.5
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
DIEGO BATLLE (La Nación / OtrosCines, Argentina) –  8
CRISTINA NORD (Die Tageszeitung, Germany) – 6.9
JAIME PENA (El Amante, Argentina y Cahiers du cinéma, España) –  6
RUDIGER SUCHSLAND (WAZ / Negativ, Germany) –  7.3
MARCELO ALDERETE (Mar del Plata Film Festival, Argentina) –  2
Mike d'Angelo (AV Club, USA) 5.9

“Impardonnables” André Techine (4.97) 11 votos [Quinzaine]
FERNANDO GANZO (Lumiere, España) –  3.1416
CARLOS HEREDERO (Cahiers du cinéma, España) -  5
LUCIANO MONTEAGUDO (Página12, Argentina) –  5
EULALIA IGLESIAS (Rockdelux, Cahiers du cinéma, España) –  5
CRISTINA NORD (Die Tageszeitung, Germany) –  5
KONG RITHDEE (The Bangkok Post. Thailand) –  6
FRANCISCO FERREIRA (Expresso, Portugal) -  3
JAIME PENA (El Amante, Argentina y Cahiers du cinéma, España) – 6.5
CARLO CHATRIAN (Duellanti / Panoramiches, Italy) –  5
FERNANDO JUAN LIMA (El Amante, Argentina) – 6
CARLOS REVIRIEGO (El Cultural / Cahiers du cinéma, España) –  5
Mike d'Angelo (AV Club, USA) 3.8

“Le Havre” Aki Kaurismaki (8.72) 29 votos [Competition] FIPRESCI Price
FERNANDO GANZO (Lumiere, España) - 8.8
CARLOS HEREDERO (Cahiers du cinéma, España) – 9.9
LUCIANO MONTEAGUDO (Página12, Argentina) - 9
ROGER ALAN KOZA (La Voz del Interior / Con los ojos abiertos, Argentina) – 9
MARK PERANSON (Cinema Scope, Canada) -
EULALIA IGLESIAS (Rockdelux, Cahiers du cinéma, España) – 10
DIEGO BATLLE (La Nación / OtrosCines, Argentina) -10
CRISTINA NORD (Die Tageszeitung, Germany) –  8
MARKUS KEUSCHNIGG (Die Presse, Austria) -
KONG RITHDEE (The Bangkok Post. Thailand) -  7.5
FRANCISCO FERREIRA (Expresso, Portugal) -  7
VIOLETA KOVACSICS (Diari de Tarragona, España) -  9
JAIME PENA (El Amante, Argentina y Cahiers du cinéma, España) - 9.5
OLIVIER PERE (Les Inrockuptibles, France) - 8
EUGENIO RENZI (Independencia, France) -
LUCIANO BARISONE (Duellanti / Panoramiches, Italy) - 8
CARLO CHATRIAN (Duellanti / Panoramiches, Italy) - 9
JOSE LUIS DE LORENZO (A Sala Llena, Argentina) - 10
FERNANDO JUAN LIMA (El Amante, Argentina) - 10
XAVI SERRA (Ara, España) -
ERNESTO GARRATT (El Mercurio, Chile) -
NICK JAMES (Sight & Sound, England) -
SERGI SANCHEZ (La Razón, España) - 9
SARA BRITO (Público, España) – 8.8
SCOTT FOUNDAS (Film Comment, U.S.) -
SERGIO WOLF (BAFICI, Argentina) - 8
RUDIGER SUCHSLAND (WAZ / Negativ, Germany) -
ALVARO ARROBA (La Lectora Provisoria, Argentina) - 7.9
PABLO O. SCHOLZ (Clarín, Argentina) –  7
NANDO SALVA (El Periódico, España) – 8
PEDRO BUTCHER (Filme B / Folha de Sao Paulo, Brasil) -  8.5
GABRIELE BARRERA (Nick FilmTV / Best Movie / Cinecritica, Italy) -
PAMELA BIENZOBAS (Mabuse, Chile) -  8
MANU YAÑEZ (Fotogramas, España) -
GREGORY VALENS (Positif, France) -
PAOLO BERTOLIN (Cineforum, Italia) –  9.50
MARCELO ALDERETE (Mar del Plata Film Festival, Argentina) - 8
BELINDA VAN DE GRAAF (Trouw, Holanda) -
ARTHUR MAS (Independencia, France) -
MARTIAL PISANI (Independencia, France) -
CARLOS REVIRIEGO (El Cultural / Cahiers du cinéma, España) - 8.5
ALEJANDRO G. CALVO (SensaCine, España) – 9
ANCHALEE CHAIWORAPORN (Siam Rath, Image Magazine, Thailand) -  10
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
Jan Schulz-Ojala (Der Tagesspiegel, Germany) 7.5
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
CARLOS HEREDERO (Cahiers du cinéma, España) -  2
EULALIA IGLESIAS (Rockdelux, Cahiers du cinéma, España) –  5
DIEGO BATLLE (La Nación / OtrosCines, Argentina) -  5
KONG RITHDEE (The Bangkok Post. Thailand) –  4
JOSE LUIS DE LORENZO (A Sala Llena, Argentina) –  3
FERNANDO JUAN LIMA (El Amante, Argentina) –  2
MANU YAÑEZ (Fotogramas, España) -  2
ALEJANDRO G. CALVO (SensaCine, España) –  2

"Code Blue" Urszula Antonia (5.00) 2 votos [Quinzaine]
JOSE LUIS DE LORENZO (A Sala Llena, Argentina) -  4
FERNANDO JUAN LIMA (El Amante, Argentina) -  6

"Unlawful Killing" Keith Allen
Simon Gallagher (filmschoolrejects.com, UK) 6.25 B
Matt Holmes (Obsessedwithfilm.com, USA) 3

“Hors Satan” Bruno Dumont (5.97) 26 votos [Un Certain Regard]
FERNANDO GANZO (Lumiere, España) –  2.01
CARLOS HEREDERO (Cahiers du cinéma, España) –  3
LUCIANO MONTEAGUDO (Página12, Argentina) -  8
ROGER ALAN KOZA (La Voz del Interior / Con los ojos abiertos, Argentina) –  8
MARK PERANSON (Cinema Scope, Canada) -
EULALIA IGLESIAS (Rockdelux, Cahiers du cinéma, España) –  8
DIEGO BATLLE (La Nación / OtrosCines, Argentina) -  8
CRISTINA NORD (Die Tageszeitung, Germany) –  4.9
KONG RITHDEE (The Bangkok Post. Thailand) –  7
FRANCISCO FERREIRA (Expresso, Portugal) -  4
VIOLETA KOVACSICS (Diari de Tarragona, España) –  6
JAIME PENA (El Amante, Argentina y Cahiers du cinéma, España) –  4.5
EUGENIO RENZI (Independencia, France) -  2.4
LUCIANO BARISONE (Duellanti / Panoramiches, Italy) -  5
CARLO CHATRIAN (Duellanti / Panoramiches, Italy) –  7
JOSE LUIS DE LORENZO (A Sala Llena, Argentina) –  3
FERNANDO JUAN LIMA (El Amante, Argentina) –  8
SARA BRITO (Público, España) –  7.5
SCOTT FOUNDAS (Film Comment, U.S.) –  8
SERGIO WOLF (BAFICI, Argentina) –  8
RUDIGER SUCHSLAND (WAZ / Negativ, Germany) –  6.5
ALVARO ARROBA (La Lectora Provisoria, Argentina) –  2
PABLO O. SCHOLZ (Clarín, Argentina) – 6
MANU YAÑEZ (Fotogramas, España) -  7
MARCELO ALDERETE (Mar del Plata Film Festival, Argentina) –  7
CARLOS REVIRIEGO (El Cultural / Cahiers du cinéma, España) –  8.5
ALEJANDRO G. CALVO (SensaCine, España) -  6
Simon Gallagher (filmschoolrejects.com, UK) 0   a pointless and pretentious exercise
Kevin Jagernauth (Indiewire's The Playlist, USA) 1.8 D- Devilishly Dull The walkouts for “Hors Satan” started at the half hour mark and continued to be peppered through the film right up until about fifteen minutes from the end
Mike d'Angelo (AV Club, USA) 4.4 Welcome back, the Bruno Dumont I always kind of hated. Nice fakeout with HADEWIJCH, I totally fell for it.
  Indiewire:
Michael Giltz (The Huffington Post, USA) 5 2/4 (2 C-)
Rob Nelson (Variety, USA) 6.25 B
Guy Lodge (InContention.com, South Africa) 1.5 D+

“The Tree of Life” Terrence Malick (7.09) 30 votos [Competition] Palm d'Or
FERNANDO GANZO (Lumiere, España) – 6.666
CARLOS HEREDERO (Cahiers du cinéma, España) –  6.5
LUCIANO MONTEAGUDO (Página12, Argentina) -  6
ROGER ALAN KOZA (La Voz del Interior / Con los ojos abiertos, Argentina) –  7
MARK PERANSON (Cinema Scope, Canada) -
EULALIA IGLESIAS (Rockdelux, Cahiers du cinéma, España) – 1
DIEGO BATLLE (La Nación / OtrosCines, Argentina) –  8
CRISTINA NORD (Die Tageszeitung, Germany) –  6
MARKUS KEUSCHNIGG (Die Presse, Austria) -
KONG RITHDEE (The Bangkok Post. Thailand) –  7.5
FRANCISCO FERREIRA (Expresso, Portugal) - 5.01
VIOLETA KOVACSICS (Diari de Tarragona, España) –  7
JAIME PENA (El Amante, Argentina y Cahiers du cinéma, España) –  10
OLIVIER PERE (Les Inrockuptibles, France) -
EUGENIO RENZI (Independencia, France) -
LUCIANO BARISONE (Duellanti / Panoramiches, Italy) –  7
CARLO CHATRIAN (Duellanti / Panoramiches, Italy) –  7.5
JOSE LUIS DE LORENZO (A Sala Llena, Argentina) - 8
FERNANDO JUAN LIMA (El Amante, Argentina) –  10
XAVI SERRA (Ara, España) -
ERNESTO GARRATT (El Mercurio, Chile) -
NICK JAMES (Sight & Sound, England) -
SERGI SANCHEZ (La Razón, España) -  7
SARA BRITO (Público, España) – 6.9
SCOTT FOUNDAS (Film Comment, U.S.) –  10
SERGIO WOLF (BAFICI, Argentina) -
RUDIGER SUCHSLAND (WAZ / Negativ, Germany) – 9.2
ALVARO ARROBA (La Lectora Provisoria, Argentina) - 4.3
PABLO O. SCHOLZ (Clarín, Argentina) -  8
NANDO SALVA (El Periódico, España) - 6
PEDRO BUTCHER (Filme B / Folha de Sao Paulo, Brasil) –  8
GABRIELE BARRERA (Nick FilmTV / Best Movie / Cinecritica, Italy) -
PAMELA BIENZOBAS (Mabuse, Chile) -
MANU YAÑEZ (Fotogramas, España) - 6.9
ROBERT KOEHLER (CinemaScope, Variety. U.S.) –  3
PAOLO BERTOLIN (Cineforum, Italia) –  8
GREGORY VALENS (Positif, France) -
MARCELO ALDERETE (Mar del Plata Film Festival, Argentina) –  7
BELINDA VAN DE GRAAF (Trouw, Holanda) -
ARTHUR MAS (Independencia, France) -
MARTIAL PISANI (Independencia, France) -
CARLOS REVIRIEGO (El Cultural / Cahiers du cinéma, España) –  9.1
ALEJANDRO G. CALVO (SensaCine, España) –  9
ANCHALEE CHAIWORAPORN (Siam Rath, Image Magazine, Thailand) –  7
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
Jan Schulz-Ojala (Der Tagesspiegel, Germany) 2.5
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
FERNANDO GANZO (Lumiere, España) - 9
CARLOS HEREDERO (Cahiers du cinéma, España) - 3
LUCIANO MONTEAGUDO (Página12, Argentina) - 5
ROGER ALAN KOZA (La Voz del Interior / Con los ojos abiertos, Argentina) -
MARK PERANSON (Cinema Scope, Canada) -
EULALIA IGLESIAS (Rockdelux, Cahiers du cinéma, España) -
DIEGO BATLLE (La Nación / OtrosCines, Argentina) -  8
CRISTINA NORD (Die Tageszeitung, Germany) -
MARKUS KEUSCHNIGG (Die Presse, Austria) -
KONG RITHDEE (The Bangkok Post. Thailand) -  6.5
FRANCISCO FERREIRA (Expresso, Portugal) - 9
VIOLETA KOVACSICS (Diari de Tarragona, España) - 9
JAIME PENA (El Amante, Argentina y Cahiers du cinéma, España) –  8.8
OLIVIER PERE (Les Inrockuptibles, France) - 8
EUGENIO RENZI (Independencia, France) -
LUCIANO BARISONE (Duellanti / Panoramiches, Italy) –  5
CARLO CHATRIAN (Duellanti / Panoramiches, Italy) - 5
JOSE LUIS DE LORENZO (A Sala Llena, Argentina) - 4
FERNANDO JUAN LIMA (El Amante, Argentina) -
XAVI SERRA (Ara, España) -
ERNESTO GARRATT (El Mercurio, Chile) -
NICK JAMES (Sight & Sound, England) -
SERGI SANCHEZ (La Razón, España) - 4
SARA BRITO (Público, España) - 6
SCOTT FOUNDAS (Film Comment, USA) - 5
SERGIO WOLF (BAFICI, Argentina) -
RUDIGER SUCHSLAND (WAZ / Negativ, Germany) -
ALVARO ARROBA (La Lectora Provisoria, Argentina) -
PABLO O. SCHOLZ (Clarín, Argentina) - 0
NANDO SALVA (El Periódico, España) - 4
PEDRO BUTCHER (Filme B / Folha de Sao Paulo, Brasil) -  9
GABRIELE BARRERA (Nick FilmTV / Best Movie / Cinecritica, Italy) -
PAMELA BIENZOBAS (Mabuse, Chile) -
MANU YAÑEZ (Fotogramas, España) - 8
GREGORY VALENS (Positif, France) -
CHRISTOPH HUBER (Die Presse, Austria) -
MARCELO ALDERETE (Mar del Plata Film Festival, Argentina) -
BELINDA VAN DE GRAAF (Trouw, Holanda) -
ARTHUR MAS (Independencia, France) -
MARTIAL PISANI (Independencia, France) -
CARLOS REVIRIEGO (El Cultural / Cahiers du cinéma, España) –  9
ALEJANDRO G. CALVO (SensaCine, España) - 8
ANCHALEE CHAIWORAPORN (Siam Rath, Image Magazine, Thailand) - 1
Mike d'Angelo (AV Club, USA) 6.9
 Screen Daily:
Nick James (Sight & Sound, UK) 1
David Stratton (The Australian, Australia) 2.5
Derek Malcolm (London Evening, UK) 2.5
Jan Schulz-Ojala (Der Tagesspiegel, Germany) 1
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
Geoff Andrew (Time Out London, UK) 2
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
CARLOS HEREDERO (Cahiers du cinéma, España) -  7
ROGER ALAN KOZA (La Voz del Interior / Con los ojos abiertos, Argentina) –  7
CRISTINA NORD (Die Tageszeitung, Germany) –  6.50
VIOLETA KOVACSICS (Diari de Tarragona, España) -  6
JAIME PENA (El Amante, Argentina y Cahiers du cinéma, España) –  8
OLIVIER PERE (Les Inrockuptibles, France) –  8
LUCIANO BARISONE (Duellanti / Panoramiches, Italy) –  6
CARLO CHATRIAN (Duellanti / Panoramiches, Italy) -  7.5
MARCELO ALDERETE (Mar del Plata Film Festival, Argentina) –  6
CARLOS REVIRIEGO (El Cultural / Cahiers du cinéma, España) –  7
Mike d'Angelo (AV Club, USA) 5.9
Paul Martin (Indies Movies Online, USA) 6

“Duch, Master of the Forges of Hell” Rithy Panh (8.13) 13 votos [Special Screenings]
FERNANDO GANZO (Lumiere, España) –  8
CARLOS HEREDERO (Cahiers du cinéma, España) -  8.5
LUCIANO MONTEAGUDO (Página12, Argentina) –  9
CRISTINA NORD (Die Tageszeitung, Germany) –  6.3
KONG RITHDEE (The Bangkok Post. Thailand) -  6
FRANCISCO FERREIRA (Expresso, Portugal) – 10
VIOLETA KOVACSICS (Diari de Tarragona, España) -  7
JAIME PENA (El Amante, Argentina y Cahiers du cinéma, España) –  8.4
LUCIANO BARISONE (Duellanti / Panoramiches, Italy) –  9
CARLO CHATRIAN (Duellanti / Panoramiches, Italy) -  9
ALVARO ARROBA (La Lectora Provisoria, Argentina) –  9.5
PABLO O. SCHOLZ (Clarín, Argentina) –  7
MARCELO ALDERETE (Mar del Plata Film Festival, Argentina) –  8

"Martha Marcy May Marlene" Sean Durkin (6.07) 13 votos [Un Certain Regard] (Sundance)
IMDB (79 votes) 7.6
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
DIEGO BATLLE (La Nación / OtrosCines, Argentina) –  7
KONG RITHDEE (The Bangkok Post. Thailand) -  7.5
JAIME PENA (El Amante, Argentina y Cahiers du cinéma, España) –  5.9
OLIVIER PERE (Les Inrockuptibles, France) –  7
JOSE LUIS DE LORENZO (A Sala Llena, Argentina) –  6
FERNANDO JUAN LIMA (El Amante, Argentina) -  6.5
SERGI SANCHEZ (La Razón, España) -  7
SCOTT FOUNDAS (Film Comment, USA) –  6
NANDO SALVA (El Periódico, España) –  7
PAMELA BIENZOBAS (Mabuse, Chile) –  6
MANU YAÑEZ (Fotogramas, España) -  5
CARLOS REVIRIEGO (El Cultural / Cahiers du cinéma, España) –  3
ALEJANDRO G. CALVO (SensaCine, España) –  5
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
FERNANDO GANZO (Lumiere, España) –  4
CRISTINA NORD (Die Tageszeitung, Germany) –  6
CARLO CHATRIAN (Duellanti / Panoramiches, Italy) –  6.5
SERGIO WOLF (BAFICI, Argentina) -  3
PAMELA BIENZOBAS (Mabuse, Chile) –  6
CARLOS REVIRIEGO (El Cultural / Cahiers du cinéma, España) –  5
Eric Kohn (Indiewire, USA) 6.25 B

“Halt auf freier Strecke / Stopped on Tracks” Andreas Dresen (5.63) 9 votos [Un Certain Regard] Main Price UCR
CARLOS HEREDERO (Cahiers du cinéma, España) -  7
EULALIA IGLESIAS (Rockdelux, Cahiers du cinéma, España) – 6.5
DIEGO BATLLE (La Nación / OtrosCines, Argentina) –  5
CRISTINA NORD (Die Tageszeitung, Germany) – 6.5
KONG RITHDEE (The Bangkok Post. Thailand) -  6
JOSE LUIS DE LORENZO (A Sala Llena, Argentina) -  7
FERNANDO JUAN LIMA (El Amante, Argentina) -  4
RUDIGER SUCHSLAND (FAZ / Negativ, Germany) –  2.7
PABLO O. SCHOLZ (Clarín, Argentina) –  6
Sukhdev Sandhu (Telegraph, UK) 8

"The Artist" Michel Hazanaviciu  (5.66) 19 votos [Competition]
Mike d'Angelo (AV Club, USA) 5.2 Depicting the end of the silent era *as* a silent film is an inspired idea. Film itself is less inspired.
Matt Holmes (Obsessedwithfilm.com, USA) 9
FERNANDO GANZO (Lumiere, España) 6.5
CARLOS HEREDERO (Cahiers du cinéma, España) 4.5
LUCIANO MONTEAGUDO (Página12, Argentina)
ROGER ALAN KOZA (La Voz del Interior / Con los ojos abiertos, Argentina)
MARK PERANSON (Cinema Scope, Canada)
EULALIA IGLESIAS (Rockdelux, Cahiers du cinéma, España) –  6.5
DIEGO BATLLE (La Nación / OtrosCines, Argentina) 6
CRISTINA NORD (Die Tageszeitung, Germany)
MARKUS KEUSCHNIGG (Die Presse, Austria)
KONG RITHDEE (The Bangkok Post. Thailand) 5
FRANCISCO FERREIRA (Expresso, Portugal) 2
VIOLETA KOVACSICS (Diari de Tarragona, España) 5
JAIME PENA (El Amante, Argentina y Cahiers du cinéma, España) 5
OLIVIER PERE (Locarno Film Festival, Switzerland) 6
EUGENIO RENZI (Independencia, France)
LUCIANO BARISONE (Duellanti / Panoramiches, Italy) 6
CARLO CHATRIAN (Duellanti / Panoramiches, Italy)
JOSE LUIS DE LORENZO (A Sala Llena, Argentina)
FERNANDO JUAN LIMA (El Amante, Argentina)
XAVI SERRA (Ara, España)
ERNESTO GARRATT (El Mercurio, Chile)
NICK JAMES (Sight & Sound, England) –  7
SERGI SANCHEZ (La Razón, España) –  8
SARA BRITO (Público, España) 4.5
SCOTT FOUNDAS (Film Comment, USA)
SERGIO WOLF (BAFICI, Argentina) 5
RUDIGER SUCHSLAND (WAZ / Negativ, Germany)
ALVARO ARROBA (La Lectora Provisoria, Argentina)
PABLO O. SCHOLZ (Clarín, Argentina) 6
NANDO SALVA (El Periódico, España) 6
PEDRO BUTCHER (Filme B / Folha de Sao Paulo, Brasil) 5
GABRIELE BARRERA (Nick FilmTV / Best Movie / Cinecritica, Italy)
PAMELA BIENZOBAS (Mabuse, Chile) 6
MANU YAÑEZ (Fotogramas, España)
GREGORY VALENS (Positif, France)
CHRISTOPH HUBER (Die Presse, Austria)
MARCELO ALDERETE (Mar del Plata Film Festival, Argentina)
BELINDA VAN DE GRAAF (Trouw, Holanda)
ARTHUR MAS (Independencia, France)
MARTIAL PISANI (Independencia, France)
CARLOS REVIRIEGO (El Cultural / Cahiers du cinéma, España)
ALEJANDRO G. CALVO (SensaCine, España)
ANCHALEE CHAIWORAPORN (Siam Rath, Image Magazine, Thailand) 7
  PROMEDIO: 5.91 (17 votos) EN DESCENSO
David Calhoun (Time Out London, UK) 8
Simon Gallagher (filmschoolrejects.com, UK) 10 A+
Raffi Asdourian (The Film Stage, USA) 8 A-
 Screen Daily:
Nick James (Sight & Sound, UK) 7.5
David Stratton (The Australian, Australia) 9
Derek Malcolm (London Evening, UK) 5
Jan Schulz-Ojala (Der Tagesspiegel, Germany) 9
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
FERNANDO GANZO (Lumiere, España)
CARLOS HEREDERO (Cahiers du cinéma, España) 7.5
LUCIANO MONTEAGUDO (Página12, Argentina) –  8
ROGER ALAN KOZA (La Voz del Interior / Con los ojos abiertos, Argentina) – 8
MARK PERANSON (Cinema Scope, Canada)
EULALIA IGLESIAS (Rockdelux, Cahiers du cinéma, España) –  8
DIEGO BATLLE (La Nación / OtrosCines, Argentina) – 8
CRISTINA NORD (Die Tageszeitung, Germany) – 6.8
MARKUS KEUSCHNIGG (Die Presse, Austria)
KONG RITHDEE (The Bangkok Post. Thailand) –  7
FRANCISCO FERREIRA (Expresso, Portugal) 7
VIOLETA KOVACSICS (Diari de Tarragona, España) 8
JAIME PENA (El Amante, Argentina y Cahiers du cinéma, España) –  7.8
OLIVIER PERE (Locarno Film Festival, Switzerland) 8.5
EUGENIO RENZI (Independencia, France) – 7.1
LUCIANO BARISONE (Duellanti / Panoramiches, Italy) –  7
CARLO CHATRIAN (Duellanti / Panoramiches, Italy) –  8
JOSE LUIS DE LORENZO (A Sala Llena, Argentina) 8
FERNANDO JUAN LIMA (El Amante, Argentina) –  7
XAVI SERRA (Ara, España)
ERNESTO GARRATT (El Mercurio, Chile)
NICK JAMES (Sight & Sound, England) –  8
SERGI SANCHEZ (La Razón, España) –  9
SARA BRITO (Público, España) 9
SCOTT FOUNDAS (Film Comment, USA) –  10
SERGIO WOLF (BAFICI, Argentina) 8
RUDIGER SUCHSLAND (WAZ / Negativ, Germany) 8.1
ALVARO ARROBA (La Lectora Provisoria, Argentina) –  7
PABLO O. SCHOLZ (Clarín, Argentina) 7
NANDO SALVA (El Periódico, España) –  8
PEDRO BUTCHER (Filme B / Folha de Sao Paulo, Brasil) –  8
GABRIELE BARRERA (Nick FilmTV / Best Movie / Cinecritica, Italy)
PAMELA BIENZOBAS (Mabuse, Chile)
MANU YAÑEZ (Fotogramas, España) 8.50
GREGORY VALENS (Positif, France)
CHRISTOPH HUBER (Die Presse, Austria)
MARCELO ALDERETE (Mar del Plata Film Festival, Argentina) 8
BELINDA VAN DE GRAAF (Trouw, Holanda)
ARTHUR MAS (Independencia, France)
MARTIAL PISANI (Independencia, France)
CARLOS REVIRIEGO (El Cultural / Cahiers du cinéma, España) –  7.5
ALEJANDRO G. CALVO (SensaCine, España) –   8
ANCHALEE CHAIWORAPORN (Siam Rath, Image Magazine, Thailand) 8
Mike d'Angelo (AV Club, USA) 6.4
Kevin Jagernauth (Indiewire's The Playlist, USA) 7.5 B+
 Screen Daily:
Nick James (Sight & Sound, UK) 7.5
David Stratton (The Australian, Australia) 7.5
Derek Malcolm (London Evening, UK) 7.5
Jan Schulz-Ojala (Der Tagesspiegel, Germany) 7.5
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
ROGER ALAN KOZA (La Voz del Interior / Con los ojos abiertos, Argentina) –  6
JAIME PENA (El Amante, Argentina y Cahiers du cinéma, España) –  4.5
JOSE LUIS DE LORENZO (A Sala Llena, Argentina) –  3
FERNANDO JUAN LIMA (El Amante, Argentina) –  4
PAMELA BIENZOBAS (Mabuse, Chile) –  7.5
#Mike d'Angelo (AV Club, USA) 0
Michael Giltz (The Huffington Post, USA) 5 2/4

“Porfirio” Alejandro Landes (6.50) 4 votos [Quinzaine]
CARLOS HEREDERO (Cahiers du cinéma, España) –  6.5
ROGER ALAN KOZA (La Voz del Interior / Con los ojos abiertos, Argentina) –  6
LUCIANO BARISONE (Duellanti / Panoramiches, Italy) –  7
CARLO CHATRIAN (Duellanti / Panoramiches, Italy) –  6.5
Blake Williams (Ioncinema.com, Canada) 7

“17 filles” Delphine & Muriel Coulin (6.02) 6 votos [Semaine]
EULALIA IGLESIAS (Rockdelux, Cahiers du cinéma, España) –  5
DIEGO BATLLE (La Nación / OtrosCines, Argentina) –  7
JAIME PENA (El Amante, Argentina y Cahiers du cinéma, España) –  4
LUCIANO BARISONE (Duellanti / Panoramiches, Italy) –  7
CARLO CHATRIAN (Duellanti / Panoramiches, Italy) –  6
RUDIGER SUCHSLAND (FAZ / Negativ, Germany) -  7.3
Michael Giltz (The Huffington Post, USA) 5  2/4

“La Fin du silence” Roland Edzar (3.75) 4 votos [Quinzaine]
ROGER ALAN KOZA (La Voz del Interior / Con los ojos abiertos, Argentina) –  3
LUCIANO BARISONE (Duellanti / Panoramiches, Italy) –  5
MARCELO ALDERETE (Mar del Plata Film Festival, Argentina) – 1
CARLOS REVIRIEGO (El Cultural / Cahiers du cinéma, España) – 6
?? (Outnow, CH) 5
Michael Giltz (The Huffington Post, USA) 5 B- 2/4

“Les neiges du Kilimandjaro” Robert Guediguian (4.36) 7 votos [Un Certain Regard]
ROGER ALAN KOZA (La Voz del Interior / Con los ojos abiertos, Argentina) –  4.5
FRANCISCO FERREIRA (Expresso, Portugal) –  0
JAIME PENA (El Amante, Argentina y Cahiers du cinéma, España) –  3.5
CARLO CHATRIAN (Duellanti / Panoramiches, Italy) –  6.5
JOSE LUIS DE LORENZO (A Sala Llena, Argentina) –  7
FERNANDO JUAN LIMA (El Amante, Argentina) –  4
RUDIGER SUCHSLAND (WAZ / Negativ, Germany) –  5
Kevin Jagernauth (Indiewire's The Playlist, USA) 4 C+

“Wu Xia” Peter Ho Sun-Chan (5.78) 9 votos
FERNANDO GANZO (Lumiere, España) –  3
KONG RITHDEE (The Bangkok Post. Thailand) –  5
JAIME PENA (El Amante, Argentina y Cahiers du cinéma, España) –  6
CARLO CHATRIAN (Duellanti / Panoramiches, Italy) –  7
JOSE LUIS DE LORENZO (A Sala Llena, Argentina) –  6
FERNANDO JUAN LIMA (El Amante, Argentina) –  7
RUDIGER SUCHSLAND (WAZ / Negativ, Germany) –  7
MARCELO ALDERETE (Mar del Plata Film Festival, Argentina) –  4
ALEJANDRO G. CALVO (SensaCine, España) –  7
Kevin Jagernauth (Indiewire's The Playlist, USA) 4 C+
#Alex Billington (Firstshowing, USA) 9
Raffi Asdourian (The Film Stage, USA) 7.5 B+
  Indiewire:
Joshua Brunsting (Chase and the Whale, USA) 6.25 B
Michael Giltz (The Huffington Post, USA) 6.25 2.5/4 (5 B-)

“Michael” Markus Schleinzer (4.58) 25 votos [Competition]
FERNANDO GANZO (Lumiere, España) –  2
CARLOS HEREDERO (Cahiers du cinéma, España) 4
LUCIANO MONTEAGUDO (Página12, Argentina) –  7
ROGER ALAN KOZA (La Voz del Interior / Con los ojos abiertos, Argentina)
MARK PERANSON (Cinema Scope, Canada)
EULALIA IGLESIAS (Rockdelux, Cahiers du cinéma, España) –  6
DIEGO BATLLE (La Nación / OtrosCines, Argentina) –  6
CRISTINA NORD (Die Tageszeitung, Germany) –  5.8
MARKUS KEUSCHNIGG (Die Presse, Austria)
KONG RITHDEE (The Bangkok Post. Thailand) –  6.5
FRANCISCO FERREIRA (Expresso, Portugal) 0
VIOLETA KOVACSICS (Diari de Tarragona, España) 6
JAIME PENA (El Amante, Argentina y Cahiers du cinéma, España) –  4.5
OLIVIER PERE (Locarno Film Festival, Switzerland)
EUGENIO RENZI (Independencia, France) –  0
LUCIANO BARISONE (Duellanti / Panoramiches, Italy) –  1
CARLO CHATRIAN (Duellanti / Panoramiches, Italy) –  4
JOSE LUIS DE LORENZO (A Sala Llena, Argentina)
FERNANDO JUAN LIMA (El Amante, Argentina)
XAVI SERRA (Ara, España)
ERNESTO GARRATT (El Mercurio, Chile)
NICK JAMES (Sight & Sound, England) –  7
SERGI SANCHEZ (La Razón, España) –  4
SARA BRITO (Público, España) 6.8
SCOTT FOUNDAS (Film Comment, USA) –  9
SERGIO WOLF (BAFICI, Argentina)
RUDIGER SUCHSLAND (WAZ / Negativ, Germany) 7.8
ALVARO ARROBA (La Lectora Provisoria, Argentina) –  0
PABLO O. SCHOLZ (Clarín, Argentina)  -  8
NANDO SALVA (El Periódico, España) –  2
PEDRO BUTCHER (Filme B / Folha de Sao Paulo, Brasil) –  3
GABRIELE BARRERA (Nick FilmTV / Best Movie / Cinecritica, Italy)
PAMELA BIENZOBAS (Mabuse, Chile)
MANU YAÑEZ (Fotogramas, España)
GREGORY VALENS (Positif, France)
CHRISTOPH HUBER (Die Presse, Austria)
MARCELO ALDERETE (Mar del Plata Film Festival, Argentina)
BELINDA VAN DE GRAAF (Trouw, Holanda)
ARTHUR MAS (Independencia, France)
MARTIAL PISANI (Independencia, France)
CARLOS REVIRIEGO (El Cultural / Cahiers du cinéma, España) –  6
ALEJANDRO G. CALVO (SensaCine, España) –  3
ANCHALEE CHAIWORAPORN (Siam Rath, Image Magazine, Thailand) 5
  PROMEDIO: 4.54 (23 votos) EN ASCENSO
 Screen Daily:
Nick James (Sight & Sound, UK) 7.5
David Stratton (The Australian, Australia) 2.5
Derek Malcolm (London Evening, UK) 5
Jan Schulz-Ojala (Der Tagesspiegel, Germany) 5
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
CARLOS HEREDERO (Cahiers du cinéma, España) 8
LUCIANO MONTEAGUDO (Página12, Argentina) 7
EULALIA IGLESIAS (Rockdelux, Cahiers du cinéma, España) 6.5
DIEGO BATLLE (La Nación / OtrosCines, Argentina) 7
CRISTINA NORD (Die Tageszeitung, Germany) 7
KONG RITHDEE (The Bangkok Post. Thailand) –  7
VIOLETA KOVACSICS (Diari de Tarragona, España) -  7
JAIME PENA (El Amante, Argentina y Cahiers du cinéma, España) –  6
FERNANDO JUAN LIMA (El Amante, Argentina) -  6.5
SERGI SANCHEZ (La Razón, España) 7
SARA BRITO (Público, España) 8
SCOTT FOUNDAS (Film Comment, USA) –  5
ALVARO ARROBA (La Lectora Provisoria, Argentina) –  7
PABLO O. SCHOLZ (Clarín, Argentina) 7
PEDRO BUTCHER (Filme B / Folha de Sao Paulo, Brasil) –  6.5
PAMELA BIENZOBAS (Mabuse, Chile) –  5.5
ALEJANDRO G. CALVO (SensaCine, España) –  6
Eric Kohn (Indiewire, USA) 8 A-

“Pirates of the Caribbean: On Stranger Tides” Rob Marshall (4.32) 6 votos [Special Screenings]
DIEGO BATLLE (La Nación / OtrosCines, Argentina) 7
JOSE LUIS DE LORENZO (A Sala Llena, Argentina) 4
SERGI SANCHEZ (La Razón, España) 3
SARA BRITO (Público, España) 4
RUDIGER SUCHSLAND (WAZ / Negativ, Germany) 6.9
ALEJANDRO G. CALVO (SensaCine, España) 1
David Calhoun (Time Out London, UK) 2
Matt Holmes (Obsessedwithfilm.com, USA) 2
Simon Gallagher (filmschoolrejects.com, UK) 3 C
Sukhdev Sandhu (Telegraph, UK) 4
Simon Reynolds (Digital Spy, UK) 6
Anne Thompson (Indiewire, USA) 5 B-

“Tous au Lazarc” Christian Rouaud (4.66) 3 votos [Special Screenings]
JAIME PENA (El Amante, Argentina y Cahiers du cinéma, España) 5
LUCIANO BARISONE (Duellanti / Panoramiches, Italy) 5
CARLO CHATRIAN (Duellanti / Panoramiches, Italy) 4

“Eldfjall” Rúnar Rúnarsson [Quinzaine]
ARTHUR MAS (Independencia, France) -  5.50

“Hearat Shulayim / Footnote” Joseph Cedar (5,21) 29 votos [Competition] Best Screenplay
Mike d'Angelo (AV Club, USA) 5.6
FERNANDO GANZO (Lumiere, España) 5
CARLOS HEREDERO (Cahiers du cinéma, España) 5
LUCIANO MONTEAGUDO (Página12, Argentina) 4
ROGER ALAN KOZA (La Voz del Interior / Con los ojos abiertos, Argentina) 6
MARK PERANSON (Cinema Scope, Canada)
EULALIA IGLESIAS (Rockdelux, Cahiers du cinéma, España)
DIEGO BATLLE (La Nación / OtrosCines, Argentina) 5.5
CRISTINA NORD (Die Tageszeitung, Germany) 6.5
MARKUS KEUSCHNIGG (Die Presse, Austria)
KONG RITHDEE (The Bangkok Post. Thailand) 6
FRANCISCO FERREIRA (Expresso, Portugal) 0
VIOLETA KOVACSICS (Diari de Tarragona, España) 5
JAIME PENA (El Amante, Argentina y Cahiers du cinéma, España) 7.5
OLIVIER PERE (Locarno Film Festival, Switzerland)
EUGENIO RENZI (Independencia, France) 4.8
LUCIANO BARISONE (Duellanti / Panoramiches, Italy) 6
CARLO CHATRIAN (Duellanti / Panoramiches, Italy)
JOSE LUIS DE LORENZO (A Sala Llena, Argentina) 7
FERNANDO JUAN LIMA (El Amante, Argentina) 5.5
XAVI SERRA (Ara, España)
ERNESTO GARRATT (El Mercurio, Chile)
NICK JAMES (Sight & Sound, England) 4
SERGI SANCHEZ (La Razón, España) 6.5
SARA BRITO (Público, España)
SCOTT FOUNDAS (Film Comment, USA) 7
SERGIO WOLF (BAFICI, Argentina) 3
RUDIGER SUCHSLAND (WAZ / Negativ, Germany) 7.5
ALVARO ARROBA (La Lectora Provisoria, Argentina) 7
PABLO O. SCHOLZ (Clarín, Argentina) 5
NANDO SALVA (El Periódico, España) 6.5
PEDRO BUTCHER (Filme B / Folha de Sao Paulo, Brasil) 2
GABRIELE BARRERA (Nick FilmTV / Best Movie / Cinecritica, Italy)
PAMELA BIENZOBAS (Mabuse, Chile) 4.25
MANU YAÑEZ (Fotogramas, España) 5
GREGORY VALENS (Positif, France)
CHRISTOPH HUBER (Die Presse, Austria)
MARCELO ALDERETE (Mar del Plata Film Festival, Argentina)
BELINDA VAN DE GRAAF (Trouw, Holanda) 4
ARTHUR MAS (Independencia, France)
MARTIAL PISANI (Independencia, France)
CARLOS REVIRIEGO (El Cultural / Cahiers du cinéma, España) 6.5
ALEJANDRO G. CALVO (SensaCine, España) 5
ANCHALEE CHAIWORAPORN (Siam Rath, Image Magazine, Thailand) 4
  PROMEDIO: 5.21 (29 votos) EN DESCENSO
Eric Kohn (Indiewire, USA) 7.5 B+
 Screen Daily:
Nick James (Sight & Sound, UK) 2.5
David Stratton (The Australian, Australia) 7.5
Derek Malcolm (London Evening, UK) 7.5
Jan Schulz-Ojala (Der Tagesspiegel, Germany) 7.5
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
OLIVIER PERE (Locarno Film Festival, Switzerland) 2
FERNANDO JUAN LIMA (El Amante, Argentina) 6.50
RUDIGER SUCHSLAND (WAZ / Negativ, Germany) 7
Michael Giltz (The Huffington Post, USA) 5 2/4

“Arirang” Kim Ki-duk (3.89) 14 votos [Un Certain Regard] Main Price UCR
Mike d'Angelo (AV Club, USA) 0.7
FERNANDO GANZO (Lumiere, España) 1
CARLOS HEREDERO (Cahiers du cinéma, España) 0
DIEGO BATLLE (La Nación / OtrosCines, Argentina) 3
KONG RITHDEE (The Bangkok Post. Thailand) 4
VIOLETA KOVACSICS (Diari de Tarragona, España) 1
JOSE LUIS DE LORENZO (A Sala Llena, Argentina) 6
FERNANDO JUAN LIMA (El Amante, Argentina) 4
NICK JAMES (Sight & Sound, England) – 3
RUDIGER SUCHSLAND (WAZ / Negativ, Germany) 6.5
PABLO O. SCHOLZ (Clarín, Argentina) 4
PEDRO BUTCHER (Filme B / Folha de Sao Paulo, Brasil) 5
PAMELA BIENZOBAS (Mabuse, Chile) 3
MARCELO ALDERETE (Mar del Plata Film Festival, Argentina) 5
BELINDA VAN DE GRAAF (Trouw, Holanda) 9
Eric Kohn (Indiewire, USA) 8 A-
Raffi Asdourian (The Film Stage, USA) 4 C+

“Toomelah” Ivan Sen (3.00) 3 votos [Un Certain Regard]
JOSE LUIS DE LORENZO (A Sala Llena, Argentina) 3
FERNANDO JUAN LIMA (El Amante, Argentina) 3
SERGIO WOLF (BAFICI, Argentina) 3
Guy Lodge (InContention.com, South Africa) 5 B-

“Miss Bala” Gerardo Naranjo (5.68) 19 votos [Un Certain Regard]
FERNANDO GANZO (Lumiere, España) – 6
CARLOS HEREDERO (Cahiers du cinéma, España)
LUCIANO MONTEAGUDO (Página12, Argentina) –  6
ROGER ALAN KOZA (La Voz del Interior / Con los ojos abiertos, Argentina) – 5.50
MARK PERANSON (Cinema Scope, Canada)
EULALIA IGLESIAS (Rockdelux, Cahiers du cinéma, España)
DIEGO BATLLE (La Nación / OtrosCines, Argentina) – 6
CRISTINA NORD (Die Tageszeitung, Germany) – 2
MARKUS KEUSCHNIGG (Die Presse, Austria)
KONG RITHDEE (The Bangkok Post, Thailand) – 7
FRANCISCO FERREIRA (Expresso, Portugal)
VIOLETA KOVACSICS (Diari de Tarragona, España)
JAIME PENA (El Amante, Argentina y Cahiers du cinéma, España) – 4.9
OLIVIER PERE (Locarno Film Festival, Switzerland)
EUGENIO RENZI (Independencia, France)
LUCIANO BARISONE (Duellanti / Panoramiches, Italy) – 5
CARLO CHATRIAN (Duellanti / Panoramiches, Italy)
JOSE LUIS DE LORENZO (A Sala Llena, Argentina) – 6
FERNANDO JUAN LIMA (El Amante, Argentina) – 5.5
XAVI SERRA (Ara, España)
ERNESTO GARRATT (El Mercurio, Chile)
NICK JAMES (Sight & Sound, England) – 7
SERGI SANCHEZ (La Razón, España)
SARA BRITO (Público, España)
SCOTT FOUNDAS (Film Comment, USA) – 6
SERGIO WOLF (BAFICI, Argentina)
RUDIGER SUCHSLAND (WAZ / Negativ, Germany) 7.5
ALVARO ARROBA (La Lectora Provisoria, Argentina) – 5.5
PABLO O. SCHOLZ (Clarín, Argentina) – 7
NANDO SALVA (El Periódico, España)
PEDRO BUTCHER (Filme B / Folha de Sao Paulo, Brasil)
GABRIELE BARRERA (Nick FilmTV / Best Movie / Cinecritica, Italy)
PAMELA BIENZOBAS (Mabuse, Chile)
MANU YAÑEZ (Fotogramas, España) 6
GREGORY VALENS (Positif, France)
CHRISTOPH HUBER (Die Presse, Austria)
MARCELO ALDERETE (Mar del Plata Film Festival, Argentina) – 2
BELINDA VAN DE GRAAF (Trouw, Holanda)
ARTHUR MAS (Independencia, France)
MARTIAL PISANI (Independencia, France)
CARLOS REVIRIEGO (El Cultural / Cahiers du cinéma, España) – 7
ALEJANDRO G. CALVO (SensaCine, España) –  6
ANCHALEE CHAIWORAPORN (Siam Rath, Image Magazine, Thailand)
  PROMEDIO: 5.66 (18 votos) EN ASCENSO
Mike d'Angelo (AV Club, USA) 7.9
Simon Gallagher (filmschoolrejects.com, UK) 6.25 B
Peter Willis (Obsessedwithfilm.com, USA) 8
Kevin Jagernauth (Indiewire's The Playlist, USA) 8 A-
#Alex Billington (Firstshowing, USA) 9
Raffi Asdourian (The Film Stage, USA) 7.5 B+

“Jeanne Captive” Philippe Ramos (5.39) 11 votos [Quinzaine]
FERNANDO GANZO (Lumiere, España) 2
CARLOS HEREDERO (Cahiers du cinéma, España) 6
EULALIA IGLESIAS (Rockdelux, Cahiers du cinéma, España) 7.5
DIEGO BATLLE (La Nación / OtrosCines, Argentina) 7
VIOLETA KOVACSICS (Diari de Tarragona, España) 6
JAIME PENA (El Amante, Argentina y Cahiers du cinéma, España) 5.9
CARLO CHATRIAN (Duellanti / Panoramiches, Italy) 4
ALVARO ARROBA (La Lectora Provisoria, Argentina) 4.5
PEDRO BUTCHER (Filme B / Folha de Sao Paulo, Brasil) 4
ARTHUR MAS (Independencia, France) 4.9
CARLOS REVIRIEGO (El Cultural / Cahiers du cinéma, España) 7.5
Blake Williams (Ioncinema.com, Canada) 4
Paul Martin (Indies Movies Online, USA) 4
Michael Giltz (The Huffington Post, USA) 6.25 B- 2.5/4

“Michel Petrucciani” Michael Radford (6.89) 7 votos [Special Screenings]
EULALIA IGLESIAS (Rockdelux, Cahiers du cinéma, España) 5.5
KONG RITHDEE (The Bangkok Post. Thailand) 7
LUCIANO BARISONE (Duellanti / Panoramiches, Italy) 7
CARLO CHATRIAN (Duellanti / Panoramiches, Italy) 7
FERNANDO JUAN LIMA (El Amante, Argentina) –  8
RUDIGER SUCHSLAND (FAZ / Negativ, Germany) –  7
PAMELA BIENZOBAS (Mabuse, Chile) –  6.7
	  Indiewire:
Michael Giltz (The Huffington Post, USA) 6.25 2.5/4 (2 C-)

“The Other Side of Sleep” Rebecca Daly (3,00) 4 votos [Quinzaine]
OLIVIER PERE (Locarno Film Festival, Switzerland) 3
CARLO CHATRIAN (Duellanti / Panoramiches, Italy) 2
SERGIO WOLF (BAFICI, Argentina) –  5
MARCELO ALDERETE (Mar del Plata Film Festival, Argentina) 2
James Rocchi (MSN Movies, Indiewire's The Playlist, USA) Memory-and-murder tale is well-shot, well-acted, Arnold-influenced ... but lacks the necessary drive of story.
Emma Rowley (Indies Movies Online, USA) 6

“Las Acacias” Pablo Giorgelli (6.86) 9 votos [Semaine] Camera d'Or, Soutien ACID/CCAS and the Prix OFAJ de la (Toute) jeune Critique
CARLOS HEREDERO (Cahiers du cinéma, España) 6.5
LUCIANO MONTEAGUDO (Página12, Argentina) 7
ROGER ALAN KOZA (La Voz del Interior / Con los ojos abiertos, Argentina) 7
DIEGO BATLLE (La Nación / OtrosCines, Argentina) 7.5
JAIME PENA (El Amante, Argentina y Cahiers du cinéma, España) –  4.7
LUCIANO BARISONE (Duellanti / Panoramiches, Italy) 8
FERNANDO JUAN LIMA (El Amante, Argentina) –  8
PABLO O. SCHOLZ (Clarín, Argentina) 7
MARCELO ALDERETE (Mar del Plata Film Festival, Argentina) –  6

“Habemus Papam” Nanni Moretti (6.45) 29 votos [Competition]
FERNANDO GANZO (Lumiere, España) – 8
CARLOS HEREDERO (Cahiers du cinéma, España) – 6
LUCIANO MONTEAGUDO (Página12, Argentina) – 8
ROGER ALAN KOZA (La Voz del Interior / Con los ojos abiertos, Argentina)
MARK PERANSON (Cinema Scope, Canada)
EULALIA IGLESIAS (Rockdelux, Cahiers du cinéma, España) – 7.5
DIEGO BATLLE (La Nación / OtrosCines, Argentina) – 8
CRISTINA NORD (Die Tageszeitung, Germany) – 7.2
MARKUS KEUSCHNIGG (Die Presse, Austria)
KONG RITHDEE (The Bangkok Post. Thailand) – 6.5
FRANCISCO FERREIRA (Expresso, Portugal)
VIOLETA KOVACSICS (Diari de Tarragona, España) – 5
JAIME PENA (El Amante, Argentina y Cahiers du cinéma, España) – 9
OLIVIER PERE (Locarno Film Festival, Switzerland) – 1
EUGENIO RENZI (Independencia, France) – 5.1
LUCIANO BARISONE (Duellanti / Panoramiches, Italy)
CARLO CHATRIAN (Duellanti / Panoramiches, Italy) – 8.5
JOSE LUIS DE LORENZO (A Sala Llena, Argentina) – 8
FERNANDO JUAN LIMA (El Amante, Argentina) – 9
XAVI SERRA (Ara, España)
ERNESTO GARRATT (El Mercurio, Chile)
NICK JAMES (Sight & Sound, England) – 5
SERGI SANCHEZ (La Razón, España) – 7
SARA BRITO (Público, España) – 5.9
SCOTT FOUNDAS (Film Comment, USA) – 7
SERGIO WOLF (BAFICI, Argentina)
RUDIGER SUCHSLAND (WAZ / Negativ, Germany) – 1
ALVARO ARROBA (La Lectora Provisoria, Argentina) – 9
PABLO O. SCHOLZ (Clarín, Argentina) – 6
NANDO SALVA (El Periódico, España) – 7
PEDRO BUTCHER (Filme B / Folha de Sao Paulo, Brasil) – 6
GABRIELE BARRERA (Nick FilmTV / Best Movie / Cinecritica, Italy)
PAMELA BIENZOBAS (Mabuse, Chile) – 7.25
MANU YAÑEZ (Fotogramas, España) 6
GREGORY VALENS (Positif, France)
CHRISTOPH HUBER (Die Presse, Austria)
MARCELO ALDERETE (Mar del Plata Film Festival, Argentina)
BELINDA VAN DE GRAAF (Trouw, Holanda) – 7
ARTHUR MAS (Independencia, France)
MARTIAL PISANI (Independencia, France)
CARLOS REVIRIEGO (El Cultural / Cahiers du cinéma, España) – 6
ALEJANDRO G. CALVO (SensaCine, España) – 3
ANCHALEE CHAIWORAPORN (Siam Rath, Image Magazine, Thailand) 7
  PROMEDIO: 6.45 (29 votos) EN ASCENSO
Mike d'Angelo (AV Club, USA) 6
Simon Gallagher (filmschoolrejects.com, UK) 7.5 B+
David Calhoun (Time Out London, UK) 6
Eric Kohn (Indiewire, USA) 4 C+
 Screen Daily:
Nick James (Sight & Sound, UK) 5
David Stratton (The Australian, Australia) 7.5
Derek Malcolm (London Evening, UK) 5
Jan Schulz-Ojala (Der Tagesspiegel, Germany) 7.5
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
CRISTINA NORD (Die Tageszeitung, Germany) 7
ARTHUR MAS & MARTIAL PISANI (Independencia, France) 6.2
James Rocchi (MSN Movies, Indiewire's The Playlist, USA) Cloying too-cute cartoony comedy; from France/Belgium; I think it gave everyone in the Quinzane theater diabetes.
Blake Williams (Ioncinema.com, Canada) 5
Michael Giltz (The Huffington Post, USA) 7.5 3/4

“Labrador” Frederikke Aspock (3.17) 3 votos  [Special Screenings]
ROGER ALAN KOZA (La Voz del Interior / Con los ojos abiertos, Argentina) 4.5
ALVARO ARROBA (La Lectora Provisoria, Argentina) 1
PABLO O. SCHOLZ (Clarín, Argentina) 4

“Bollywood”  R. Omprakash Mehra, Jeffrey Zimbalis (2.00) 2 votos  [Special Screenings]
FERNANDO GANZO (Lumiere, España) – 0
LUCIANO BARISONE (Duellanti / Panoramiches, Italy) – 4
Mayer Nissim (Digital Spy, UK) 6

“La guerre est declarée” Valérie Donzelli (6,73) 11 votos [Semaine]
FERNANDO GANZO (Lumiere, España) 8.5
EULALIA IGLESIAS (Rockdelux, Cahiers du cinéma, España) 7.5
VIOLETA KOVACSICS (Diari de Tarragona, España) 5
JAIME PENA (El Amante, Argentina y Cahiers du cinéma, España) 7
EUGENIO RENZI (Independencia, France) 8
LUCIANO BARISONE (Duellanti / Panoramiches, Italy) 6
FERNANDO JUAN LIMA (El Amante, Argentina) 6
SCOTT FOUNDAS (Film Comment, USA) 4
ALVARO ARROBA (La Lectora Provisoria, Argentina) –  7.5
PAMELA BIENZOBAS (Mabuse, Chile) 7.5
ALEJANDRO G. CALVO (SensaCine, España) –  7

“Trabalhar cansa / Hard Labor” Marco Dutra, Juliana Rojas (6,425) 12 votos [Un Certain Regard]
FERNANDO GANZO (Lumiere, España)
CARLOS HEREDERO (Cahiers du cinéma, España)
LUCIANO MONTEAGUDO (Página12, Argentina) 6
ROGER ALAN KOZA (La Voz del Interior / Con los ojos abiertos, Argentina) 6
MARK PERANSON (Cinema Scope, Canada)
EULALIA IGLESIAS (Rockdelux, Cahiers du cinéma, España)
DIEGO BATLLE (La Nación / OtrosCines, Argentina) 6
CRISTINA NORD (Die Tageszeitung, Germany)
MARKUS KEUSCHNIGG (Die Presse, Austria)
KONG RITHDEE (The Bangkok Post. Thailand) 6.5
FRANCISCO FERREIRA (Expresso, Portugal)
VIOLETA KOVACSICS (Diari de Tarragona, España)
JAIME PENA (El Amante, Argentina y Cahiers du cinéma, España) 6.1
OLIVIER PERE (Locarno Film Festival, Switzerland)
EUGENIO RENZI (Independencia, France)
LUCIANO BARISONE (Duellanti / Panoramiches, Italy) 7
CARLO CHATRIAN (Duellanti / Panoramiches, Italy) 7.5
JOSE LUIS DE LORENZO (A Sala Llena, Argentina) 7
FERNANDO JUAN LIMA (El Amante, Argentina) 7
XAVI SERRA (Ara, España)
ERNESTO GARRATT (El Mercurio, Chile)
NICK JAMES (Sight & Sound, England)
SERGI SANCHEZ (La Razón, España)
SARA BRITO (Público, España)
SCOTT FOUNDAS (Film Comment, USA)
SERGIO WOLF (BAFICI, Argentina)
RUDIGER SUCHSLAND (Germany)
ALVARO ARROBA (La Lectora Provisoria, Argentina)
PABLO O. SCHOLZ (Clarín, Argentina)
NANDO SALVA (El Periódico, España)
PEDRO BUTCHER (Filme B / Folha de Sao Paulo, Brasil) 6
GABRIELE BARRERA (Nick FilmTV / Best Movie / Cinecritica, Italy)
PAMELA BIENZOBAS (Mabuse, Chile)
MANU YAÑEZ (Fotogramas, España)
GREGORY VALENS (Positif, France)
CHRISTOPH HUBER (Die Presse, Austria)
MARCELO ALDERETE (Mar del Plata Film Festival, Argentina)
BELINDA VAN DE GRAAF (Trouw, Holanda)
ARTHUR MAS (Independencia, France)
MARTIAL PISANI (Independencia, France)
CARLOS REVIRIEGO (El Cultural / Cahiers du cinéma, España) 6
ALEJANDRO G. CALVO (SensaCine, España) 6
ANCHALEE CHAIWORAPORN (Siam Rath, Image Magazine, Thailand)
  PROMEDIO: 6,425 (12 votos)
Paul Martin (Indies Movies Online, USA) 8

“Polisse” Maiwenn Le Besco (2,95) 28 votos [Competition] Special Jury Price
FERNANDO GANZO (Lumiere, España) 0
CARLOS HEREDERO (Cahiers du cinéma, España) 5
LUCIANO MONTEAGUDO (Página12, Argentina) 1
ROGER ALAN KOZA (La Voz del Interior / Con los ojos abiertos, Argentina)
MARK PERANSON (Cinema Scope, Canada)
EULALIA IGLESIAS (Rockdelux, Cahiers du cinéma, España) 3
DIEGO BATLLE (La Nación / OtrosCines, Argentina) 4
CRISTINA NORD (Die Tageszeitung, Germany) 3
MARKUS KEUSCHNIGG (Die Presse, Austria)
KONG RITHDEE (The Bangkok Post. Thailand) 5
FRANCISCO FERREIRA (Expresso, Portugal) 0
VIOLETA KOVACSICS (Diari de Tarragona, España) 2
JAIME PENA (El Amante, Argentina y Cahiers du cinéma, España) 3
OLIVIER PERE (Locarno Film Festival, Switzerland)
EUGENIO RENZI (Independencia, France) 2.7
LUCIANO BARISONE (Duellanti / Panoramiches, Italy) 4
CARLO CHATRIAN (Duellanti / Panoramiches, Italy)
JOSE LUIS DE LORENZO (A Sala Llena, Argentina) 1
FERNANDO JUAN LIMA (El Amante, Argentina) 2
XAVI SERRA (Ara, España)
ERNESTO GARRATT (El Mercurio, Chile)
NICK JAMES (Sight & Sound, England) 4
SERGI SANCHEZ (La Razón, España) 0
SARA BRITO (Público, España) 1
SCOTT FOUNDAS (Film Comment, USA) 0
SERGIO WOLF (BAFICI, Argentina)
RUDIGER SUCHSLAND (WAZ, Negativ, Germany) 1
ALVARO ARROBA (La Lectora Provisoria, Argentina) 0
PABLO O. SCHOLZ (Clarín, Argentina) 4
NANDO SALVA (El Periódico, España) 0
PEDRO BUTCHER (Filme B / Folha de Sao Paulo, Brasil) 4
GABRIELE BARRERA (Nick FilmTV / Best Movie / Cinecritica, Italy)
PAMELA BIENZOBAS (Mabuse, Chile)
MANU YAÑEZ (Fotogramas, España) 6
GREGORY VALENS (Positif, France)
CHRISTOPH HUBER (Die Presse, Austria)
MARCELO ALDERETE (Mar del Plata Film Festival, Argentina)
BELINDA VAN DE GRAAF (Trouw, Holanda) 8
ARTHUR MAS (Independencia, France)
MARTIAL PISANI (Independencia, France)
CARLOS REVIRIEGO (El Cultural / Cahiers du cinéma, España) 7
ALEJANDRO G. CALVO (SensaCine, España) 6
ANCHALEE CHAIWORAPORN (Siam Rath, Image Magazine, Thailand) 5
  PROMEDIO: 2.95 (28 votos) EN ASCENSO
 Screen Daily:
Nick James (Sight & Sound, UK) 5
David Stratton (The Australian, Australia) 7.5
Derek Malcolm (London Evening, UK) 5
Jan Schulz-Ojala (Der Tagesspiegel, Germany) 2.5
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
FERNANDO GANZO (Lumiere, España) 8
CARLOS HEREDERO (Cahiers du cinéma, España) 8
LUCIANO MONTEAGUDO (Página12, Argentina) 7
ROGER ALAN KOZA (La Voz del Interior / Con los ojos abiertos, Argentina) 7.5
MARK PERANSON (Cinema Scope, Canada)
EULALIA IGLESIAS (Rockdelux, Cahiers du cinéma, España) 6
DIEGO BATLLE (La Nación / OtrosCines, Argentina) 7
CRISTINA NORD (Die Tageszeitung, Germany) 6.8
MARKUS KEUSCHNIGG (Die Presse, Austria)
KONG RITHDEE (The Bangkok Post. Thailand) 6
FRANCISCO FERREIRA (Expresso, Portugal) 6.69
VIOLETA KOVACSICS (Diari de Tarragona, España) 8
JAIME PENA (El Amante, Argentina y Cahiers du cinéma, España) 6.2
OLIVIER PERE (Locarno Film Festival, Switzerland)
EUGENIO RENZI (Independencia, France) 7.1
LUCIANO BARISONE (Duellanti / Panoramiches, Italy) 8
CARLO CHATRIAN (Duellanti / Panoramiches, Italy)
JOSE LUIS DE LORENZO (A Sala Llena, Argentina) 4
FERNANDO JUAN LIMA (El Amante, Argentina) 7.5
XAVI SERRA (Ara, España)
ERNESTO GARRATT (El Mercurio, Chile)
NICK JAMES (Sight & Sound, England)
SERGI SANCHEZ (La Razón, España) 6
SARA BRITO (Público, España) 6.8
SCOTT FOUNDAS (Film Comment, USA)
SERGIO WOLF (BAFICI, Argentina)
RUDIGER SUCHSLAND (FAZ / Negativ, Germany) 7.5
ALVARO ARROBA (La Lectora Provisoria, Argentina) 8.5
PABLO O. SCHOLZ (Clarín, Argentina) 7
NANDO SALVA (El Periódico, España)
PEDRO BUTCHER (Filme B / Folha de Sao Paulo, Brasil) 6
GABRIELE BARRERA (Nick FilmTV / Best Movie / Cinecritica, Italy)
PAMELA BIENZOBAS (Mabuse, Chile) 7
MANU YAÑEZ (Fotogramas, España) 8
GREGORY VALENS (Positif, France)
CHRISTOPH HUBER (Die Presse, Austria)
MARCELO ALDERETE (Mar del Plata Film Festival, Argentina) 5
BELINDA VAN DE GRAAF (Trouw, Holanda) 5
ARTHUR MAS (Independencia, France)
MARTIAL PISANI (Independencia, France)
CARLOS REVIRIEGO (El Cultural / Cahiers du cinéma, España) 7
ALEJANDRO G. CALVO (SensaCine, España) 8
ANCHALEE CHAIWORAPORN (Siam Rath, Image Magazine, Thailand)
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
FERNANDO GANZO (Lumiere, España)
CARLOS HEREDERO (Cahiers du cinéma, España) 4
LUCIANO MONTEAGUDO (Página12, Argentina) 5
ROGER ALAN KOZA (La Voz del Interior / Con los ojos abiertos, Argentina)
MARK PERANSON (Cinema Scope, Canada)
EULALIA IGLESIAS (Rockdelux, Cahiers du cinéma, España) 4
DIEGO BATLLE (La Nación / OtrosCines, Argentina) 5.5
CRISTINA NORD (Die Tageszeitung, Germany) 6
MARKUS KEUSCHNIGG (Die Presse, Austria)
KONG RITHDEE (The Bangkok Post. Thailand) 6
FRANCISCO FERREIRA (Expresso, Portugal) 0
VIOLETA KOVACSICS (Diari de Tarragona, España) 3
JAIME PENA (El Amante, Argentina y Cahiers du cinéma, España) 2
OLIVIER PERE (Locarno Film Festival, Switzerland) 1
EUGENIO RENZI (Independencia, France)
LUCIANO BARISONE (Duellanti / Panoramiches, Italy) 4
CARLO CHATRIAN (Duellanti / Panoramiches, Italy)
JOSE LUIS DE LORENZO (A Sala Llena, Argentina)
FERNANDO JUAN LIMA (El Amante, Argentina)
XAVI SERRA (Ara, España)
ERNESTO GARRATT (El Mercurio, Chile)
NICK JAMES (Sight & Sound, England) 8
SERGI SANCHEZ (La Razón, España) 7
SARA BRITO (Público, España) 5.5
SCOTT FOUNDAS (Film Comment, USA) 8
SERGIO WOLF (BAFICI, Argentina)
RUDIGER SUCHSLAND (FAZ / Negativ, Germany) 4
ALVARO ARROBA (La Lectora Provisoria, Argentina) 2
PABLO O. SCHOLZ (Clarín, Argentina) 6
NANDO SALVA (El Periódico, España) 5
PEDRO BUTCHER (Filme B / Folha de Sao Paulo, Brasil) 1
GABRIELE BARRERA (Nick FilmTV / Best Movie / Cinecritica, Italy)
PAMELA BIENZOBAS (Mabuse, Chile) 5.5
MANU YAÑEZ (Fotogramas, España) 3
GREGORY VALENS (Positif, France)
CHRISTOPH HUBER (Die Presse, Austria)
MARCELO ALDERETE (Mar del Plata Film Festival, Argentina)
BELINDA VAN DE GRAAF (Trouw, Holanda) 5
ARTHUR MAS (Independencia, France)
MARTIAL PISANI (Independencia, France)
CARLOS REVIRIEGO (El Cultural / Cahiers du cinéma, España) 4
ALEJANDRO G. CALVO (SensaCine, España) 4
ANCHALEE CHAIWORAPORN (Siam Rath, Image Magazine, Thailand) 7
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
Jan Schulz-Ojala (Der Tagesspiegel, Germany) 2.5
Jose Carlos Avellar (Escrevercinema.com, Brazil) 7.5
Dennis Lim (The New York Times, USA) 5
Michel Ciment (Positif, France) 7.5
Alberto Crespi (L'Unita, Italy) 5
Bo Green Jensen (Weekandavisen Berlingske, Denmark) 7.5
Screen International (Screen International, USA) 7.5

“Sleeping Beauty” Julia Leigh (4,16) 27 votos [Competition]
FERNANDO GANZO (Lumiere, España)
CARLOS HEREDERO (Cahiers du cinéma, España) 6
LUCIANO MONTEAGUDO (Página12, Argentina) 5
ROGER ALAN KOZA (La Voz del Interior / Con los ojos abiertos, Argentina)
MARK PERANSON (Cinema Scope, Canada)
EULALIA IGLESIAS (Rockdelux, Cahiers du cinéma, España) 4
DIEGO BATLLE (La Nación / OtrosCines, Argentina) 5
CRISTINA NORD (Die Tageszeitung, Germany) 1
MARKUS KEUSCHNIGG (Die Presse, Austria)
KONG RITHDEE (The Bangkok Post. Thailand) 6
FRANCISCO FERREIRA (Expresso, Portugal) 0
VIOLETA KOVACSICS (Diari de Tarragona, España) 3
JAIME PENA (El Amante, Argentina y Cahiers du cinéma, España) 6
ERNESTO GARRATT (El Mercurio, Chile)
OLIVIER PERE (Locarno Film Festival, Switzerland)
EUGENIO RENZI (Independencia, France) 1.3
LUCIANO BARISONE (Duellanti / Panoramiches, Italy) 5
CARLO CHATRIAN (Duellanti / Panoramiches, Italy)
JOSE LUIS DE LORENZO (A Sala Llena, Argentina) 7
FERNANDO JUAN LIMA (El Amante, Argentina) 7
XAVI SERRA (Ara, España)
NICK JAMES (Sight & Sound, England) 6
SERGI SANCHEZ (La Razón, España) 4
SARA BRITO (Público, España)
SCOTT FOUNDAS (Film Comment, USA) 4
SERGIO WOLF (BAFICI, Argentina)
RUDIGER SUCHSLAND (Germany) 7
ALVARO ARROBA (La Lectora Provisoria, Argentina) 2
PABLO O. SCHOLZ (Clarín, Argentina) 4
NANDO SALVA (El Periódico, España) 2
PEDRO BUTCHER (Filme B / Folha de Sao Paulo, Brasil) 4
GABRIELE BARRERA (Nick FilmTV / Best Movie / Cinecritica, Italy)
PAMELA BIENZOBAS (Mabuse, Chile) 4
MANU YAÑEZ (Fotogramas, España) 4
GREGORY VALENS (Positif, France)
CHRISTOPH HUBER (Die Presse, Austria)
MARCELO ALDERETE (Mar del Plata Film Festival, Argentina)
BELINDA VAN DE GRAAF (Holanda) 2
ARTHUR MAS (Independencia, France)
MARTIAL PISANI (Independencia, France)
CARLOS REVIRIEGO (El Cultural / Cahiers du cinéma, España) 4
ALEJANDRO G. CALVO (SensaCine, España) 5
ANCHALEE CHAIWORAPORN (Siam Rath, Image Magazine, Thailand) 4
  Puntaje/Average:  4,16 (27 votos)
 Screen Daily:
Nick James (Sight & Sound, UK) 5
David Stratton (The Australian, Australia) 5
Derek Malcolm (London Evening, UK) 5
Jan Schulz-Ojala (Der Tagesspiegel, Germany) 5
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
FERNANDO GANZO (Lumiere, España)
CARLOS HEREDERO (Cahiers du cinéma, España) 5
LUCIANO MONTEAGUDO (Página12, Argentina) 6
ROGER ALAN KOZA (La Voz del Interior / Con los ojos abiertos, Argentina) 6.5
MARK PERANSON (Cinema Scope, Canada)
EULALIA IGLESIAS (Rockdelux, Cahiers du cinéma, España) 7
DIEGO BATLLE (La Nación / OtrosCines, Argentina) 6.5
CRISTINA NORD (Die Tageszeitung, Germany) 6
MARKUS KEUSCHNIGG (Die Presse, Austria)
KONG RITHDEE (The Bangkok Post. Thailand) 5
FRANCISCO FERREIRA (Expresso, Portugal) 2
VIOLETA KOVACSICS (Diari de Tarragona, España) 6
JAIME PENA (El Amante, Argentina y Cahiers du cinéma, España) 4
OLIVIER PERE (Locarno Film Festival, Switzerland) 6
EUGENIO RENZI (Independencia, France)
LUCIANO BARISONE (Duellanti / Panoramiches, Italy) 4
CARLO CHATRIAN (Duellanti / Panoramiches, Italy)
JOSE LUIS DE LORENZO (A Sala Llena, Argentina) 5
FERNANDO JUAN LIMA (El Amante, Argentina) 6.5
XAVI SERRA (Ara, España)
ERNESTO GARRATT (El Mercurio, Chile) 6
NICK JAMES (Sight & Sound, England) 5
SERGI SANCHEZ (La Razón, España) 7
SARA BRITO (Público, España) 6.5
SCOTT FOUNDAS (Film Comment, USA) 10
SERGIO WOLF (BAFICI, Argentina)
RUDIGER SUCHSLAND (Germany) 6.5
ALVARO ARROBA (La Lectora Provisoria, Argentina) 3
PABLO O. SCHOLZ (Clarín, Argentina) 7
NANDO SALVA (El Periódico, España) 6.5
PEDRO BUTCHER (Filme B / Folha de Sao Paulo, Brasil) 8
GABRIELE BARRERA (Nick FilmTV / Best Movie / Cinecritica, Italy)
PAMELA BIENZOBAS (Mabuse, Chile) 6
MANU YAÑEZ (Fotogramas, España) 7
GREGORY VALENS (Positif, France)
CHRISTOPH HUBER (Die Presse, Austria)
MARCELO ALDERETE (Mar del Plata Film Festival, Argentina)
BELINDA VAN DE GRAAF (Holanda) 7
ARTHUR MAS (Independencia, France)
MARTIAL PISANI (Independencia, France)
CARLOS REVIRIEGO (El Cultural / Cahiers du cinéma, España) 6
ALEJANDRO G. CALVO (SensaCine, España) 6
ANCHALEE CHAIWORAPORN (Siam Rath, Image Magazine, Thailand)
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
Cristina Nord (Die Tageszeitung, Germany) 
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
Paolo Bertolin (Italy) 
Paolo Moretti (Italy) 
Pedro Butcher (Folha do Sao Paulo, Filme B, Brasil) 
Philipp Engel (Go Mag, España) 
Robert Koehler (Variety, USA) 
Roger Alan Koza (La Voz del Interior, Con los ojos abiertos, Argentina) 
Rudiger Suchsland (FAZ, Negativ-film, Germany) 
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
Jan Schulz-Ojala (Der Tagesspiegel, Germany)
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
Frédéric Jaeger (critic.de, Germany)
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
Patrick Heidmann (Cineman, Germany)
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

Source at http://rurban.xarch.at/film/Cannes2011.txt
Result at http://rurban.xarch.at/film/Cannes2011.sorted.html
History at http://github.com/rurban/cannes-critics-ratings/

Other years: <a href=\"http://rurban.xarch.at/film/Cannes2010.sorted.html\">2010</a>, <a href=\"http://rurban.xarch.at/film/Cannes2012.sorted.html\">2012</a>
</pre>";

$FOOTER =~ s{ http://(.+)\n}{ <a href="http://$1">$1</a>\n}g;

