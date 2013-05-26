package Cannes::rurban::2010; # -*- perl -*-

#!/usr/bin/perl -- -*- perl -*- 
# Recalc and sort ratings from http://letrasdecine.blogspot.com/2010/05
# Perl script by Reini Urban (c) 2010
use utf8;
our $DATA= <<'EOF';
"BI, DUNG SO!" Phan Dang Di [Semaine]

"ARMADILLO" Janus Metz [Semaine] Grand Prix Semaine

"BEDEVILLED" Cheol-soo JANG [Semaine]

"LE NOM DES GENS" Michel Leclerc [Semaine]

"COPACABANA" Marc Fitoussi [Semaine]

"PIEDS NUS SUR LES LIMACES (LILY SOMETIMES)" Fabienne Berthaud [Quinzaine] Art Cinema Award

Diego Batlle (La Nación, Otros Cines, Argentina): 6

"ALL GOOD CHILDREN" Alicia Duffy [Quinzaine]

"UTOMLYONNYE SOLNTSEM 2: PREDSTOYANIE (THE EXODUS - Burnt by the sun 2)" Nikita
 MIKHALKOV [Competition]

Robert Koehler: (Variety, USA): 2
Luciano Monteagudo (Página/12, Argentina): 5
Francisco Ferreira (O Expresso, Portugal): 1
# Screen Daily (0-4)
Jose Carlos Avellar  5
Michel Clement       1
Alberto Crespi       
Nick James           2.5
Bo Green Jensen      5
Derek Malcolm        2.5
Jan Schulz-Ojala     2.5
David Stratton         
Screen International 5

"SZELÍD TEREMTÉS - A FRANKENSTEIN TERV (TENDER SON - The Frankenstein Project)" Kornél MUNDRUCZÓ [Competition]

Markus Keuschnigg (ORF Radio FM4, Die Presse, Austria): 1
Jaime Pena (El Amante, Cahiers du Cinéma España, España): 2
# Screen Daily (0-4)
Jose Carlos Avellar  5
Michel Clement       7.5
Alberto Crespi       
Nick James           2.5
Bo Green Jensen      5
Derek Malcolm        
Jan Schulz-Ojala     7.5
David Stratton       5  
Screen International 5

"THE TREE" Julie Bertuccelli

Robert Koehler: (Variety, USA): 6

"HAHAHA" HONG Sangsoo [Un Certain Regard]

Olivier Père (Director artístico Festival de Locarno, France): 6
Diego Batlle (La Nación, Otros Cines, Argentina): 9
Fernando Ganzo (Lumiére, España): 8,21
Diego Lerer (Clarín, Micropsia, Argentina): 9
Carlos F. Heredero (Cahiers du Cinéma España, España): 7
Violeta Kovacsis (Lumiere, España): 8
Luciano Monteagudo (Página/12, Argentina): 9
Carlo Chatrian (Panoramiques, Duellanti, Italia): 9
Robert Koehler: (Variety, USA): 6
Rüdiger Suchsland (Frankfurter Allgemeigne Zeitung, Artechock, Deutschland): 9
Eulalia Iglesias (Cahiers du Cinéma España, España): 8,5
Francisco Ferreira (O Expresso, Portugal): 8

"HORS LA LOI (OUTSIDE OF THE LAW)" Rachid BOUCHAREB [Competition]

Eugenio Renzi (Independencia, France): 5
Diego Batlle (La Nación, Otros Cines, Argentina): 6
Eulalia Iglesias (Cahiers du Cinéma España, España): 6
Francisco Ferreira (O Expresso, Portugal): 2
Diego Lerer (Clarín, Micropsia, Argentina): 4
Carlos F. Heredero (Cahiers du Cinéma España, España): 5
Cristina Nord (Die Tageszeitung, Deutschland): 3
Violeta Kovacsis (Lumiere, España): 5
Luciano Monteagudo (Página/12, Argentina): 4
Jaime Pena (El Amante, Cahiers du Cinéma España, España): 5
# Screen Daily (0-4)
Jose Carlos Avellar  7.5
Michel Clement       5
Alberto Crespi       5
Nick James           7.5
Bo Green Jensen      7.5
Derek Malcolm        7.5
Jan Schulz-Ojala     5
David Stratton       7.5  
Screen International 5

"TIGER FACTORY" Ming jin Woo [Quinzaine]

Paolo Bertolin (Cineforum, Italia): 8
Robert Koehler: (Variety, USA): 7
Jaime Pena (El Amante, Cahiers du Cinéma España, España): 7

"LUNG BOONMEE RALUEK CHAT (Uncle Boonmee Who Can Recall His Past Lives)" Apichatpong Weerasethakul [Competition] PALME D'OR

Paolo Bertolin (Cineforum, Italia): 10
Jaime Pena (El Amante, Cahiers du Cinéma España, España): 10
Fernando Ganzo (Lumiére, España): 10
Diego Batlle (La Nación, Otros Cines, Argentina): 9
Diego Lerer (Clarín, Micropsia, Argentina): 10
Alejandro G. Calvo (Sensacine.com, España): 10
Leonardo D'Espósito (Crítica de la Argentina, Argentina): 10
Eulalia Iglesias (Cahiers du Cinéma España, España): 10
Gonzalo de Pedro (Cahiers du Cinéma España, Público, España): 10
Luciano Monteagudo (Página/12, Argentina): 9
Rüdiger Suchsland (Frankfurter Allgemeine Zeitung, Artechock, Deutschland): 6
Manu Yáñez (Fotogramas, España): 10
Emmanuel Burdeau (Mediapart, France): 9,5
Carlo Chatrian (Panoramiques, Duellanti, Italia): 7,5
Luciano Barisone (Panoramiques, Italia): 8
Robert Koehler: (Variety, USA): 10
Carlos F. Heredero (Cahiers du Cinéma España, España): 8
Scott Foundas (Filmlinc, USA): 9
Mark Peranson (Cinema Scope, Canada): 13,7
Cristina Nord (Die Tageszeitung, Deutschland): 10
Francisco Ferreira (O Expresso, Portugal): 10
Gabe Klinger (The Auteurs Notebook, USA): 10
Eugenio Renzi (Independencia, France): 9
Roger Alan Koza (La Voz del Interior, Argentina): 10
Violeta Kovacsis (Lumiere, España): 9
Markus Keuschnigg (ORF Radio FM4, Die Presse, Austria): 10
# Screen Daily (0-4)
Jose Carlos Avellar  9
Michel Clement       2.5
Alberto Crespi       2.5
Nick James           7.5
Bo Green Jensen      5
Derek Malcolm        7.5
Jan Schulz-Ojala     7.5
David Stratton       5  
Screen International 7.5

"LIFE ABOVE ALL" Oliver Schmitz [Un Certain Regard]

Scott Foundas (Filmlinc, USA): 7

"BOXING GYM" Frederick Wiseman

Olivier Père (Director artístico Festival de Locarno, France): 5
Francisco Ferreira (O Expresso, Portugal): 5
Carlos F. Heredero (Cahiers du Cinéma España, España): 7
Paolo Bertolin (Cineforum, Italia): 8
Alejandro G. Calvo (Sensacine.com, España): 5
Gabe Klinger (The Auteurs Notebook, USA): 6
Eulalia Iglesias (Cahiers du Cinéma España, España): 6,5
Cristina Nord (Die Tageszeitung, Deutschland): 8
Jaime Pena (El Amante, Cahiers du Cinéma España, España): 5

"A ALEGRIA" Felipe Bragança, Marina Meliande [Quinzaine]

Olivier Père (Director artístico Festival de Locarno, France): 2
Roger Alan Koza (La Voz del Interior, Argentina): 2
Paolo Bertolin (Cineforum, Italia): 3

"PICCO" Philip Koch [Quinzaine]

Carlo Chatrian (Panoramiques, Duellanti, Italia): 3
Rüdiger Suchsland (Frankfurter Allgemeine Zeitung, Artechock, Deutschland): 4
Gabe Klinger (The Auteurs Notebook, USA): 5

"REBECCA H. (RETURN TO THE DOGS)" Lodge Kerrigan [Un Certain Regard]

Carlo Chatrian (Panoramiques, Duellanti, Italia): 7
Diego Batlle (La Nación, Otros Cines, Argentina): 8
Leonardo D'Espósito (Crítica de la Argentina, Argentina): 8
Emmanuel Burdeau (Mediapart, France): 7
Luciano Barisone (Panoramiques, Italia): 7
Robert Koehler: (Variety, USA): 3
Carlos F. Heredero (Cahiers du Cinéma España, España): 7
Scott Foundas (Filmlinc, USA): 0
Fernando Ganzo (Lumiére, España): 5
Jaime Pena (El Amante, Cahiers du Cinéma España, España): 6,5
Roger Alan Koza (La Voz del Interior, Argentina): 4
Diego Lerer (Clarín, Micropsia, Argentina): 6
Paolo Bertolin (Cineforum, Italia): 6
Alejandro G. Calvo (Sensacine.com, España): 5
Gabe Klinger (The Auteurs Notebook, USA): 7
Eulalia Iglesias (Cahiers du Cinéma España, España): 7
Violeta Kovacsis (Lumiere, España): 8

"SIMON WERNER A DISPARU..." Fabrice Gobert [Un Certain Regard]

Eulalia Iglesias (Cahiers du Cinéma España, España): 4
Carlos F. Heredero (Cahiers du Cinéma España, España): 4
Leonardo D'Espósito (Crítica de la Argentina, Argentina): 7
Diego Lerer (Clarín, Micropsia, Argentina): 5
Gabe Klinger (The Auteurs Notebook, USA): 6
Eugenio Renzi (Independencia, France): 3
Fernando Ganzo (Lumiére, España): 0

"MYSTERIES OF LISBON" Raul Ruiz

Robert Koehler: (Variety, USA): 8

"FAIR GAME" Doug Liman [Competition]

Francisco Ferreira (O Expresso, Portugal): 5,5
Alejandro G. Calvo (Sensacine.com, España): 6
Eulalia Iglesias (Cahiers du Cinéma España, España): 6,5
Carlos F. Heredero (Cahiers du Cinéma España, España): 5
Violeta Kovacsis (Lumiere, España): 2
Carlo Chatrian (Panoramiques, Duellanti, Italia): 4
Robert Koehler: (Variety, USA): 3
Diego Batlle (La Nación, Otros Cines, Argentina): 6
Leonardo D'Espósito (Crítica de la Argentina, Argentina): 5
Rüdiger Suchsland (Frankfurter Allgemeine Zeitung, Artechock, Deutschland): 4
Manu Yáñez (Fotogramas, España): 5
Luciano Barisone (Panoramiques, Italia): 2
Jaime Pena (El Amante, Cahiers du Cinéma España, España): 5
Diego Lerer (Clarín, Micropsia, Argentina): 5
Paolo Bertolin (Cineforum, Italia): 7
Eugenio Renzi (Independencia, France): 5
# Screen Daily (0-4)
Jose Carlos Avellar  5
Michel Clement       5
Alberto Crespi       5
Nick James           2.5
Bo Green Jensen      7.5
Derek Malcolm        7.5
Jan Schulz-Ojala     5
David Stratton       5  
Screen International 7.5

"OCTUBRE" Diego Vega y Daniel Vega [Un Certain Regard]

Luciano Barisone (Panoramiques, Italia): 7
Roger Alan Koza (La Voz del Interior, Argentina): 6,50
Carlo Chatrian (Panoramiques, Duellanti, Italia): 8
Diego Batlle (La Nación, Otros Cines, Argentina): 7
Diego Lerer (Clarín, Micropsia, Argentina): 6
Carlos F. Heredero (Cahiers du Cinéma España, España): 7
Robert Koehler: (Variety, USA): 5
Alejandro G. Calvo (Sensacine.com, España): 5
Jaime Pena (El Amante, Cahiers du Cinéma España, España): 6

"TODOS VOS SODES CAPITANS" Oliver Laxe [Quinzaine]

Olivier Père (Director artístico Festival de Locarno, France): 7
Antoine Thirion (Independencia, France): 8
Carlo Chatrian (Panoramiques, Duellanti, Italia): 4
Carlos F. Heredero (Cahiers du Cinéma España, España): 5
Luciano Monteagudo (Página/12, Argentina): 7
Gonzalo de Pedro (Cahiers du Cinéma España, Público, España): 8,5
Fernando Ganzo (Lumiére, España): 7
Robert Koehler: (Variety, USA): 9
Jaime Pena (El Amante, Cahiers du Cinéma España, España): 6
Alejandro G. Calvo (Sensacine.com, España): 6
Eulalia Iglesias (Cahiers du Cinéma España, España): 6,5
Diego Batlle (La Nación, Otros Cines, Argentina): 7,5
Gabe Klinger (The Auteurs Notebook, USA): 6
Francisco Ferreira (O Expresso, Portugal): 7,5

"LA NOSTRA VITA (OUR LIFE)" Daniele Luchetti [Competition]

Alejandro G. Calvo (Sensacine.com, España): 3
Diego Batlle (La Nación, Otros Cines, Argentina): 6
Diego Lerer (Clarín, Micropsia, Argentina): 6
Luciano Barisone (Panoramiques, Italia): 5
Carlos F. Heredero (Cahiers du Cinéma España, España): 3
Jaime Pena (El Amante, Cahiers du Cinéma España, España): 7
Carlo Chatrian (Panoramiques, Duellanti, Italia): 3
Cristina Nord (Die Tageszeitung, Deutschland): 2
Eulalia Iglesias (Cahiers du Cinéma España, España): 0,5
Violeta Kovacsis (Lumiere, España): 0
Luciano Monteagudo (Página/12, Argentina): 6
Rüdiger Suchsland (Frankfurter Allgemeine Zeitung, Artechock, Deutschland): 1
Manu Yáñez (Fotogramas, España): 1
Gabe Klinger (The Auteurs Notebook, USA): 1
# Screen Daily (0-4)
Jose Carlos Avellar  2.5
Michel Clement       2.5
Alberto Crespi       7.5
Nick James           2.5
Bo Green Jensen      5
Derek Malcolm        5
Jan Schulz-Ojala     2.5
David Stratton       2.5  
Screen International 5

"STONES IN EXILE" Stephen Kijak

Luciano Monteagudo (Página/12, Argentina): 6
Gonzalo de Pedro (Cahiers du Cinéma España, Público, España): 3
Diego Batlle (La Nación, Otros Cines, Argentina): 6
Diego Lerer (Clarín, Micropsia, Argentina): 6
Roger Alan Koza (La Voz del Interior, Argentina): 5,5
Leonardo D'Espósito (Crítica de la Argentina, Argentina): 7

"ROUTE IRISH" Ken Loach [Competition]

Carlos F. Heredero (Cahiers du Cinéma España, España): 4
Diego Batlle (La Nación, Otros Cines, Argentina): 7
Luciano Monteagudo (Página/12, Argentina): 6
Jaime Pena (El Amante, Cahiers du Cinéma España, España): 0
Diego Lerer (Clarín, Micropsia, Argentina): 6
Cristina Nord (Die Tageszeitung, Deutschland): 2
# Screen Daily (0-4)
Jose Carlos Avellar  7.5
Michel Clement       5
Alberto Crespi       5
Nick James           2.5
Bo Green Jensen      7.5
Derek Malcolm        7.5
Jan Schulz-Ojala     5
David Stratton       7.5  
Screen International 7.5

"CARLOS" Olivier Assayas

Francisco Ferreira (O Expresso, Portugal): -6-
Gabe Klinger (The Auteurs Notebook, USA): 7
Fernando Ganzo (Lumiére, España): 5,5
Rüdiger Suchsland (Frankfurter Allgemeine Zeitung + Artechock, Deutschland): 8,5
Robert Koehler: (Variety, USA): -8-
Emmanuel Burdeau (Mediapart, France): 4
Cristina Nord (Die Tageszeitung, Deutschland): 8
Markus Keuschnigg (ORF Radio FM4, Die Presse, Austria): 8
Diego Lerer (Clarín, Micropsia, Argentina): -8- (vistos dos episodios de tres). 
Scott Foundas (Filmlinc, USA): 9

"SHI (POETRY)" Lee Chang-dong [Competition]

Diego Batlle (La Nación + Otros Cines, Argentina): 9
Leonardo D'Espósito (Crítica de la Argentina, Argentina): 8
Carlo Chatrian (Panoramiques Duellanti, Italia): 8
Diego Lerer (Clarín + Micropsia, Argentina): 7
Carlos F. Heredero (Cahiers du Cinéma España, España): 9
Alejandro G. Calvo (Sensacine.com, España): 5
Scott Foundas (Filmlinc, USA): 9
Eulalia Iglesias (Cahiers du Cinéma España, España): 7
Luciano Monteagudo (Página/12, Argentina): 8
Luciano Barisone (Panoramiques, Italia): 9
Paolo Bertolin (Cineforum, Italia): 9
Robert Koehler: (Variety, USA): 9
Jaime Pena (El Amante, Cahiers du Cinéma España, España): 9
Carlo Chatrian (Panoramiques, Duellanti, Italia): 8
Leonardo D'Espósito (Crítica de la Argentina, Argentina): 8
Violeta Kovacsis (Lumiere, España): 7
Manu Yáñez (Fotogramas, España): 7
Scott Foundas (Filmlinc, USA): 10
Cristina Nord (Die Tageszeitung, Deutschland): 8
Markus Keuschnigg (ORF Radio FM4, Die Presse, Austria): 6
# Screen Daily (0-4)
Jose Carlos Avellar  5
Michel Clement       9
Alberto Crespi       
Nick James           7.5
Bo Green Jensen      5
Derek Malcolm        5
Jan Schulz-Ojala     7.5
David Stratton         
Screen International 7.5

"UDAAN" Vikramaditya Motwane [Un Certain Regard]

Leonardo D'Espósito (Crítica de la Argentina, Argentina): 4
Carlos F. Heredero (Cahiers du Cinéma España, España): 1
Roger Alan Koza (La Voz del Interior, Argentina): 3
Paolo Bertolin (Cineforum, Italia): 8
Robert Koehler: (Variety, USA): 4

"DES HOMMES ET DES DIEUX (OF GODS AND MEN)" Xavier Beauvois [Competition]

Cristina Nord ( Die Tageszeitung, Deutschland): 7
Markus Keuschnigg (ORF Radio FM4, Die Presse, Austria): 10
Francisco Ferreira (O Expresso, Portugal): 8
Gabe Klinger (The Auteurs Notebook, USA): 9
Violeta Kovacsis (Lumiere, España): 9
Alejandro G. Calvo (Sensacine.com, España): 5
Fernando Ganzo (Lumiere, España): 7
Emmanuel Burdeau (Mediapart, France): 9,5
Olivier Père (Director artístico Festival de Locarno, France): 10
Leonardo D'Espósito (Crítica de la Argentina, Argentina): 7
Carlos F. Heredero (Cahiers du Cinéma España, España): 8
Paolo Bertolin (Cineforum, Italia): 8
Robert Koehler (Variety, USA): 10
Jaime Pena (El Amante + Cahiers du Cinéma España, España): 8,5
Luciano Barisone (Panoramiques, Italia): 8
Diego Batlle (La Nación + Otros Cines, Argentina): 9
Carlo Chatrian (Panoramiques Duellanti, Italia): 8
Diego Lerer (Clarín + Micropsia, Argentina): 9
Luciano Monteagudo (Página/12, Argentina): 6
Roger Alan Koza (La Voz del Interior, Argentina): 9,5
# Screen Daily (0-4)
Jose Carlos Avellar  2.5
Michel Clement       7.5
Alberto Crespi       7.5
Nick James           7.5
Bo Green Jensen      7.5
Derek Malcolm        7.5
Jan Schulz-Ojala     9
David Stratton       9  
Screen International 9

"SCHASTYE MOE (MY JOY)" Sergei Loznitsa [Competition]

Diego Batlle (La Nación + Otros Cines, Argentina): 3
Luciano Monteagudo (Página/12, Argentina): 5
Carlos F. Heredero (Cahiers du Cinéma España, España): 9
Alejandro G. Calvo (Sensacine.com, España): 7
Robert Koehler (Variety, USA): 6
Jaime Pena (El Amante + Cahiers du Cinéma España, España): 7
Luciano Barisone (Panoramiques, Italia): 7
Francisco Ferreira (O Expresso, Portugal): 3
Carlo Chatrian (Panoramiques Duellanti, Italia): 5
Diego Lerer (Clarín + Micropsia, Argentina): 5
Eulalia Iglesias (Cahiers du Cinéma España, España): 7,5
Gabe Klinger (The Auteurs Notebook, USA): 6
Gonzalo de Pedro (Cahiers du Cinéma España + Público, España): 7
Cristina Nord (Die Tageszeitung, Deutschland): 7
Markus Keuschnigg (ORF Radio FM4, Die Presse, Austria): 4
Violeta Kovacsis (Lumiere, España): 8
Manu Yáñez (Fotogramas, España): 6
Scott Foundas (Filmlinc, USA): 8
Paolo Bertolin (Cineforum, Italia): 10
# Screen Daily (0-4)
Jose Carlos Avellar  7.5
Michel Clement       5
Alberto Crespi       2.5
Nick James           7.5
Bo Green Jensen      5
Derek Malcolm        7.5
Jan Schulz-Ojala     2.5
David Stratton       7.5  
Screen International 5

"DES FILLES EN NOIR" Jean-Paul Civeyrac [Quinzaine]

Fernando Ganzo (Lumiere, España): 7
Diego Batlle (La Nación + Otros Cines, Argentina): 6,5
Leonardo D'Espósito (Crítica de la Argentina, Argentina): 7
Alejandro G. Calvo (Sensacine.com, España): 5
Robert Koehler (Variety, USA): 5
Rüdiger Suchsland (Frankfurter Allgemeine Zeitung, Artechock, Deutschland): 6

"LOS LABIOS" Santiago Loza e Iván Fund [Un Certain Regard]

Diego Lerer (Clarín + Micropsia, Argentina): 8
Diego Batlle (La Nación + Otros Cines, Argentina): 8
Roger Alan Koza (La Voz del Interior, Argentina): 8
Cristina Nord (Die Tageszeitung, Deutschland): 8
Fernando Ganzo (Lumiere, España): 6,5
Leonardo D'Espósito (Crítica de la Argentina, Argentina): 7
Jaime Pena (El Amante + Cahiers du Cinéma España, España): 6,5
Luciano Barisone (Panoramiques, Italia): 5
Carlo Chatrian (Panoramiques Duellanti, Italia): 6
Eulalia Iglesias (Cahiers du Cinéma España, España): 6,5
Rüdiger Suchsland (Frankfurter Allgemeine Zeitung, Artechock, Deutschland): 7,5

"BLUE VALENTINE" Derek Cianfrance [Un Certain Regard]

Cristina Nord (Die Tageszeitung, Deutschland): 6
Carlos F. Heredero (Cahiers du Cinéma España, España): 5
Jaime Pena (El Amante + Cahiers du Cinéma España, España): 5,5
Diego Batlle (La Nación + Otros Cines, Argentina): 7
Diego Lerer (Clarín + Micropsia, Argentina): 7
Eulalia Iglesias (Cahiers du Cinéma España, España): 5
Markus Keuschnigg (ORF Radio FM4, Die Presse, Austria): 8

"CHANTRAPAS" Otar Iosselliani

Olivier Père (Festival de Locarno, France): 9
Francisco Ferreira (O Expresso, Portugal): 8
Alejandro G. Calvo (Sensacine.com, España): 9,99
Fernando Ganzo (Lumiere, España): 7,5
Diego Batlle (La Nación + Otros Cines, Argentina): 7,5
Leonardo D'Espósito (Crítica de la Argentina, Argentina): 7
Carlos F. Heredero (Cahiers du Cinéma España, España): 7
Robert Koehler (Variety, USA): 8
Jaime Pena (El Amante + Cahiers du Cinéma España, España): 7,5
Carlo Chatrian (Panoramiques Duellanti, Italia): 8
Eulalia Iglesias (Cahiers du Cinéma España, España): 7,5

"THE MYHTH OF AMERICAN SLEEPOVER" David Robert Mitchell [Semaine]

Paolo Bertolin (Cineforum, Italia): 7
Rüdiger Suchsland (Frankfurter Allgemeine Zeitung, Artechock, Deutschland): 7

"ILLÉGAL" Olivier Masset-Depasse [Quinzaine]
  SACD Prize for best French-language film

Paolo Bertolin (Cineforum, Italia): 7
Gonzalo de Pedro (Cahiers du Cinéma España, Público, España): 0,001

"SOUND OF NOISE" Ola Simonsson & Johanes Stjärne Nilsson [Semaine]

Paolo Bertolin (Cineforum, Italia): 6
Roger Alan Koza (La Voz del Interior, Argentina): 6,5

"AUTOBIOGRAFIA LUI NICOLAE CEAUSESCU" Andrei Ujica

Francisco Ferreira (O Expresso, Portugal): 8
Luciano Monteagudo (Página/12, Argentina): 8
Scott Foundas (Filmlinc, USA): 10
Olivier Père (Director artístico Festival de Locarno, France): 9
Carlos F. Heredero (Cahiers du Cinéma España, España): 7
Luciano Barisone (Panoramiques, Italia): 8
Carlo Chatrian (Panoramiques Duellanti, Italia): 9
Diego Lerer (Clarín + Micropsia, Argentina): 8
Gabe Klinger (The Auteurs Notebook, USA): 8
Robert Koehler: (Variety, USA): 10
Rüdiger Suchsland (Frankfurter Allgemeine Zeitung, Artechock, Deutschland): 8,5
Fernando Ganzo (Lumiére, España): 8
Jaime Pena (El Amante, Cahiers du Cinéma España, España): 9
Paolo Bertolin (Cineforum, Italia): 8

"TWO GATES OF SLEEP" Alistair Banks Griffin [Quinzaine]

Gabe Klinger (The Auteurs Notebook, USA): 2

"COPIE CONFORME (CERTIFIED COPY)" Abbas Kiarostami [Competition]

Carlo Chatrian (Panoramiques Duellanti, Italia): 3
Emmanuel Burdeau (Mediapart, France): 6,5
Diego Batlle (La Nación + Otros Cines, Argentina): 7
Leonardo D'Espósito (Crítica de la Argentina, Argentina): 9
Fernando Ganzo (Lumiere, España): 9,5
Scott Foundas (Filmlinc, USA): 8
Carlos F. Heredero (Cahiers du Cinéma España, España): 6
Eugenio Renzi (Independencia, France): 0
Luciano Barisone (Panoramiques, Italia): 8
Robert Koehler (Variety, USA): 4
Manu Yáñez (Fotogramas, España): 6
Jaime Pena (El Amante + Cahiers du Cinéma España, España): 8,5
Diego Lerer (Clarín + Micropsia, Argentina): 8
Alejandro G. Calvo (Sensacine.com, España): 6
Cristina Nord (Die Tageszeitung, Deutschland): 6
Francisco Ferreira (O Expresso, Portugal): 7,5
Gabe Klinger (The Auteurs Notebook, USA): 5
Violeta Kovacsis (Lumiere, España): 6
Luciano Monteagudo (Página/12, Argentina): 6
Roger Alan Koza (La Voz del Interior, Argentina): 8
Paolo Bertolin (Cineforum, Italia): 7
# Screen Daily (0-4)
Jose Carlos Avellar  5
Michel Clement       5
Alberto Crespi       2.5
Nick James           7.5
Bo Green Jensen      5
Derek Malcolm        5
Jan Schulz-Ojala     9
David Stratton       5  
Screen International 7.5

"FILM SOCIALISME" Jean-Luc Godard [Un Certain Regard]

Cristina Nord (Die Tageszeitung, Deutschland): 8
Fernando Ganzo (Lumiere, España): 10
Gabe Klinger (The Auteurs Notebook, USA): 10
Emmanuel Burdeau (Mediapart, France): 9,5
Sergio Wolf (Director artístico de BAFICI, Argentina): 10
Leonardo D'Espósito (Crítica de la Argentina, Argentina): 10
Jaime Pena (El Amante + Cahiers du Cinéma España, España): 10.9
Alejandro G. Calvo (Sensacine.com, España): 9
Olivier Père (Director artístico Festival de Locarno, France): 10
Carlo Chatrian (Panoramiques Duellanti, Italia): 9
Diego Batlle (La Nación + Otros Cines, Argentina): 7
Luciano Monteagudo (Página/12, Argentina): 10
Scott Foundas (Filmlinc, USA): 10
Carlos F. Heredero (Cahiers du Cinéma España, España): 8
Eugenio Renzi (Independencia, France): 10
Robert Koehler (Variety, USA): 10
Roger Alan Koza (La Voz del Interior, Argentina): 10
Gonzalo de Pedro (Cahiers du Cinéma España + Público, España): 10
Diego Lerer (Clarín + Micropsia, Argentina): 8
Markus Keuschnigg (ORF Radio FM4, Die Presse, Austria): 0,3
Francisco Ferreira (O Expresso, Portugal): 10
Rüdiger Suchsland (Frankfurter Allgemeine Zeitung + Artechock, Deutschland): 9,5

"ALTING BLIVER GODT IGEN" Christoffer Boe [Quinzaine]

Gonzalo de Pedro (Cahiers du Cinéma España + Público, España): 2
Rüdiger Suchsland (Frankfurter Allgemeine Zeitung + Artechock, Deutschland): 3
Paolo Bertolin (Cineforum, Italia): 6

"HA 'MESHOTET" Avishai Siva [Quinzaine]

Diego Batlle (La Nación + Otros Cines, Argentina): 5
Gonzalo de Pedro (Cahiers du Cinéma España + Público, España): 4
Diego Lerer (Clarín + Micropsia, Argentina): 6
Cristina Nord (Die Tageszeitung, Deutschland): 5
Gabe Klinger (The Auteurs Notebook, USA): 5
Rüdiger Suchsland (Frankfurter Allgemeine Zeitung + Artechock, Deutschland): 4

"AÑO BISIESTO" Michael Rowe [Quinzaine]

Jaime Pena (El Amante + Cahiers du Cinéma España, España): 5
Carlo Chatrian (Panoramiques Duellanti, Italia): 4
Carlos F. Heredero (Cahiers du Cinéma España, España): 3
Roger Alan Koza (La Voz del Interior, Argentina): 5
Gonzalo de Pedro (Cahiers du Cinéma España + Público, España): 6
Gabe Klinger (The Auteurs Notebook, USA): 4

"BIUTIFUL" Alejandro González-Iñarritu [Competition]

Roger Alan Koza (La Voz del Interior, Argentina): 3
Alejandro G. Calvo (Sensacine.com, España): 2
Eulalia Iglesias (Cahiers du Cinéma España, España): 0
Jaime Pena (El Amante + Cahiers du Cinéma España, España): 0.1
Carlo Chatrian (Panoramiques Duellanti, Italia): 3
Luciano Monteagudo (Página/12, Argentina): 3
Diego Batlle (La Nación + Otros Cines, Argentina): 3
Violeta Kovacsis (Lumiere, España): 0
Carlos F. Heredero (Cahiers du Cinéma España, España): 1
Luciano Barisone (Panoramiques, Italia): 1
Robert Koehler (Variety, USA): 1
Manu Yáñez (Fotogramas, España): 2
Diego Lerer (Clarín + Micropsia, Argentina): 3
Francisco Ferreira (O Expresso, Portugal): 1
Leonardo D'Espósito (Crítica de la Argentina, Argentina): 0
Scott Foundas (Filmlinc, USA): 0
# Screen Daily (0-4)
Jose Carlos Avellar  5
Michel Clement       7.5
Alberto Crespi       1
Nick James           2.5
Bo Green Jensen      7.5
Derek Malcolm        7.5
Jan Schulz-Ojala     7.5
David Stratton       5  
Screen International 2.5

"TAMARA DREWE" Stephen Frears

Alejandro G. Calvo (Sensacine.com, España): 5
Scott Foundas (Filmlinc, USA): 0

"O ESTRANHO CASO DA ANGELICA" Manoel Oliveira [Un Certain Regard]

Francisco Ferreira (O Expresso, Portugal): 10
Scott Foundas (Filmlinc, USA): 10
Leonardo D'Espósito (Crítica de la Argentina, Argentina): 9
Gonzalo de Pedro (Cahiers du Cinéma España + Público, España): 10
Gabe Klinger (The Auteurs Notebook, USA): 8
Luciano Barisone (Panoramiques, Italia): 9
Carlo Chatrian (Panoramiques Duellanti, Italia): 9
Paolo Bertolin (Cineforum. Italia): 9
Violeta Kovacsis (Lumiere, España): 8
Robert Koehler (Variety, USA): 10
Olivier Père (Director artístico Festival de Locarno, France): 9
Carlos F. Heredero (Cahiers du Cinéma España, España): 7
Roger Alan Koza (La Voz del Interior, Argentina): 10
Diego Lerer (Clarín + Micropsia, Argentina): 8
Alejandro G. Calvo (Sensacine.com, España): 9
Jaime Pena (El Amante + Cahiers du Cinéma España, España): 8
Carlos Reviriego (Cahiers du Cinéma España, España): 8
Diego Batlle (La Nación + Otros Cines, Argentina): 7
Manu Yáñez (Fotogramas, España): 9
Luciano Monteagudo (Página/12, Argentina): 9
Eulalia Iglesias (Cahiers du Cinéma España, España): 8
Cristina Nord (Die Tageszeitung, Deutschland): 8
Mark Peranson (CinemaScope, Canada): 10,3
Rüdiger Suchsland (Frankfurter Allgemeine Zeitung + Artechock, Deutschland): 5

"CARANCHO" Pablo Trapero [Un Certain Regard]

Diego Lerer (Clarín + Micropsia, Argentina): 8
Diego Batlle (La Nación + Otros Cines, Argentina): 8
Roger Alan Koza (La Voz del Interior, Argentina): 8
Leonardo D'Espósito (Crítica de la Argentina, Argentina): 9
Fernando Ganzo (Lumiere, España): 5
Olivier Père (Director artístico Festival de Locarno, France): 5
Carlos F. Heredero (Cahiers du Cinéma España, España): 7
Luciano Barisone (Panoramiques, Italia): 4
Robert Koehler (Variety, USA): 6
Manu Yáñez (Fotogramas, España): 7
Jaime Pena (El Amante + Cahiers du Cinéma España, España): 6,5
Alejandro G. Calvo (Sensacine.com, España): 8
Violeta Kovacsis (Lumiere, España): 7
Rüdiger Suchsland (Frankfurter Allgemeine Zeitung + Artechock, Deutschland): 5,5
Luciano Monteagudo (Página/12, Argentina): 8

"OUTRAGE" Takeshi Kitano [Competition]

Scott Foundas (Filmlinc, USA): 4
Alejandro G. Calvo (Sensacine.com, España): 8
Emmanuel Burdeau (Mediapart, France): 7
Diego Batlle (La Nación + Otros Cines, Argentina): 7
Leonardo D'Espósito (Crítica de la Argentina, Argentina): 6
Carlos F. Heredero (Cahiers du Cinéma España, España): 6
Fernando Ganzo (Lumiere, España): 6
Jaime Pena (El Amante + Cahiers du Cinéma España, España): 7
Diego Lerer (Clarín + Micropsia, Argentina): 7
Markus Keuschnigg (ORF Radio FM4, Die Presse, Austria): 5
Luciano Barisone (Panoramiques, Italia): 3
Eulalia Iglesias (Cahiers du Cinéma España, España): 6,5
Cristina Nord (Die Tageszeitung, Deutschland): 5
Luciano Monteagudo (Página/12, Argentina): 6
Carlo Chatrian (Panoramiques Duellanti, Italia): 6
Violeta Kovacsis (Lumiere, España): 7
Roger Alan Koza (La Voz del Interior, Argentina): 6
Manu Yáñez (Fotogramas, España): 8
Rüdiger Suchsland (Frankfurter Allgemeine Zeitung + Artechock, Deutschland): 6
Paolo Bertolin (Cineforum, Italia): 8
# Screen Daily (0-4)
Jose Carlos Avellar  2.5
Michel Clement       2.5
Alberto Crespi       1
Nick James           1
Bo Green Jensen      2.5
Derek Malcolm        2.5
Jan Schulz-Ojala     5
David Stratton       1  
Screen International 5

"HAI SHANG CHUAN QI (I WISH I KNEW)" Jia Zhang-ke [Un Certain Regard]

Francisco Ferreira (O Expresso, Portugal): 5
Gonzalo de Pedro (Cahiers du Cinéma España + Público, España): 4
Alejandro G. Calvo (Sensacine.com, España): 4
Emmanuel Burdeau (Mediapart, France): 9
Diego Batlle (La Nación + Otros Cines, Argentina): 9
Leonardo D'Espósito (Crítica de la Argentina, Argentina): 7
Carlos F. Heredero (Cahiers du Cinéma España, España): 9
Fernando Ganzo (Lumiere, España): 6
Jaime Pena (El Amante + Cahiers du Cinéma España, España): 6,9
Diego Lerer (Clarín + Micropsia, Argentina): 7
Markus Keuschnigg (ORF Radio FM4, Die Presse, Austria): 4
Eugenio Renzi (Independencia, France): 8
Luciano Barisone (Panoramiques, Italia): 6
Eulalia Iglesias (Cahiers du Cinéma España, España): 7,5
Cristina Nord (Die Tageszeitung, Deutschland): 6
Luciano Monteagudo (Página/12, Argentina): 6
Violeta Kovacsis (Lumiere, España): 9
Scott Foundas (Filmlinc, USA): 7
Robert Koehler (Variety, USA): 9
Paolo Bertolin (Cineforum, Italia): 8

"LE QUATTRO VOLTE" Michelangelo Frammartino [Quinzaine] Best European Film Quinzaine
    Palm Dog Award for best performance by a dog

Carlos Reviriego (Cahiers du Cinéma España, España): 10
Luciano Barisone (Panoramiques, Italia): 8
Carlo Chatrian (Panoramiques, Duellanti, Italia): 9
Eulalia Iglesias (Cahiers du Cinéma España, España): 8
Jaime Pena (El Amante, Cahiers du Cinéma España, España): 7
Violeta Kovacsis (Lumiere, España): 9
Robert Koehler: (Variety, USA): 10
Alejandro G. Calvo (Sensacine.com, España): 8
Diego Batlle (La Nación, Otros Cines, Argentina): 10
Luciano Monteagudo (Página/12, Argentina): 9

"CLEVELAND CONTRE WALL STREET" Jean-Stèphane Bron [Quinzaine]

Diego Batlle (La Nación + Otros Cines, Argentina): 7
Gonzalo de Pedro (Cahiers du Cinéma España + Público, España): 6
Carlos F. Heredero (Cahiers du Cinéma España, España): 6
Luciano Barisone (Panoramiques, Italia): 7
Luciano Monteagudo (Página/12, Argentina): 5

"LA CASA MUDA" Gustavo Hernandez [Quinzaine]

Gabe Klinger (The Auteurs Notebook, USA): 0
Gonzalo de Pedro (Cahiers du Cinéma España, Público, España): 5
Robert Koehler: (Variety, USA): 0
Alejandro G. Calvo (Sensacine.com, España): 3
Roger Alan Koza (La Voz del Interior, Argentina): 0
Carlos F. Heredero (Cahiers du Cinéma España, España): 3
Jaime Pena (El Amante, Cahiers du Cinéma España, España): 2
Mark Peranson (CinemaScope, Canada): 0 (-2)
Cristina Nord (Die Tageszeitung, Deutschland): 2

"COUNTDOWN TO ZERO" Lucy Walker

Carlos F. Heredero (Cahiers du Cinéma España, España): 4
Rüdiger Suchsland (Frankfurter Allgemeine Zeitung, Artechock, Deutschland): 1

"L'AUTRE MONDE" Gilles Marchand

Carlos Reviriego (Cahiers du Cinéma España, España): 4
Emmanuel Burdeau (Mediapart, France): 7
Olivier Père (Director artístico Festival de Locarno, France): 2

"R U THERE" David Verbeek [Un Certain Regard]

Diego Batlle (La Nación, Otros Cines, Argentina): 6
Roger Alan Koza (La Voz del Interior, Argentina): 7
Leonardo D'Espósito (Crítica de la Argentina, Argentina): 4
Jaime Pena (El Amante, Cahiers du Cinéma España, España): 4
Diego Lerer (Clarín, Micropsia, Argentina): 6
Eugenio Renzi (Independencia, France): 4
Luciano Monteagudo (Página/12, Argentina): 7
Olivier Père (Director artístico Festival de Locarno, France): 2

"PAL ADRIENN" Ágnes Kocsis [Un Certain Regard]

Eulalia Iglesias (Cahiers du Cinéma España, España): 7
Diego Lerer (Clarín, Micropsia, Argentina): 5
Eugenio Renzi (Independencia, France): 5
Luciano Barisone (Panoramiques, Italia): 7

"LA PRINCESSE DE MONTPENSIER (THE PRINCESS OF MONTPENSIER)" Bertrand Tavernier [Competition]

Francisco Ferreira (O Expresso, Portugal): 1
Cristina Nord (Die Tageszeitung, Deutschland): 5
Eulalia Iglesias (Cahiers du Cinéma España, España): 4
Fernando Ganzo (Lumiere, España): 3
Scott Foundas (Filmlinc, USA): 8
Manu Yáñez (Fotogramas, España): 4
Leonardo D'Espósito (Crítica de la Argentina, Argentina): 5
Carlos F. Heredero (Cahiers du Cinéma España, España): 5
Jaime Pena (El Amante, Cahiers du Cinéma España, España): 1
Markus Keuschnigg (ORF Radio FM4, Die Presse, Austria): 8
Luciano Monteagudo (Página/12, Argentina): 5
Violeta Kovacsis (Lumiere, España): 5
Rüdiger Suchsland (Frankfurter Allgemeine Zeitung, Artechock, Deutschland): 7
# Screen Daily (0-4)
Jose Carlos Avellar  5
Michel Clement       9
Alberto Crespi       2.5
Nick James           5
Bo Green Jensen      5
Derek Malcolm        7.5
Jan Schulz-Ojala     2.5
David Stratton       9  
Screen International 7.5

"SOMOS LO QUE HAY" Jorge Michel Grau [Quinzaine]

Roger Alan Koza (La Voz del Interior, Argentina): 4
Paolo Bertolin (Cineforum, Italia): 8
Gonzalo de Pedro (Cahiers du Cinéma España, Público, España): 0
Carlos Reviriego (Cahiers du Cinéma España, España): 0
Markus Keuschnigg (ORF Radio FM4, Die Presse, Austria): 6
Rüdiger Suchsland (Frankfurter Allgemeine Zeitung, Artechock, Deutschland): 2

"INSIDE JOB" Charles Fergusson

Carlos F. Heredero (Cahiers du Cinéma España, España): 8
Robert Koehler: (Variety, USA): 4
Jaime Pena (El Amante, Cahiers du Cinéma España, España): 8,5
Gonzalo de Pedro (Cahiers du Cinéma España, Público, España): 6
Eulalia Iglesias (Cahiers du Cinéma España, España): 7,5
Scott Foundas (Filmlinc, USA): 9
Manu Yáñez (Fotogramas, España): 6
Violeta Kovacsis (Lumiere, España): 6
Rüdiger Suchsland (Frankfurter Allgemeine Zeitung, Artechock, Deutschland): 7,5

"BELLE ÉPINE" Rebecca Zlotowski [Semaine]

Fernando Ganzo (Lumiere, España): 6
Olivier Père (Director artístico Festival de Locarno, France): 7
Gabe Klinger (The Auteurs Notebook, USA): 6
Robert Koehler: (Variety, USA): 7
Rüdiger Suchsland (Frankfurter Allgemeine Zeitung, Artechock, Deutschland): 8
Scott Foundas (Filmlinc, USA): 5

"SANDCASTLE" Boo Junfeng [Semaine]

Roger Alan Koza (La Voz del Interior, Argentina): 5
Paolo Bertolin (Cineforum, Italia): 7
Carlo Chatrian (Panoramiques, Duellanti, Italia): 5
Luciano Barisone (Panoramiques, Italia): 5

"ABEL" Diego Luna

Roger Alan Koza (La Voz del Interior, Argentina): 3

"RUBBER" Quentin Dupieux [Semaine]

Olivier Père (Director artístico Festival de Locarno, France): 8
Leonardo D'Espósito (Crítica de la Argentina, Argentina): 8
Robert Koehler: (Variety, USA): 6
Markus Keuschnigg (ORF Radio FM4, Die Presse, Austria): 7
Jaime Pena (El Amante, Cahiers du Cinéma España, España): 6,5

"KABOOM" Gregg Araki

Robert Koehler: (Variety, USA): 7
Jaime Pena (El Amante, Cahiers du Cinéma España, España): 6
Paolo Bertolin (Cineforum, Italia): 8
Markus Keuschnigg (ORF Radio FM4, Die Presse, Austria): 7
Carlo Chatrian (Panoramiques, Duellanti, Italia): 6

"LES AMOURS IMAGINAIRES (HEARTBEATS)" Xavier Dolan [Un Certain Regard]

Diego Batlle (La Nación, Otros Cines, Argentina): 7
Olivier Père (Director artístico Festival de Locarno, France): 0
Diego Lerer (Clarín, Micropsia, Argentina): 6
Jaime Pena (El Amante, Cahiers du Cinéma España, España): 4
Paolo Bertolin (Cineforum, Italia): 10
Luciano Barisone (Panoramiques, Italia): 4
Carlos Reviriego (Cahiers du Cinéma España, España): 2
Eulalia Iglesias (Cahiers du Cinéma España, España): 6
Carlos F. Heredero (Cahiers du Cinéma España, España): 4 
Carlo Chatrian (Panoramiques, Duellanti, Italia): España, España): 3
Violeta Kovacsis (Lumiere, España): 4

"UNTER DIR DIE STADT (THE CITY BELOW)" Christoph Hochhäussler [Un Certain Regard]

Emmanuel Burdeau (Mediapart, France): 3
Diego Batlle (La Nación, Otros Cines, Argentina): 6
Robert Koehler: (Variety, USA): 3
Diego Lerer (Clarín, Micropsia, Argentina): 6
Olivier Père (Director artístico Festival de Locarno, France): 5
Cristina Nord (Die Tageszeitung, Deutschland): 6
Leonardo D'Espósito (Crítica de la Argentina, Argentina): 2
Alejandro G. Calvo (Sensacine.com, España): 5
Fernando Ganzo (Lumiere, España): 3
Luciano Barisone (Panoramiques, Italia): 7
Carlos Reviriego (Cahiers du Cinéma España, España): 3
Francisco Ferreira (O Expresso, Portugal): 8
Jaime Pena (El Amante, Cahiers du Cinéma España, España): 3
Luciano Monteagudo (Página/12, Argentina): 6
Carlo Chatrian (Panoramiques, Duellanti, Italia): 7
Violeta Kovacsis (Lumiere, España): 4
Rüdiger Suchsland (Frankfurter Allgemeine Zeitung, Artechock, Deutschland): 6,5

"UN HOMME QUI CRIE (A SCREAMING MAN)" Mahamat-Saleh Haroun [Competition]

Gabe Klinger (The Auteurs Notebook, USA): 6
Robert Koehler: (Variety, USA): 8
Alejandro G. Calvo (Sensacine.com, España): 8
Fernando Ganzo (Lumiere, España): 5
Scott Foundas (Filmlinc, USA): 6
Jaime Pena (El Amante, Cahiers du Cinéma España, España): 6
Diego Lerer (Clarín, Micropsia, Argentina): 6
Luciano Barisone (Panoramiques, Italia): 7
Gonzalo de Pedro (Cahiers du Cinéma España, Público, España): 7
Carlos Reviriego (Cahiers du Cinéma España, España): 7
Cristina Nord (Die Tageszeitung, Deutschland): 6
Francisco Ferreira (O Expresso, Portugal): 6
Eulalia Iglesias (Cahiers du Cinéma España, España): 6
Diego Batlle (La Nación, Otros Cines, Argentina): 6
Roger Alan Koza (La Voz del Interior, Argentina): 6,5
Manu Yáñez (Fotogramas, España): 7
Carlos F. Heredero (Cahiers du Cinéma España, España): 5
Luciano Monteagudo (Página/12, Argentina): 7
Violeta Kovacsis (Lumiere, España): 5
Rüdiger Suchsland (Frankfurter Allgemeine Zeitung, Artechock, Deutschland): 4
# Screen Daily (0-4)
Jose Carlos Avellar  7.5
Michel Clement       5
Alberto Crespi       5
Nick James           7.5
Bo Green Jensen      7.5
Derek Malcolm        7.5
Jan Schulz-Ojala     2.5
David Stratton       5  
Screen International 5

"ANOTHER YEAR" Mike Leigh [Competition]

Francisco Ferreira (O Expresso, Portugal): 2
Eulalia Iglesias (Cahiers du Cinéma España, España): 4
Alejandro G. Calvo (Sensacine.com, España): 7
Diego Batlle (La Nación, Otros Cines, Argentina): 6
Robert Koehler: (Variety, USA): 1
Leonardo D'Espósito (Crítica de la Argentina, Argentina): 4
Violeta Kovacsis (Lumiere, España): 4
Diego Lerer (Clarín, Micropsia, Argentina): 4
Cristina Nord (Die Tageszeitung, Deutschland): 2
Roger Alan Koza (La Voz del Interior, Argentina): 2
Carlos F. Heredero (Cahiers du Cinéma España, España): 6
Luciano Monteagudo (Página/12, Argentina): 4
Scott Foundas (Filmlinc, USA): 9
Jaime Pena (El Amante, Cahiers du Cinéma España, España): 2,5
Luciano Barisone (Panoramiques, Italia): 6
Carlos Reviriego (Cahiers du Cinéma España, España): 5,5
Carlo Chatrian (Panoramiques, Duellanti, Italia): 6
Rüdiger Suchsland (Frankfurter Allgemeine Zeitung, Artechock, Deutschland): 0
# Screen Daily (0-4)
Jose Carlos Avellar  9
Michel Clement       9
Alberto Crespi       7.5
Nick James           7.5
Bo Green Jensen      7.5
Derek Malcolm        9
Jan Schulz-Ojala     9
David Stratton       7.5
Screen International 7.5

"YOU WILL MEET A TALL DARK STRANGER" Woody Allen

Francisco Ferreira (O Expresso, Portugal): 2
Eulalia Iglesias (Cahiers du Cinéma España, España): 7
Luciano Monteagudo (Página/12, Argentina): 5
Alejandro G. Calvo (Sensacine.com, España): 5
Gabe Klinger (The Auteurs Notebook, USA): 5
Diego Batlle (La Nación, Otros Cines, Argentina): 6
Leonardo D'Espósito (Crítica de la Argentina, Argentina): 5
Markus Keuschnigg (ORF Radio FM4, Die Presse, Austria): 4
Carlos F. Heredero (Cahiers du Cinéma España, España): 5
Diego Lerer (Clarín, Micropsia, Argentina): 5
Violeta Kovacsis (Lumiere, España): 6
Scott Foundas (Filmlinc, USA): 6
Carlos Reviriego (Cahiers du Cinéma España, España): 5
Manu Yáñez (Fotogramas, España): 4

"PETIT BÉBÉ JÉSUS DE FLANDR" Gust Van den Berghe [Quinzaine]

Jaime Pena (El Amante, Cahiers du Cinéma España, España): 0
Eulalia Iglesias (Cahiers du Cinéma España, España): 2
Gonzalo de Pedro (Cahiers du Cinéma España, Público, España): 0
Paolo Bertolin (Cineforum, Italia): 4

"LA MIRADA INVISIBLE" Diego Lerman [Quinzaine]

Diego Batlle (La Nación, Otros Cines, Argentina): 7
Diego Lerer (Clarín, Micropsia, Argentina): 7
Roger Alan Koza (La Voz del Interior, Argentina): 7
Leonardo D'Espósito (Crítica de la Argentina, Argentina): 6
Jaime Pena (El Amante, Cahiers du Cinéma España, España): 6,5
Gonzalo de Pedro (Cahiers du Cinéma España, Público, España): 6
Eulalia Iglesias (Cahiers du Cinéma España, España): 6
Alejandro G. Calvo (Sensacine.com, España): 5
Emmanuel Burdeau (Mediapart, France): 4
Manu Yáñez (Fotogramas, España): 5
Carlos F. Heredero (Cahiers du Cinéma España, España): 6
Carlos Reviriego (Cahiers du Cinéma España, España): 5

"AURORA" Cristi Puiu [Un Certain Regard]

Alejandro G. Calvo (Sensacine.com, España): 7
Diego Batlle (La Nación, Otros Cines, Argentina): 8
Robert Koehler: (Variety, USA): 7
Diego Lerer (Clarín, Micropsia, Argentina): 8
Leonardo D'Espósito (Crítica de la Argentina, Argentina): 7
Cristina Nord (Die Tageszeitung Deutschland): 8
Violeta Kovacsis (Lumiere, España): 8
Luciano Barisone (Panoramiques, Italia): 8
Carlo Chatrian (Panoramiques, Duellanti, Italia): 7
Jaime Pena (El Amante, Cahiers du Cinéma España, España): 9
Gonzalo de Pedro (Cahiers du Cinéma España, Público, España): 8
Paolo Bertolin (Cineforum, Italia): 7
Francisco Ferreira (O Expresso, Portugal): 7
Eulalia Iglesias (Cahiers du Cinéma España, España): 7,5
Luciano Monteagudo (Página/12, Argentina): 8
Scott Foundas (Filmlinc, USA): 10
Carlos Reviriego (Cahiers du Cinéma España, España): 8
Carlos F. Heredero (Cahiers du Cinéma España, España): 9
Rüdiger Suchsland (Frankfurter Allgemeine Zeitung, Artechock, Deutschland): 7

"SVET-AKE" Aktan Arym Kubat [Quinzaine]

Gonzalo de Pedro (Cahiers du Cinéma España, Público, España): 2
Olivier Père (Director artístico Festival de Locarno, France): 7
Leonardo D'Espósito (Crítica de la Argentina, Argentina): 6
Paolo Bertolin (Cineforum, Italia): 8

"UN POISON VIOLENT (A GIFT)" Katell Quillévéré [Quinzaine]

Fernando Ganzo (Lumiere, España): 2
Diego Lerer (Clarín, Micropsia, Argentina): 4
Leonardo D'Espósito (Crítica de la Argentina, Argentina): 3
Carlo Chatrian (Panoramiques, Duellanti, Italia): 6
Jaime Pena (El Amante, Cahiers du Cinéma España, España): 5,5
Francisco Ferreira (O Expresso, Portugal): 5
Eulalia Iglesias (Cahiers du Cinéma España, España): 6,5
Luciano Monteagudo (Página/12, Argentina): 5
Alejandro G. Calvo (Sensacine.com, España): 5
Gabe Klinger (The Auteurs Notebook, USA): 6
Emmanuel Burdeau (Mediapart, France): 7
Diego Batlle (La Nación, Otros Cines, Argentina): 4
Robert Koehler: (Variety, USA): 4
Carlos Reviriego (Cahiers du Cinéma España, España): 6

"SHIT YEAR" Cam Archer [Quinzaine]

Olivier Père (Festival de Locarno, France): 0
Gonzalo de Pedro (Cahiers du Cinéma España, Público, España): 2
Markus Keuschnigg (ORF Radio FM4, Die Presse, Austria): 6
Paolo Bertolin (Cineforum, Italia): 8
Mark Peranson (CinemaScope, Canada): 0,2

"LIONS LOVE... (AND LIES)" 1969 Agnès Varda

Gonzalo de Pedro (Cahiers du Cinéma España, Público, España): 8

"CHATROOM" Hideo Nakata [Un Certain Regard]

Diego Batlle (La Nación, Otros Cines, Argentina): 3
Gonzalo de Pedro (Cahiers du Cinéma España, Público, España): 2
Robert Koehler: (Variety, USA): 1
Diego Lerer (Clarín, Micropsia, Argentina): 2
Violeta Kovacsis (Lumiere, España): 2
Carlo Chatrian (Panoramiques, Duellanti, Italia): 3
Jaime Pena (El Amante, Cahiers du Cinéma España, España): 2
Manu Yáñez (Fotogramas, España): 1
Markus Keuschnigg (ORF Radio FM4, Die Presse, Austria): 6
Rüdiger Suchsland (Frankfurter Allgemeine Zeitung, Artechock, Deutschland): 2

"WALL STREET: MONEY NEVER SLEEPS" Oliver Stone

Markus Keuschnigg (ORF Radio FM4, Die Presse, Austria):8
Alejandro G. Calvo (Sensacine.com, España): 1
Diego Batlle (La Nación, Otros Cines, Argentina): 6
Eulalia Iglesias (Cahiers du Cinéma España, España): 3
Diego Lerer (Clarín, Micropsia, Argentina): 5
Emmanuel Burdeau (Mediapart, France): 2,2
Cristina Nord (Die Tageszeitung, Deutschland): 2
Violeta Kovacsis (Lumiere, España): 4
Jaime Pena (El Amante, Cahiers du Cinéma España, España): 3
Manu Yáñez (Fotogramas, España): 4
Francisco Ferreira (O Expresso, Portugal): 3
Scott Foundas (Filmlinc, USA): 2
Carlos Reviriego (Cahiers du Cinéma España, España): 1
Carlos F. Heredero (Cahiers du Cinéma España, España): 2

"BENDA BILILI!" Florent de la Tullaye, Renaud Barret [Quinzaine]

Carlo Chatrian (Panoramiques, Duellanti, Italia): 5
Gonzalo de Pedro (Cahiers du Cinéma España, Público, España): 3

 David Gritten 4/5 http://www.telegraph.co.uk/culture/film/cannes-film-festival/7719324/Cannes-Film-Festival-2010-Benda-Bilili-review.html

"MARTI, DUPA CRACIUN  (TUESDAY, AFTER CHRISTMAS)" Radu Muntean [Un Certain Regard]

Gabe Klinger (The Auteurs Notebook, USA): 4
Robert Koehler: (Variety, USA): 8
Olivier Père (Director artístico Festival de Locarno, France): 5
Carlos F. Heredero (Cahiers du Cinéma España, España): 8
Alejandro G. Calvo (Sensacine.com, España): 6
Jaime Pena (El Amante, Cahiers du Cinéma España, España): 8
Carlos Reviriego (Cahiers du Cinéma España, España): 8
Diego Batlle (La Nación, Otros Cines, Argentina): 8
Paolo Bertolin (Cineforum. Italia): 8
Eulalia Iglesias (Cahiers du Cinéma España, España): 6,5
Diego Lerer (Clarín, Micropsia, Argentina): 7
Gonzalo de Pedro (Cahiers du Cinéma España, Público, España): 4
Cristina Nord (Die Tageszeitung, Deutschland): 7
Francisco Ferreira (O Expresso, Portugal): 6
Roger Alan Koza (La Voz del Interior, Argentina): 7
Scott Foundas (Filmlinc, USA): 8
Rüdiger Suchsland (Frankfurter Allgemeine Zeitung, Artechock, Deutschland): 7

"NOSTALGIA DE LA LUZ" Patricio Guzmán

Luciano Barisone (Panoramiques, Italia): 8
Carlo Chatrian (Panoramiques, Duellanti, Italia): 8
Eugenio Renzi (Independencia, France): 4
Carlos F. Heredero (Cahiers du Cinéma España, España): 8
Jaime Pena (El Amante, Cahiers du Cinéma España, España): 7,5
Luciano Monteagudo (Página/12, Argentina): 7
Eulalia Iglesias (Cahiers du Cinéma España, España): 7,5
Cristina Nord (Die Tageszeitung, Deutschland): 7
Roger Alan Koza (La Voz del Interior, Argentina): 7

"THE HOUSEMAID" Im Sang-soo [Competition]

Luciano Barisone (Panoramiques, Italia): 5
Carlo Chatrian (Panoramiques, Duellanti, Italia): 4
Robert Koehler: (Variety, USA): 3
Eugenio Renzi (Independencia, France): 5
Carlos F. Heredero (Cahiers du Cinéma España, España): 3
Olivier Père (Director artístico Festival de Locarno, France): 7
Alejandro G. Calvo (Sensacine.com, España): 6
Carlos Reviriego (Cahiers du Cinéma España, España): 5
Jaime Pena (El Amante, Cahiers du Cinéma España, España): 4
Diego Batlle (La Nación, Otros Cines, Argentina): 6
Manu Yáñez (Fotogramas, España): 5
Markus Keuschnigg (ORF Radio FM4, Die Presse, Austria): 3
Eulalia Iglesias (Cahiers du Cinéma España, España): 5
Diego Lerer (Clarín, Micropsia, Argentina): 6
Cristina Nord (Die Tageszeitung, Deutschland): 2
Violeta Kovacsis (Lumiere, España): 5
Paolo Bertolin (Cineforum, Italia): 8
Francisco Ferreira (O Expresso, Portugal): 5
Scott Foundas (Filmlinc, USA): 4
# Screen Daily (0-4)
Jose Carlos Avellar  5
Michel Clement       5
Alberto Crespi       7.5
Nick James           5
Bo Green Jensen      5
Derek Malcolm        7.5
Jan Schulz-Ojala     5
David Stratton       5
Screen International 5

"DRAQUILA - L'ITALIA CHE TREMA" Sabina Guzzanti

Alejandro G. Calvo (Sensacine.com, España): 3
Luciano Barisone (Panoramiques, Italia): 5
Emmanuel Burdeau (Mediapart, France): 5
Eugenio Renzi (Independencia, France): 5
Carlos F. Heredero (Cahiers du Cinéma España, España): 4
Jaime Pena (El Amante, Cahiers du Cinéma España, España): 4
Carlos Reviriego (Cahiers du Cinéma España, España): 5
Diego Batlle (La Nación, Otros Cines, Argentina): 6
Luciano Monteagudo (Página/12, Argentina): 5
Eulalia Iglesias (Cahiers du Cinéma España, España): 5
Diego Lerer (Clarín, Micropsia, Argentina): 5
Rüdiger Suchsland (Frankfurter Allgemeine Zeitung, Artechock, Deutschland): 5

"RIZHAO CHONGQING (CHONGQING BLUES)" Wang Xiaoshuai [Competition]

Alejandro G. Calvo (Sensacine.com, España): 3
Eulalia Iglesias (Cahiers du Cinéma España, España): 4
Luciano Barisone (Panoramiques, Italia): 4
Carlo Chatrian (Panoramiques, Duellanti, Italia): 3
Paolo Bertolin (Cineforum. Italia): 8
Violeta Kovacsis (Lumiere, España): 5
Robert Koehler: (Variety, USA): 3
Emmanuel Burdeau (Mediapart, France): 4
Eugenio Renzi (Independencia, France): 4
Carlos F. Heredero (Cahiers du Cinéma España, España): 4
Roger Alan Koza (La Voz del Interior, Argentina): 3
Jaime Pena (El Amante, Cahiers du Cinéma España, España): 3
Carlos Reviriego (Cahiers du Cinéma España, España): 2
Diego Batlle (La Nación, Otros Cines, Argentina): 4
Manu Yáñez (Fotogramas, España): 2
Luciano Monteagudo (Página/12, Argentina): 3
Diego Lerer (Clarín, Micropsia, Argentina): 4
Cristina Nord (Die Tageszeitung, Deutschland): 2
Francisco Ferreira (O Expresso, Portugal): 2
Rüdiger Suchsland (Frankfurter Allgemeine Zeitung, Artechock, Deutschland): 6
# Screen Daily (0-4)
Jose Carlos Avellar  7.5
Michel Clement       5
Alberto Crespi       5
Nick James           2.5
Bo Green Jensen      7.5
Derek Malcolm        5
Jan Schulz-Ojala     5
David Stratton       7.5
Screen International 5

"TOURNÉE (ON TOUR)" Mathieu Amalric [Competition]

Carlo Chatrian (Panoramiques Duellanti, Italia): 7
Eugenio Renzi (Independencia, France): 7,6
Emmanuel Burdeau (Mediapart, France): 7
Carlos Reviriego (Cahiers du Cinéma España, España): 8
Alejandro G. Calvo (Sensacine.com, España): 7
Diego Batlle (La Nación + Otros Cines, Argentina): 7
Carlos F. Heredero (Cahiers du Cinéma España, España): 6
Leonardo D'Espósito (Crítica de la Argentina, Argentina) 9
Diego Lerer (Clarín + Micropsia, Argentina): 8
Markus Keuschnigg (ORF Radio FM4, Die Presse, Austria): 7
Eulalia Iglesias (Cahiers du Cinéma España, España): 7
Gonzalo de Pedro (Cahiers du Cinéma España + Público, España): 8
Violeta Kovacsis (Lumiere, España): 7
Robert Koehler (Variety, USA): 5
Jaime Pena (El Amante + Cahiers du Cinéma España, España): 7,5
Scott Foundas (Filmlinc, USA): 5
Manu Yáñez (Fotogramas, España): 8
Luciano Monteagudo (Página/12, Argentina): 6
Gabe Klinger (The Auteurs Notebook, USA): 8
Olivier Père (Director artístico Festival de Locarno, France): 4
Cristina Nord (Die Tageszeitung, Deutschland): 5
Francisco Ferreira (O Expresso, Portugal): 7
Rüdiger Suchsland (Frankfurter Allgemeine Zeitung + Artechock, Deutschland): 3,5
# Screen Daily (0-4)
Jose Carlos Avellar  5
Michel Clement       5
Alberto Crespi       5
Nick James           5
Bo Green Jensen      5
Derek Malcolm        5
Jan Schulz-Ojala     7.5
David Stratton       2.5
Screen International 5

"ROBIN HOOD" Ridley Scott

Eugenio Renzi (Independencia, France): 6,9
Francisco Ferreira (O Expresso, Portugal): 3
Diego Lerer (Clarín + Micropsia, Argentina): 5
Diego Batlle (La Nación + Otros Cines, Argentina): 6
Gonzalo de Pedro (Cahiers du Cinéma España + Público, España): 2
Markus Keuschnigg (ORF Radio FM4, Die Presse, Austria): 2
Carlo Chatrian (Panoramiques Duellanti, Italia): 3
Alejandro G. Calvo (Sensacine.com, España): 3
Emmanuel Burdeau (Mediapart, France): 7
Carlos Reviriego (Cahiers du Cinéma España, España): 4
Carlos F. Heredero (Cahiers du Cinéma España, España): 4
Leonardo D'Espósito (Crítica de la Argentina, Argentina): 5
Violeta Kovacsis (Lumiere, España): 2
Eulalia Iglesias (Cahiers du Cinéma España, España): 3
Scott Foundas (Filmlinc, USA): 8 (The film maudit of Cannes already).
Jaime Pena (El Amante + Cahiers du Cinéma España, España): 5
Manu Yáñez (Fotogramas, España): 3
Luciano Monteagudo (Página/12, Argentina): 5
Rüdiger Suchsland (Frankfurter Allgemeine Zeitung + Artechock, Deutschland): 5

"."
--
http://letrasdecine.blogspot.com/2010/05
http://www.facebook.com/note.php?note_id=10150174713060012
http://rurban.xarch.at/film/Cannes2010.txt
http://rurban.xarch.at/film/Cannes2010.zip

EOF

our @critics;
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
Jose Carlos Avellar (Escrevercinema.com, Brazil)
Michel Ciment (Positif, France)
Alberto Crespi (L'Unita, Italy) 
Nick James (Sight & Sound, UK)
Bo Green Jensen (Weekandavisen Berlingske, Denmark)
Derek Malcolm (London Evening, UK)
Jan Schulz-Ojala (Der Tagesspiegel, Deutschland)
David Stratton (The Australian, Australia)
Screen International (Screen International, USA)
";

our $HEADER = <<"EOF";
<i>Second edition of the survey / poll of films at Cannes 2010.</i> - Diego Lerer<p>

<small>0-10 points, only >6.00 avg and >3 international critics [avg/num stddev]. stddev>2: <i>controversial</i>.
Official selection competition: bold)</small><p>
EOF

our $FOOTER = "
<pre>
--
http://letrasdecine.blogspot.com/2010/05
http://www.facebook.com/note.php?note_id=10150174713060012
http://www.screendaily.com/Journals/1/Files/2010/5/27/Cannes%20jury%20grid%202010.pdf

Source at http://rurban.xarch.at/film/Cannes2010.txt
Result at http://rurban.xarch.at/film/Cannes2010.sorted.html
History at http://github.com/rurban/cannes-critics-ratings/

</pre>";

$FOOTER =~ s{http://(.+)\n}{<a href="http://$1">$1</a>\n}g;
1;
