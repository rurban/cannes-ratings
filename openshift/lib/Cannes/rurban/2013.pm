package Cannes::rurban::2013;

#!/usr/bin/perl -- -*- perl -*-
# Cannes 2013 Critics Ratings
# collected by Diego Lerer, ioncinema, indiewire and Reini Urban
# Recalc and sort ratings by all cannes critics from
# ??
# and 16 more western critics from http://www.ioncinema.com/ (scaled to 0-10)
# french: http://www.lefilmfrancais.com/cannes2013/quotidien/ (scale 0-4)
# http://jury.critic.de/cannes/
# http://www.screendaily.com/festivals/cannes/cannes-2013-screens-dailies/5056024.article (scale 0-4)
# us: http://www.indiewire.com/article/cannes-2012-a-guide-to-all-the-films
# http://www.indiewire.com/critic/
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
# critic.de +++ 9, ++ 7.5, + 6, +- 5, - 4, -- 2.5, --- 1

use utf8;
our $DATA= <<'EOF';

"HELI" (Amat ESCALANTE) [Competition]
  http://www.festival-cannes.fr/en/archives/ficheFilm/id/11409854/year/2013.html
Roger Alan Koza      6
Diego Batlle         4.5
Diego Lerer          6
Alex Vicente         4
Jose Luis De Lorenzo 1
Cecilia Martinez     4
Fernando Ganzo       
Eulàlia Iglesias     6
Ángel Quintana       6
José Luis Losa       7.5
Pedro Butcher        4
Kieron Corless       
Luciano Barisone     7
Carlo Chatrian       
Violeta Kovacsics    3
Luciano Monteagudo   4
Jaime Pena           4
Rüdiger Suchsland    7.5
Carlos Heredero      5.5
Robert Koehler       4
Dana Linssen         7
Cristina Nord        4.5
Francisco Ferreira   
Paolo Moretti        
Neil Young           4.5       http://www.jigsawlounge.co.uk/film/reviews/canas13/
Scott Foundas        
Marcelo Alderete     2.5
Alexandra Zawia      5.5
Boris Nelepo         1
Carlos Reviriego     6.5
Fernando Juan Lima   5
Paolo Bertolin       
Nando Salva          4
Philip Engel        7
Eugenio Renzi        
Michal Oleszczyk     7.5
Pablo O. Scholz      4.5
Alejandro G. Calvo   4
Xavi Serra           5.5
Guido Castillo       5
Ronald Rovers        7.5
Javier H. Estrada    4.5
Rose Kuo             
Pamela Bienzobas     
Alvaro Arroba        
Fredy Friedlander     
Kevin Jagernauth     5        http://blogs.indiewire.com/theplaylist/cannes-review-heli-a-beautifully-shot-but-despairing-look-at-corrupted-lives-20130515
Ryland Aldrich       6        http://www.indiewire.com/film/heli
Craig Skinner        7        http://www.heyuguys.co.uk/cannes-2013-heli-review/
Alex Billington      1.5      http://www.indiewire.com/film/heli
Patrick McGavin      3        http://www.indiewire.com/film/heli
Mike d'Angelo        4.4      http://www.avclub.com/articles/cannes-2013-day-one-sofia-coppola-offers-the-first,97832/
Michael Sennhauser            http://sennhausersfilmblog.ch/2013/05/16/cannes-13-heli-von-amat-escalante/
John Bleasdale       8      http://www.cine-vue.com/2013/05/cannes-film-festival-2013-heli-review.html
# Screen Daily (0-4)
Nick James           5
David Stratton       5
Derek Malcolm        5
Jan Schulz-Ojala     5
Jose Carlos Avellar  7.5
Dennis Lim           5
Michel Ciment        5
Kate Muir/Wendy Ide  7.5
Bo Green Jensen      7.5
Screen International 7.5
Joachim Kurz 	      	     http://www.kino-zeit.de/blog/cannes/heli
# critic.de +++ 9, ++ 7.5, + 6, +- 5, - 4, -- 2.5, --- 1
Adam Cook            2.5     http://jury.critic.de/cannes/ 
Arnaud Hée           
Christoph Huber      2.5     http://jury.critic.de/cannes/ 
Frédéric Jaeger      4       http://jury.critic.de/cannes/
Till Kadritzke       5       http://www.critic.de/film/heli-5547/
Daniel Kasman        2.5     http://jury.critic.de/cannes/ 
Michael Kienzl       6       http://jury.critic.de/cannes/ 
Marc van de Klashorst 4      http://icsfilm.org/news/184-cannes-2013-review-heli
# ioncinema 0-5
Nicolas Bell         5
Christophe Beney     7
David Calhoun        8
Per Juul Carlsen     6
#Mike d'Angelo       5
Carlos F. Heredero   4
Raffi Asdourian      
#Eric Kohn           6
Eric Lavallée        6        C+
Fabien Lemercier     6
Guy Lodge            5
Liu Min              4
Isabelle Regnier     7
Cédric Succivalli    2
Blake Williams       5
#Neil Young          5
# Le film français 0-4
Stéphanie Lamome      7.5
Arnaud Schwartz       2.5
Fabrice Leclerc       
Eric Neuhoff          2.5
Stéphane Delorme      1
Thomas Sotinel        2.5
Philippe Rouyer       1
Pierre Vavasseur      7.5
Pierre Murat          2.5
Jean Roy              2.5
Serge Kaganski        2.5
Pierre Fornerod       5
Pascal Merigeau       5
Danielle Attali       7.5
Christophe Carriére   2.5

"JEUNE & JOLIE (YOUNG & BEAUTIFUL)" (François OZON) [Competition]
  http://www.festival-cannes.fr/en/archives/ficheFilm/id/11409938/year/2013.html
Roger Koza            5.5
Diego Batlle          6
Diego Lerer           6
Alex Vicente          6
Jose Luis De Lorenzo  7
Cecilia Martinez      8
Fernando Ganzo        3.5
Eulàlia Iglesias      7
Ángel Quintana        7
José Luis Losa        6
Pedro Butcher         6
Kieron Corless        
Luciano Barisone      6
Carlo Chatrian        
Violeta Kovacsics     4
Luciano Monteagudo    5.5
Jaime Pena            5
Rüdiger Suchsland     7
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
Fernando Juan Lima    8
Paolo Bertolin        
Nando Salva           7.5
Philip Engel          7.5
Eugenio Renzi         
Michal Oleszczyk      6.5
Pablo O. Scholz       6
Alejandro G. Calvo    5.5
Xavi Serra            6
Guido Castillo        
Ronald Rovers         
Javier H. Estrada     4.5
Rose Kuo              
Pamela Bienzobas      
Alvaro Arroba        3.5
Fredy Friedlander    6
Mike d'Angelo        6.6    http://www.avclub.com/articles/cannes-2013-day-one-sofia-coppola-offers-the-first,97832/
Eric Kohn            7      http://www.indiewire.com/article/cannes-sofia-coppolas-the-bling-ring-and-francois-ozons-young-and-beautiful-find-teens-living-dangerously
Kevin Jagernauth     3      http://blogs.indiewire.com/theplaylist/review-being-young-beautiful-isnt-easy-in-francois-ozons-latest-20130516
Michael Sennhauser          http://sennhausersfilmblog.ch/2013/05/16/cannes-13-jeune-et-jolie-von-franois-ozon/
Jo Ann Titmarsh      4.5    http://www.flickeringmyth.com/2013/05/66th-cannes-film-festival-review-jeune.html
John Bleasdale       6      http://www.cine-vue.com/2013/05/cannes-film-festival-2013-jeune-et.html
# Screen Daily (0-4)
Nick James           7.5
David Stratton       2.5
Derek Malcolm        5
Jan Schulz-Ojala     5
Jose Carlos Avellar  2.5
Dennis Lim           2.5
Michel Ciment        1
Kate Muir/Wendy Ide  5
Bo Green Jensen      5
Screen International 5
Ryland Aldrich       6        http://www.indiewire.com/film/jeune-et-jolie
Craig Skinner        3        http://www.indiewire.com/film/jeune-et-jolie
Clementine Gallot    3        http://www.indiewire.com/film/jeune-et-jolie
Patrick Heidmann     6        http://www.indiewire.com/film/jeune-et-jolie
Joachim Kurz 	      	      http://www.kino-zeit.de/blog/cannes/jeune-jolie
# critic.de +++ 9, ++ 7.5, + 6, +- 5, - 4, -- 2.5, --- 1
Adam Cook            
Arnaud Hée           
Christoph Huber      
Frédéric Jaeger      6       http://www.critic.de/film/jeune-et-jolie-5534/
Till Kadritzke       7.5     http://jury.critic.de/cannes/ 
Daniel Kasman        
Michael Kienzl       5       http://jury.critic.de/cannes/ 
# ioncinema 0-5
Nicolas Bell         6
Christophe Beney     8
David Calhoun        6
Per Juul Carlsen     8
#Mike d'Angelo       7
Carlos F. Heredero   5
Raffi Asdourian      
#Eric Kohn            
Eric Lavallée        4
Fabien Lemercier     6
Guy Lodge            
Liu Min              8
Isabelle Regnier     6
Cédric Succivalli    8
Blake Williams       5
#Neil Young          
# Le film français 0-4
Stéphanie Lamome      5
Arnaud Schwartz       7.5
Fabrice Leclerc       5
Eric Neuhoff          2.5
Stéphane Delorme      1   
Thomas Sotinel        7.5
Philippe Rouyer       5
Pierre Vavasseur      7.5
Pierre Murat          7.5
Jean Roy              7.5
Serge Kaganski        5
Pierre Fornerod       5
Pascal Merigeau       5
Danielle Attali       2.5
Christophe Carriére   7.5

"TIAN ZHU DING (A TOUCH OF SIN)" (JIA Zhangke) [Competition]
  http://www.festival-cannes.fr/en/archives/ficheFilm/id/11409320/year/2013.html
Roger Koza            9
Diego Batlle          7.5
Diego Lerer           8.5     http://micropsia.otroscines.com/2013/05/cannes-2013-a-touch-of-sin-de-jia-zhang-ke-competencia/
Alex Vicente          
Jose Luis De Lorenzo  8
Cecilia Martinez      7
Fernando Ganzo        3
Eulàlia Iglesias      6.5
Ángel Quintana        8.5
José Luis Losa        7
Pedro Butcher         8.5
Kieron Corless        7.5
Luciano Barisone      8
Carlo Chatrian        5
Violeta Kovacsics     7
Luciano Monteagudo    
Jaime Pena            9
Rüdiger Suchsland    
Carlos F. Heredero    7.5
Robert Koehler        10
Dana Linssen          8
Cristina Nord         8
Francisco Ferreira    
Paolo Moretti         
Neil Young            
Scott Foundas         
Marcelo Alderete      5
Alexandra Zawia       8.5
Boris Nelepo          6
Carlos Reviriego      7.5
Fernando Juan Lima    10
Paolo Bertolin        
Nando Salva           6.5
Philip Engel          7.5
Eugenio Renzi         
Michal Oleszczyk      8.5
Pablo O. Scholz       5
Alejandro G. Calvo    4
Xavi Serra            7.5
Guido Castillo        8.5
Ronald Rovers         6.5
Javier H. Estrada     8.5
Rose Kuo              
Pamela Bienzobas      
Alvaro Arroba         4
Fredy Friedlander     8
Mike d'Angelo        5.9      http://www.avclub.com/articles/cannes-2013-day-two-iranian-director-asghar-farhad,97892/
Beatrice Behn        6        http://www.indiewire.com/film/a-touch-of-sin
Clementine Gallot    6        http://www.indiewire.com/film/a-touch-of-sin
Justin Chang                  http://variety.com/2013/film/reviews/cannes-film-review-a-touch-of-sin-1200482687/
# critic.de +++ 9, ++ 7.5, + 6, +- 5, - 4, -- 2.5, --- 1
Adam Cook            5       http://jury.critic.de/cannes/
Arnaud Hée           
Christoph Huber      9       http://jury.critic.de/cannes/
Frédéric Jaeger      7.5     http://jury.critic.de/cannes/
Till Kadritzke       
Daniel Kasman        7.5     http://jury.critic.de/cannes/
Michael Kienzl       7.5     http://www.critic.de/film/a-touch-of-sin-5598/
# Screen Daily (0-4)
Nick James           7.5
David Stratton       5
Derek Malcolm        7.5
Jan Schulz-Ojala     7.5
Jose Carlos Avellar  7.5
Dennis Lim           9
Michel Ciment        9
Kate Muir/Wendy Ide  7.5
Bo Green Jensen      5
Screen International 7.5
# ioncinema 0-5
Nicolas Bell         7
Christophe Beney     8
David Calhoun        7
Per Juul Carlsen     2
#Mike d'Angelo       6
Carlos F. Heredero   8
Raffi Asdourian                
#Eric Kohn            
Eric Lavallée        8
Fabien Lemercier     6
Guy Lodge            5
Liu Min              6
Isabelle Regnier     
Cédric Succivalli    8
Blake Williams       7
#Neil Young          
# Le film français 0-4
Stéphanie Lamome      9
Arnaud Schwartz       5
Fabrice Leclerc       
Eric Neuhoff          2.5
Stéphane Delorme      7.5   
Thomas Sotinel        5
Philippe Rouyer       9
Pierre Vavasseur      9
Pierre Murat          7.5
Jean Roy              5
Serge Kaganski        9
Pierre Fornerod       2.5
Pascal Merigeau       7.5
Danielle Attali       7.5
Christophe Carriére   5
John Bleasdale        6       http://www.cine-vue.com/2013/05/cannes-film-festival-2013-touch-of-sin.html

"LE PASSÉ (THE PAST)" (Asghar FARHADI) [Competition]
  http://www.festival-cannes.fr/en/archives/ficheFilm/id/11407556/year/2013.html
Mike d'Angelo         8.2     http://www.avclub.com/articles/cannes-2013-day-two-iranian-director-asghar-farhad,97892/
Roger Koza            
Diego Batlle          6.5
Diego Lerer           6.5
Alex Vicente          5
Jose Luis De Lorenzo  4
Cecilia Martinez      3
Fernando Ganzo        
Eulàlia Iglesias     6.5
Ángel Quintana       4.5
José Luis Losa       5
Pedro Butcher         1
Kieron Corless        2
Luciano Barisone      6
Carlo Chatrian        6
Violeta Kovacsics     5.5
Luciano Monteagudo    6
Jaime Pena            4.5
Rüdiger Suchsland    8
Carlos F. Heredero    6
Robert Koehler        5
Dana Linssen          5
Cristina Nord         7
Francisco Ferreira    
Paolo Moretti         
Neil Young            
Scott Foundas         
Marcelo Alderete      1.5
Alexandra Zawia       6
Boris Nelepo          
Carlos Reviriego      6
Fernando Juan Lima    4.5
Paolo Bertolin        
Nando Salva           8
Philip Engel          6.5
Eugenio Renzi         
Michal Oleszczyk      
Pablo O. Scholz       6.5
Alejandro G. Calvo    4.5
Xavi Serra            6.5
Guido Castillo        7
Ronald Rovers         7.5
Javier H. Estrada     4.5
Rose Kuo              
Pamela Bienzobas      
Alvaro Arroba         2.5
Fredy Friedlander     5
Eric Kohn             8       http://www.indiewire.com/article/cannes-how-asgar-farhadis-the-past-confirms-his-mastery-of-human-behavior
Lee Marshall                  http://www.screendaily.com/reviews/the-latest/the-past/5056283.article?blocktitle=Latest-Reviews&contentID=592
Kevin Jagernauth      6       http://blogs.indiewire.com/theplaylist/cannes-review-the-past-a-mostly-powerful-look-at-the-messiness-of-stasis-20130517
Ryland Aldrich        8       http://www.indiewire.com/film/the-past
Beatrice Behn         8       http://www.indiewire.com/film/the-past
Clementine Gallot     8       http://www.indiewire.com/film/the-past
Patrick Heidmann      5       http://www.indiewire.com/film/the-past
Raffi Asdourian       7       http://thefilmstage.com/reviews/cannes-review-the-past/
Joachim Kurz 	      	      http://www.kino-zeit.de/blog/cannes/le-passe
Justin Chang                  http://variety.com/2013/film/reviews/cannes-film-review-the-past-1200482880/
Adam Cook             5       http://jury.critic.de/cannes/
Arnaud Hée            5
Christoph Huber       
Frédéric Jaeger       9       http://jury.critic.de/cannes/
Till Kadritzke        6       
Daniel Kasman         5       
Michael Kienzl        7.5     http://www.critic.de/film/the-past-5535/
# Screen Daily (0-4)
Nick James           5
David Stratton       7.5
Derek Malcolm        7.5
Jan Schulz-Ojala     9
Jose Carlos Avellar  5
Dennis Lim           2.5
Michel Ciment        7.5
Kate Muir/Wendy Ide  9
Bo Green Jensen      7.5
Screen International 7.5
# ioncinema 0-5
Nicolas Bell         6
Christophe Beney     
David Calhoun        5
Per Juul Carlsen     10
#Mike d'Angelo       9
Carlos F. Heredero   6
Raffi Asdourian      7
#Eric Kohn            
Eric Lavallée        6        http://www.indiewire.com/film/the-past
Fabien Lemercier     9
Guy Lodge            5
Liu Min              9
Isabelle Regnier     
Cédric Succivalli    10
Blake Williams       4
#Neil Young          
# Le film français 0-4
Stéphanie Lamome      9
Arnaud Schwartz       7.5
Fabrice Leclerc       9
Eric Neuhoff          2.5
Stéphane Delorme      1
Thomas Sotinel        2.5
Philippe Rouyer       7.5
Pierre Vavasseur      9
Pierre Murat          9
Jean Roy              7.5
Serge Kaganski        7.5
Pierre Fornerod       7.5
Pascal Merigeau       9
Danielle Attali       7.5
Christophe Carriére   9
John Bleasdale        8        http://www.cine-vue.com/2013/05/cannes-film-festival-2013-past-review.html

"JIMMY P. (PSYCHOTHERAPY OF A PLAINS INDIAN)" (Arnaud DESPLECHIN) [Competition]
  http://www.festival-cannes.fr/en/archives/ficheFilm/id/11409900/year/2013.html
Mike d'Angelo        3.5      http://www.avclub.com/articles/cannes-2013-day-three,97927/
Roger Koza            7
Diego Batlle          7
Diego Lerer           7
Alex Vicente          7
Jose Luis De Lorenzo  4
Cecilia Martinez      5
Fernando Ganzo        4
Eulàlia Iglesias     8
Ángel Quintana       9
José Luis Losa       8
Pedro Butcher         6.5
Kieron Corless        4
Luciano Barisone      
Carlo Chatrian        6.5
Violeta Kovacsics     8
Luciano Monteagudo    6
Jaime Pena            8.5
Rüdiger Suchsland    
Carlos F. Heredero    9
Robert Koehler        7
Dana Linssen          
Cristina Nord         8
Francisco Ferreira    
Paolo Moretti         
Neil Young            
Scott Foundas         
Marcelo Alderete      6.5
Alexandra Zawia       5
Boris Nelepo          6.5
Carlos Reviriego      7
Fernando Juan Lima    4.5
Paolo Bertolin        
Nando Salva           5.5
Philip Engel          7
Eugenio Renzi         
Michal Oleszczyk      
Pablo O. Scholz       6.5
Alejandro G. Calvo    5
Xavi Serra            5
Guido Castillo        5
Ronald Rovers         1
Javier H. Estrada     8
Rose Kuo              
Pamela Bienzobas      
Alvaro Arroba         4
Fredy Friedlander    4
Adam Cook            2.5     http://jury.critic.de/cannes/
Arnaud Hée           5       http://jury.critic.de/cannes/
Christoph Huber      6       http://jury.critic.de/cannes/
Frédéric Jaeger      7.5     http://jury.critic.de/cannes/
Till Kadritzke       7.5     http://www.critic.de/film/jimmy-p-psychotherapy-of-a-plains-indian-5546/
Daniel Kasman        5       http://jury.critic.de/cannes/
Michael Kienzl       
# Screen Daily (0-4)
Nick James           5
David Stratton       5
Derek Malcolm        5
Jan Schulz-Ojala     2.5
Jose Carlos Avellar  5
Dennis Lim           
Michel Ciment        7.5
Kate Muir/Wendy Ide  2.5
Bo Green Jensen      7.5
Screen International 5
# ioncinema 0-5
Nicolas Bell         2
Christophe Beney     6
David Calhoun        5
Per Juul Carlsen     4
#Mike d'Angelo       4
Carlos F. Heredero   
Raffi Asdourian      4         
#Eric Kohn            
Eric Lavallée        4
Fabien Lemercier     6
Guy Lodge            4
Liu Min              
Isabelle Regnier     7
Cédric Succivalli    8
Blake Williams       3
#Neil Young          
# Le film français 0-4
Stéphanie Lamome      5
Arnaud Schwartz       7.5
Fabrice Leclerc       2.5
Eric Neuhoff          7.5
Stéphane Delorme      5   
Thomas Sotinel        2.5
Philippe Rouyer       7.5
Pierre Vavasseur      5
Pierre Murat          9
Jean Roy              7.5
Serge Kaganski        5
Pierre Fornerod       2.5
Pascal Merigeau       7.5
Danielle Attali       7.5
Christophe Carriére   2.5
Patrick Heidmann     4      http://www.indiewire.com/film/jimmy-picard
Clementine Gallot    8      http://www.indiewire.com/film/jimmy-picard
Jon Frosch           4      http://www.indiewire.com/film/jimmy-picard
Patrick McGavin      7      http://www.indiewire.com/film/jimmy-picard
Ryland Aldrich       6      http://www.indiewire.com/film/jimmy-picard
Kevin Jagernauth     3      http://www.indiewire.com/film/jimmy-picard
Emanuel Levy         6      http://www.indiewire.com/film/jimmy-picard
Patrick Heidmann     5      http://www.indiewire.com/film/jimmy-picard
John Bleasdale       4      http://www.cine-vue.com/2013/05/cannes-film-festival-2013-jimmy-p.html

"SOSHITE CHICHI NI NARU (Like Father, Like Son)" (KORE-EDA Hirokazu) [Competition]
  http://www.festival-cannes.fr/en/archives/ficheFilm/id/11406706/year/2013.html
Mike d'Angelo        4.2      http://www.avclub.com/articles/cannes-2013-day-three,97927/
Roger Koza            5.5
Diego Batlle          7
Diego Lerer           5
Alex Vicente          
Jose Luis De Lorenzo  9
Cecilia Martinez      9
Fernando Ganzo        
Eulàlia Iglesias     4
Ángel Quintana       5
José Luis Losa       3.5
Pedro Butcher         8
Kieron Corless        4.5
Luciano Barisone      6
Carlo Chatrian        7.5
Violeta Kovacsics     8
Luciano Monteagudo    
Jaime Pena            5.5
Rüdiger Suchsland    8
Carlos F. Heredero    6.5
Robert Koehler        
Dana Linssen          7.5
Cristina Nord         7.5
Francisco Ferreira    
Paolo Moretti         
Neil Young            
Scott Foundas         
Marcelo Alderete      5
Alexandra Zawia       5
Boris Nelepo          4
Carlos Reviriego      7.5
Fernando Juan Lima    
Paolo Bertolin        
Nando Salva           
Philip Engel          8
Eugenio Renzi         
Michal Oleszczyk      
Pablo O. Scholz       7.5
Alejandro G. Calvo    7.5
Xavi Serra            7.5
Guido Castillo        8
Ronald Rovers         
Javier H. Estrada     4
Rose Kuo              
Pamela Bienzobas      
Alvaro Arroba         
Fredy Friedlander     7
Adam Cook            5        http://jury.critic.de/cannes/
Arnaud Hée           6
Christoph Huber      6        http://jury.critic.de/cannes/
Frédéric Jaeger      7.5      http://jury.critic.de/cannes/
Till Kadritzke       7.5      http://jury.critic.de/cannes/
Daniel Kasman        
Michael Kienzl       6        http://jury.critic.de/cannes/
# Screen Daily (0-4)
Nick James           7.5
David Stratton       5
Derek Malcolm        7.5
Jan Schulz-Ojala     5
Jose Carlos Avellar  7.5
Dennis Lim           7.5
Michel Ciment        5
Kate Muir/Wendy Ide  5
Bo Green Jensen      5
Screen International 7.5
# ioncinema 0-5
Nicolas Bell         7
Christophe Beney     4
David Calhoun        7
Per Juul Carlsen     8
#Mike d'Angelo       5
Carlos F. Heredero   6
Raffi Asdourian      6
#Eric Kohn            
Eric Lavallée        
Fabien Lemercier     6
Guy Lodge            5
Liu Min              7
Isabelle Regnier     4
Cédric Succivalli    6
Blake Williams       6
#Neil Young          
# Le film français 0-4
Stéphanie Lamome      5
Arnaud Schwartz       7.5
Fabrice Leclerc       7.5
Eric Neuhoff          7.5
Stéphane Delorme      5
Thomas Sotinel        5
Philippe Rouyer       5
Pierre Vavasseur      5
Pierre Murat          1
Jean Roy              5
Serge Kaganski        7.5
Pierre Fornerod       2.5
Pascal Merigeau       2.5
Danielle Attali       9
Christophe Carriére   7.5
#criticwire
Clementine Gallot    8        http://www.indiewire.com/film/like-father-like-son
Jon Frosch           5        http://cannesreport.blogs.france24.com/article/2013/05/18/cannes-benicio-del-toro-jimmy-p-harvey-weinstein-mathieu-amalric-0
Patrick McGavin      5        http://www.indiewire.com/film/like-father-like-son
Ryland Aldrich       7        http://www.indiewire.com/film/like-father-like-son
Kevin Jagernauth     8        http://blogs.indiewire.com/theplaylist/cannes-review-like-father-like-son-a-tender-loving-portrait-of-parenthood-20130518
John Bleasdale       8        http://www.cine-vue.com/2013/05/cannes-film-festival-2013-like-father.html

"BORGMAN" (Alex VAN WARMERDAM) [Competition]
  http://www.festival-cannes.fr/en/archives/ficheFilm/id/11409861/year/2013.html
Mike d'Angelo        5.2      https://twitter.com/gemko/status/336075606947155969
Roger Koza            
Diego Batlle          
Diego Lerer           
Alex Vicente          
Jose Luis De Lorenzo  
Cecilia Martinez      
Fernando Ganzo        
Eulàlia Iglesias     3
Ángel Quintana       4
José Luis Losa       2.5
Pedro Butcher         
Kieron Corless        
Luciano Barisone      
Carlo Chatrian        
Violeta Kovacsics     3.5
Luciano Monteagudo    
Jaime Pena            4
Rüdiger Suchsland    
Carlos F. Heredero    4
Robert Koehler        
Dana Linssen          
Cristina Nord         1.5
Francisco Ferreira    
Paolo Moretti         
Neil Young            7
Scott Foundas         
Marcelo Alderete      
Alexandra Zawia       
Boris Nelepo          
Carlos Reviriego      2.5
Fernando Juan Lima    7
Paolo Bertolin        
Nando Salva           4
Philip Engel          2
Eugenio Renzi         
Michal Oleszczyk      
Pablo O. Scholz       6
Alejandro G. Calvo    3
Xavi Serra            5.5
Guido Castillo        7
Ronald Rovers         6.5
Javier H. Estrada     
Rose Kuo              
Pamela Bienzobas      
Alvaro Arroba         
Fredy Friedlander     4
Frédéric Jaeger      7.5      http://jury.critic.de/cannes/
Michael Kienzl       6        http://jury.critic.de/cannes/ 
# Screen Daily (0-4)
Nick James           5
David Stratton       5
Derek Malcolm        5
Jan Schulz-Ojala     5
Jose Carlos Avellar  1
Dennis Lim           
Michel Ciment        7.5
Kate Muir/Wendy Ide  5
Bo Green Jensen      7.5
Screen International 7.5
# ioncinema 0-5
Nicolas Bell         
Christophe Beney     
David Calhoun        
Per Juul Carlsen     
#Mike d'Angelo       
Carlos F. Heredero   
Raffi Asdourian      
#Eric Kohn            
Eric Lavallée        5
Fabien Lemercier     
Guy Lodge            
Liu Min              8
Isabelle Regnier     
Cédric Succivalli    
Blake Williams       5
#Neil Young          7
Jessica Kiang         8       http://www.indiewire.com/film/borgman
Ryland Aldrich        7       http://www.indiewire.com/film/borgman
Craig Skinner         3       http://www.indiewire.com/film/borgman
Clementine Gallot    1        http://www.indiewire.com/film/borgman
Jessica Kiang        8        http://www.indiewire.com/film/borgman
# Le film français 0-4
Stéphanie Lamome      7.5
Arnaud Schwartz       7.5
Fabrice Leclerc       5
Eric Neuhoff          2.5
Stéphane Delorme      5
Thomas Sotinel        2.5
Philippe Rouyer       7.5
Pierre Vavasseur      9
Pierre Murat          2.5
Jean Roy              5
Serge Kaganski        2.5
Pierre Fornerod       2.5
Pascal Merigeau       
Danielle Attali       2.5
Christophe Carriére   7.5
Jessica Kiang         8       http://blogs.indiewire.com/theplaylist/cannes-review-borgman-delivers-a-deliciously-dark-twisted-cannes-competition-treat-20130519
Ryland Aldrich        7       http://www.indiewire.com/film/borgman
Clementine Gallot     1.5     http://www.indiewire.com/film/borgman
John Bleasdale        8       http://www.cine-vue.com/2013/05/cannes-film-festival-2013-borgman-review.html

"INSIDE LLEWYN DAVIS" (Ethan COEN, Joel COEN) [Competition]
  http://www.festival-cannes.fr/en/archives/ficheFilm/id/11405872/year/2013.html
Mike d'Angelo         5.7     https://twitter.com/gemko/status/335841004601085952
Roger Koza            7
Diego Batlle          8
Diego Lerer           8.5
Alex Vicente          7
Jose Luis De Lorenzo  7
Cecilia Martinez      
Fernando Ganzo        8
Eulàlia Iglesias     8
Ángel Quintana       8
José Luis Losa       6
Pedro Butcher         8
Kieron Corless        
Luciano Barisone      
Carlo Chatrian        
Violeta Kovacsics     6
Luciano Monteagudo    6.5
Jaime Pena            8
Rüdiger Suchsland    
Carlos F. Heredero    7
Robert Koehler        
Dana Linssen          
Cristina Nord         8
Francisco Ferreira    
Paolo Moretti         
Neil Young            7.5      http://www.jigsawlounge.co.uk/film/reviews/canas13/
Scott Foundas         
Marcelo Alderete      
Alexandra Zawia       7.5
Boris Nelepo          
Carlos Reviriego      7.5
Fernando Juan Lima    
Paolo Bertolin        
Nando Salva           9
Philip Engel          7.5
Eugenio Renzi         
Michal Oleszczyk      
Pablo O. Scholz       7.5
Alejandro G. Calvo    7.5
Xavi Serra            9
Guido Castillo        8
Ronald Rovers         
Javier H. Estrada     6.5
Rose Kuo              
Pamela Bienzobas      
Alvaro Arroba         8
Fredy Friedlander     
# Screen Daily (0-4)
Nick James           9
David Stratton       7.5
Derek Malcolm        7.5
Jan Schulz-Ojala     7.5
Jose Carlos Avellar  5
Dennis Lim           7.5
Michel Ciment        9
Kate Muir/Wendy Ide  9
Bo Green Jensen      7.5
Screen International 9
# ioncinema 0-5
Nicolas Bell         
Christophe Beney     
David Calhoun        9
Per Juul Carlsen     
#Mike d'Angelo       
Carlos F. Heredero   7
Raffi Asdourian      
#Eric Kohn            
Eric Lavallée        7
Fabien Lemercier     
Guy Lodge            
Liu Min              10
Isabelle Regnier     
Cédric Succivalli    8
Blake Williams       7
#Neil Young          7
# Le film français 0-4
Stéphanie Lamome      7.5
Arnaud Schwartz       7.5
Fabrice Leclerc       7.5
Eric Neuhoff          7.5
Stéphane Delorme      7.5
Thomas Sotinel        7.5
Philippe Rouyer       9
Pierre Vavasseur      2.5
Pierre Murat          9
Jean Roy              5
Serge Kaganski        7.5
Pierre Fornerod       7.5
Pascal Merigeau       7.5
Danielle Attali       5
Christophe Carriére   9
Adam Cook            5      http://jury.critic.de/cannes/ 
Arnaud Hée           
Christoph Huber      1      http://jury.critic.de/cannes/ 
Frédéric Jaeger      9      http://jury.critic.de/cannes/
Till Kadritzke              
Daniel Kasman
Michael Kienzl
Tim Grierson                http://www.screendaily.com/reviews/the-latest/inside-llewyn-davis/5056390.article?blocktitle=IN-COMPETITION&contentID=40428
Clementine Gallot    9      http://www.indiewire.com/film/inside-llewyn-davis
Jon Frosch           9      http://www.indiewire.com/film/inside-llewyn-davis
Kevin Jagernauth     9      http://www.indiewire.com/film/inside-llewyn-davis
Eric Kohn            8      http://www.indiewire.com/film/inside-llewyn-davis
Ryland Aldrich       8      http://www.indiewire.com/film/inside-llewyn-davis
Patrick Heidmann     9      http://www.indiewire.com/film/inside-llewyn-davis
Jo Ann Titmarsh      10     http://www.flickeringmyth.com/2013/05/66th-cannes-film-festival-review-inside.html
John Bleasdale       10     http://www.cine-vue.com/2013/05/cannes-film-festival-2013-inside-llewyn.html

"WARA NO TATE (Shield of Straw)" (Takashi MIIKE) [Competition]
  http://www.festival-cannes.fr/en/archives/ficheFilm/id/11408059/year/2013.html
Mike d'Angelo        6.4    http://www.avclub.com/articles/cannes-2013-day-five-takashi-miike-schlocks-it-up,97957/
Diego Batlle          5
Diego Lerer           6
Eulàlia Iglesias     4
Ángel Quintana       5
José Luis Losa       5.5
Pedro Butcher         9
Violeta Kovacsics     5
Jaime Pena            6.5
Carlos F. Heredero    7
Alexandra Zawia       6
Philip Engel          2.5
Alejandro G. Calvo    4
Xavi Serra            5
Guido Castillo        3
#critic.de
Adam Cook            9       http://jury.critic.de/cannes/
Arnaud Hée           4       http://jury.critic.de/cannes/
Christoph Huber      7.5     http://jury.critic.de/cannes/
Frédéric Jaeger      
Till Kadritzke       
Daniel Kasman        
Michael Kienzl       6       http://www.critic.de/film/straw-shield-5294/
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
# criticwire
Kevin Jagernauth     1        http://blogs.indiewire.com/theplaylist/cannes-review-takashi-miikes-shield-of-straw-a-tedious-dumb-overstuffed-thriller-20130520
Ryland Aldrich       5        http://www.indiewire.com/film/shield-of-straw
Craig Skinner        6        http://www.indiewire.com/film/shield-of-straw
John Bleasdale       2       http://www.cine-vue.com/2013/05/cannes-film-festival-2013-shield-of.html


"UN CHÂTEAU EN ITALIE (A CASTLE IN ITALY)" (Valeria BRUNI TEDESCHI) [Competition]
  http://www.festival-cannes.fr/en/archives/ficheFilm/id/11409902/year/2013.html
Mike d'Angelo         2.4    https://twitter.com/gemko/status/336812768692957184
Diego Batlle          7.5
Diego Lerer           6.5
Alex Vicente          7
Cecilia Martinez      7
Eulàlia Iglesias     7
Ángel Quintana       7.5
José Luis Losa       4
Pedro Butcher         6
Violeta Kovacsics     4.5
Jaime Pena            7.5
Carlos F. Heredero    4.5
Fernando Juan Lima    7.5
Philip Engel          7.5
Guido Castillo        3
Fredy Friedlander     6
# critic.de +++ 9, ++ 7.5, + 6, +- 5, - 4, -- 2.5, --- 1
Adam Cook                    
Arnaud Hée           4       http://jury.critic.de/cannes/
Christoph Huber              
Frédéric Jaeger      6       http://jury.critic.de/cannes/
Till Kadritzke       
Daniel Kasman        
Michael Kienzl               

"BEHIND THE CANDELABRA" (Steven SODERBERGH) [Competition]
  http://www.festival-cannes.fr/en/archives/ficheFilm/id/11407636/year/2013.html
Mike d'Angelo         5.5     https://twitter.com/gemko/status/336811426758938624
Roger Koza            5.5
Diego Batlle          6.5
Diego Lerer           6.5
Alex Vicente          6
Eulàlia Iglesias     6
Pedro Butcher         6.5
Carlo Chatrian        5
Philip Engel          5
Alejandro G. Calvo    5
Guido Castillo        6
# critic.de +++ 9, ++ 7.5, + 6, +- 5, - 4, -- 2.5, --- 1
Adam Cook            7.5     http://jury.critic.de/cannes/
Arnaud Hée           
Christoph Huber              
Frédéric Jaeger      6       http://jury.critic.de/cannes/
Till Kadritzke       
Daniel Kasman        
Michael Kienzl       6       http://jury.critic.de/cannes/        
#criticwire
Jon Frosch           7    http://www.theatlantic.com/entertainment/archive/2013/05/steven-soderberghs-too-gay-liberace-movie-has-arrived-at-cannes/276095/
Caryn James          9    http://blogs.indiewire.com/carynjames/liberace
Craig Skinner        9    http://http//www.heyuguys.co.uk/cannes-2013-behind-the-candelabra-review/
Ryland Aldrich       6    http://twitchfilm.com/2013/05/cannes-2013-review-behind-the-candelabra.html
Kirk Honeycott       8    http://honeycuttshollywood.com/behind-candelabra-review/

"LA GRANDE BELLEZZA (THE GREAT BEAUTY)" (Paolo SORRENTINO) [Competition]
  http://www.festival-cannes.fr/en/archives/ficheFilm/id/11409775/year/2013.html
Mike d'Angelo         5.8     https://twitter.com/gemko/status/336597342511849473
Roger Koza            
Diego Batlle          5
Diego Lerer           7
Alex Vicente          5
Jose Luis De Lorenzo  9
Cecilia Martinez      6
Fernando Ganzo        
Eulàlia Iglesias     7.5
Ángel Quintana       3
José Luis Losa       4
Pedro Butcher         
Kieron Corless        3.5
Luciano Barisone      
Carlo Chatrian        
Violeta Kovacsics     
Luciano Monteagudo    
Jaime Pena            4
Rüdiger Suchsland    
Carlos F. Heredero    0.5
Robert Koehler        
Dana Linssen          
Cristina Nord         
Francisco Ferreira    
Paolo Moretti         
Neil Young            
Scott Foundas         
Marcelo Alderete      
Alexandra Zawia       
Boris Nelepo          
Carlos Reviriego      
Fernando Juan Lima    
Paolo Bertolin        
Nando Salva           8.5
Philip Engel          9.5
Eugenio Renzi         
Michal Oleszczyk      
Pablo O. Scholz       
Alejandro G. Calvo    9.5
Xavi Serra            
Guido Castillo        
Ronald Rovers         9
Javier H. Estrada     
Rose Kuo              
Pamela Bienzobas      
Alvaro Arroba         5.5
Fredy Friedlander     
# critic.de +++ 9, ++ 7.5, + 6, +- 5, - 4, -- 2.5, --- 1
Adam Cook            
Arnaud Hée           1       http://jury.critic.de/cannes/
Christoph Huber              
Frédéric Jaeger      2.5     http://jury.critic.de/cannes/
Till Kadritzke       2.5     http://jury.critic.de/cannes/
Daniel Kasman        
Michael Kienzl       
#criticwire
Ryland Aldrich       7       http://www.indiewire.com/film/the-great-beauty

"ONLY GOD FORGIVES" (Nicolas WINDING REFN) [Competition]
  http://www.festival-cannes.fr/en/archives/ficheFilm/id/11408165/year/2013.html
Ronald Rovers         8

"GRIGRIS" (Mahamat-Saleh HAROUN) [Competition]
  http://www.festival-cannes.fr/en/archives/ficheFilm/id/11409856/year/2013.html
Eulàlia Iglesias     5

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
Mike d'Angelo        3.2   http://www.avclub.com/articles/cannes-2013-day-one-sofia-coppola-offers-the-first,97832/
Kevin Jagernauth     4     http://blogs.indiewire.com/theplaylist/cannes-review-sofia-coppola-the-bling-ring-a-mostly-empty-exercise-in-excess-20130516
Roger Koza           5.5           
Diego Batlle         7.5
Diego Lerer          7
Alex Vicente         6.5
Jose Luis De Lorenzo 6
Cecilia Martinez     6
Fernando Ganzo       5
Eulàlia Iglesias     5.5
Ángel Quintana       5
José Luis Losa       6.5
Pedro Butcher        7
Kieron Corless       
Luciano Barisone     4
Carlo Chatrian       
Violeta Kovacsics    6
Luciano Monteagudo   7
Jaime Pena           6.5
Rüdiger Suchsland    8.5
Carlos Heredero      6
Robert Koehler       
Dana Linssen         5.5
Cristina Nord        5.5
Francisco Ferreira   
Paolo Moretti        
Neil Young           4                http://www.jigsawlounge.co.uk/film/reviews/canas13/
Scott Foundas        
Marcelo Alderete     6.5
Alexandra Zawia      3
Boris Nelepo         5.5
Carlos Reviriego     
Fernando Juan Lima   
Paolo Bertolin       
Nando Salva          6.5
Philip Engel        7.5
Eugenio Renzi        
Michal Oleszczyk     2
Pablo O. Scholz      5.5
Alejandro G. Calvo   7
Xavi Serra           5
Guido Castillo       8
Ronald Rovers        7.5
Javier H. Estrada    6.5
Rose Kuo             
Pamela Bienzobas     
Alvaro Arroba        1.5
Fredy Friedlander     
# Le film français 0-4
Stéphanie Lamome      
Arnaud Schwartz       2.5
Fabrice Leclerc       7.5
Eric Neuhoff          2.5
Stéphane Delorme      2.5   
Thomas Sotinel        7.5
Philippe Rouyer       2.5
Pierre Vavasseur      
Pierre Murat          5
Jean Roy              
Serge Kaganski        5
Pierre Fornerod       5
Pascal Merigeau       
Danielle Attali       5
Christophe Carriére   
Eric Kohn            6   http://www.indiewire.com/article/cannes-sofia-coppolas-the-bling-ring-and-francois-ozons-young-and-beautiful-find-teens-living-dangerously
Peter Bradshaw       6   http://www.guardian.co.uk/film/2013/may/16/bling-ring-cannes-2013-review
Guy Lodge            7   http://www.hitfix.com/in-contention/review-sofia-coppola-flips-the-celebrity-mirror-in-taut-smart-the-bling-ring
Mark Adams (Screen Daily, USA)               http://www.screendaily.com/reviews/the-latest/the-bling-ring/5056168.article
David Jenkins (Little White Lies blog, UK)   http://www.littlewhitelies.co.uk/features/festivals/cannes-2013-the-bling-ring-review-23895
Kaleem Aftab (The Independent, UK)   8	     http://www.independent.co.uk/arts-entertainment/films/reviews/the-bling-ring-review-emma-watson-leaves-hermoine-behind-in-sofia-coppolas-new-film-8618418.html
Cath Clarke (Time Out London, UK) 8 http://www.timeout.com/london/film/the-bling-ring
Robbie Collin (The Telegraph, UK) 8 http://www.telegraph.co.uk/culture/film/cannes-film-festival/10061235/Cannes-2013-The-Bling-Ring-review.html
Scott Foundas                  http://variety.com/2013/film/reviews/cannes-film-review-the-bling-ring-1200482052/
Graham Fuller (Vanity Fair)    http://www.vanityfair.com/hollywood/2013/06/movie-review-sofia-coppola-bling-ring
Todd McCarthy http://www.hollywoodreporter.com/movie/bling-ring/review/523429
Matt Mueller (Thompson on Hollywood, USA) http://blogs.indiewire.com/thompsononhollywood/cannes-review-coppolas-the-bling-ring
Michael Sennhauser             http://sennhausersfilmblog.ch/2013/05/16/cannes-13-the-bling-ring-von-sofia-coppola/
John Bleasdale        4        http://www.cine-vue.com/2013/05/cannes-film-festival-2013-bling-ring.html
# Criticwire
Beatrice Behn         3 	http://www.indiewire.com/film/the-bling-ring
Craig Skinner         1.5 	http://www.indiewire.com/film/the-bling-ring
Ryland Aldrich        5 	http://www.indiewire.com/film/the-bling-ring
David Sterrit         7 	http://www.indiewire.com/film/the-bling-ring
Adam Cook             6          http://mubi.com/notebook/posts/cannes-2013-dialogues-sofia-coppolas-the-bling-ring
Arnaud Hée            
Christoph Huber       5       http://jury.critic.de/cannes/
Frédéric Jaeger       5       http://jury.critic.de/cannes/
Till Kadritzke        6       http://www.critic.de/film/the-bling-ring-5396/
Daniel Kasman         2.5     http://mubi.com/notebook/posts/cannes-2013-dialogues-sofia-coppolas-the-bling-ring
Michael Kienzl        5       http://jury.critic.de/cannes/

"FRUITVALE STATION" (Ryan COOGLER) [Un Certain Regard]
  Sundance - Main Prices
Eric Kohn (Indiewire, USA) 8.3 http://www.indiewire.com/article/sundance-review-ryan-cooglers-fruitvale-renders-a-tragic-police-shooting-in-personal-terms
Todd McCarthy (The Hollywood Reporter, USA) 8 http://www.metacritic.com/movie/fruitvale-station/critic-reviews
Geoff Berkshire (Variety, USA) 5 http://www.metacritic.com/movie/fruitvale-station/critic-reviews
Roger Alan Koza      
Diego Batlle         6
Diego Lerer          5.5
Alex Vicente         
Jose Luis De Lorenzo 9
Cecilia Martinez     7
Fernando Ganzo       
Eulàlia Iglesias     4
Ángel Quintana       4.5
José Luis Losa       1
Pedro Butcher        2
Kieron Corless       
Luciano Barisone     5
Carlo Chatrian       
Violeta Kovacsics    
Luciano Monteagudo   
Jaime Pena           4
Rüdiger Suchsland    
Carlos Heredero      3
Robert Koehler       3
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
Fernando Juan Lima   4
Paolo Bertolin       
Nando Salva          1
Philip Engel        2.5
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
Fredy Friedlander     
# Le film français 0-4
Stéphanie Lamome      
Arnaud Schwartz       
Fabrice Leclerc       
Eric Neuhoff          
Stéphane Delorme      1   
Thomas Sotinel        2.5
Philippe Rouyer       2.5
Pierre Vavasseur      
Pierre Murat          1
Jean Roy              
Serge Kaganski        
Pierre Fornerod       
Pascal Merigeau       
Danielle Attali       
Christophe Carriére   
Mike d'Angelo        w/o      https://twitter.com/gemko/status/335147871613640704
Jo Ann Titmarsh      8        http://www.flickeringmyth.com/2013/05/66th-cannes-film-festival-review.html
Jessica Kiang        6        http://blogs.indiewire.com/theplaylist/cannes-review-fruitvale-station-recounts-a-tragic-true-life-story-with-good-performances-and-good-intentions-but-little-subtlety-20130517
Adam Cook                     
Arnaud Hée            
Christoph Huber       
Frédéric Jaeger      2.5     http://jury.critic.de/cannes/
Till Kadritzke       4       http://jury.critic.de/cannes/ 
Daniel Kasman         
Michael Kienzl       4       http://jury.critic.de/cannes/
John Bleasdale       10      http://www.cine-vue.com/2013/05/cannes-film-festival-2013-fruitvale.html

"L'INCONNU DU LAC (Stranger by the Lake)" (Alain GUIRAUDIE) [Un Certain Regard]
  http://www.festival-cannes.fr/en/archives/ficheFilm/id/11409923/year/2013.html
Mike d'Angelo        5       http://www.avclub.com/articles/cannes-2013-day-two-iranian-director-asghar-farhad,97892/
Roger Koza            10
Diego Batlle          8
Diego Lerer           6
Alex Vicente          
Jose Luis De Lorenzo  4
Cecilia Martinez      6
Fernando Ganzo        8
Eulàlia Iglesias     7.5
Ángel Quintana       8
José Luis Losa       
Pedro Butcher         8.5
Kieron Corless        
Luciano Barisone      7
Carlo Chatrian        
Violeta Kovacsics     8
Luciano Monteagudo    9.5
Jaime Pena            7.5
Rüdiger Suchsland    5
Carlos F. Heredero    6.5
Robert Koehler        10
Dana Linssen          7
Cristina Nord         8.5
Francisco Ferreira    
Paolo Moretti         
Neil Young            
Scott Foundas         
Marcelo Alderete      7.5
Alexandra Zawia       
Boris Nelepo          7.5
Carlos Reviriego      7
Fernando Juan Lima    8
Paolo Bertolin        7.5
Nando Salva           
Philip Engel          
Eugenio Renzi         
Michal Oleszczyk      
Pablo O. Scholz       
Alejandro G. Calvo    8
Xavi Serra            7.5
Guido Castillo        
Ronald Rovers         
Javier H. Estrada     7.5
Rose Kuo              
Pamela Bienzobas      
Alvaro Arroba         7.5
Fredy Friedlander     
# Le film français 0-4
Stéphanie Lamome      9
Arnaud Schwartz       
Fabrice Leclerc       7.5
Eric Neuhoff          5
Stéphane Delorme      7.5   
Thomas Sotinel        
Philippe Rouyer       5
Pierre Vavasseur      
Pierre Murat          7.5
Jean Roy              5
Serge Kaganski        9
Pierre Fornerod       
Pascal Merigeau       
Danielle Attali       1
Christophe Carriére   
Clementine Gallot    8       http://www.indiewire.com/film/linconnu-du-lac
# critic.de +++ 9, ++ 7.5, + 6, +- 5, - 4, -- 2.5, --- 1
Adam Cook            7.5     http://mubi.com/notebook/posts/cannes-2013-illusory-isolation-alain-guiraudies-stranger-by-the-lake
Arnaud Hée           9       
Christoph Huber              
Frédéric Jaeger      7.5     http://www.critic.de/film/linconnu-du-lac-5580/
Till Kadritzke               
Daniel Kasman        9       http://jury.critic.de/cannes/
Michael Kienzl       9       http://jury.critic.de/cannes/
John Bleasdale       4       http://www.cine-vue.com/2013/05/cannes-film-festival-2013-stranger-by.html

"MIELE" (Valeria GOLINO) [Un Certain Regard]
  (Italy premiered already Mai 1st)
Lee Marshall (Screen Daily, USA)  http://www.screendaily.com/reviews/the-latest/miele/5054710.article?blocktitle=UN-CERTAIN-REGARD&contentID=40442
Kevin Jagernauth     6        http://blogs.indiewire.com/theplaylist/cannes-review-death-lingers-lifts-in-thoughtful-miele-20130517
Jose Luis De Lorenzo  4
Cecilia Martinez      4
Luciano Barisone      7
Rüdiger Suchsland    4.5
Carlos F. Heredero    6
Robert Koehler        2.5
Alexandra Zawia       4
Fernando Juan Lima    3.5
Fredy Friedlander     7
# Le film français 0-4
Stéphanie Lamome      
Arnaud Schwartz       
Fabrice Leclerc       
Eric Neuhoff          
Stéphane Delorme         
Thomas Sotinel        5
Philippe Rouyer       2.5
Pierre Vavasseur      
Pierre Murat          
Jean Roy              
Serge Kaganski        
Pierre Fornerod       
Pascal Merigeau       
Danielle Attali       
Christophe Carriére   
Adam Cook            2.5     http://jury.critic.de/cannes/
Arnaud Hée           
Christoph Huber      
Frédéric Jaeger      
Till Kadritzke       
Daniel Kasman        
Michael Kienzl       
John Bleasdale        4      http://www.cine-vue.com/2013/05/cannes-film-festival-2013-miele-review.html

"GRAND CENTRAL" (Rebecca ZLOTOWSKI) [Un Certain Regard]
  http://www.festival-cannes.fr/en/archives/ficheFilm/id/11409904/year/2013.html
Mike d'Angelo                 https://twitter.com/gemko/status/335789145567948802
Roger Koza            
Diego Batlle          6.5
Diego Lerer           
Alex Vicente          7
Jose Luis De Lorenzo  5
Cecilia Martinez      5.5
Fernando Ganzo        0.5
Eulàlia Iglesias     7.5
Ángel Quintana       6.5
José Luis Losa       8
Pedro Butcher         
Kieron Corless        
Luciano Barisone      
Carlo Chatrian        
Violeta Kovacsics     
Luciano Monteagudo    5.5
Jaime Pena            8
Rüdiger Suchsland    8.5
Carlos F. Heredero    7
Robert Koehler        2
Dana Linssen          
Cristina Nord         7
Francisco Ferreira    
Paolo Moretti         
Neil Young            
Scott Foundas         
Marcelo Alderete      
Alexandra Zawia       4
Boris Nelepo          
Carlos Reviriego      7.5
Fernando Juan Lima    8
Paolo Bertolin        
Nando Salva           
Philip Engel          9
Eugenio Renzi         
Michal Oleszczyk      
Pablo O. Scholz       5.5
Alejandro G. Calvo    6.5
Xavi Serra            6.5
Guido Castillo        6
Ronald Rovers         3.5
Javier H. Estrada     8
Rose Kuo              
Pamela Bienzobas      
Alvaro Arroba         
Fredy Friedlander     9
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
Adam Cook            2.5    http://jury.critic.de/cannes/
Arnaud Hée           2.5
Christoph Huber      4      http://jury.critic.de/cannes/
Frédéric Jaeger      9      http://www.critic.de/film/grand-central-5586/
Till Kadritzke       9      http://jury.critic.de/cannes/
Daniel Kasman               
Michael Kienzl       6      http://jury.critic.de/cannes/
Lee Marshall                http://www.screendaily.com/reviews/the-latest/grand-central/5056361.article?blocktitle=Cannes-Reviews&contentID=1842
Jessica Kiang        7      http://blogs.indiewire.com/theplaylist/cannes-review-grand-central-weaves-a-lyrical-tale-of-love-and-radiation-around-tahar-rahim-lea-seydoux-20130519
John Bleasdale       8      http://www.cine-vue.com/2013/05/cannes-film-festival-2013-grand-central.html


"BENDS" (Flora LAU) [Un Certain Regard]
  http://www.festival-cannes.fr/en/archives/ficheFilm/id/11404616/year/2013.html
Mike d'Angelo              https://twitter.com/gemko/status/336075030393913344
Diego Lerer           6
Ángel Quintana        4
José Luis Losa        3
Jaime Pena            4.5
Rüdiger Suchsland     4.5
Carlos F. Heredero    4.5
Robert Koehler        7
Carlos Reviriego      5
Pablo O. Scholz       5
Javier H. Estrada     5.5
Adam Cook            5       http://jury.critic.de/cannes/ 
Tim Grierson                 http://www.screendaily.com/reviews/the-latest/bends/5056354.article?blocktitle=The-Latest&contentID=598

"L'IMAGE MANQUANTE (The missing picture)" (Rithy PANH) [Un Certain Regard]
  http://www.festival-cannes.fr/en/archives/ficheFilm/id/11409770/year/2013.html
Roger Koza            7.5
Diego Batlle          7.5
Diego Lerer           8.5
Alex Vicente          
Jose Luis De Lorenzo
Cecilia Martinez      
Fernando Ganzo        6
Eulàlia Iglesias     8.5
Ángel Quintana       8.5
José Luis Losa       8.5
Pedro Butcher         
Kieron Corless        6.5
Luciano Barisone      
Carlo Chatrian        8
Violeta Kovacsics     7
Luciano Monteagudo    
Jaime Pena            6
Rüdiger Suchsland     
Carlos F. Heredero    8
Robert Koehler        8
Dana Linssen          
Cristina Nord         
Francisco Ferreira    
Paolo Moretti         
Neil Young            
Scott Foundas         
Marcelo Alderete      
Alexandra Zawia       8.5
Boris Nelepo          6
Carlos Reviriego      8.5
Fernando Juan Lima    10
Paolo Bertolin        
Nando Salva           
Philip Engel          7.5
Eugenio Renzi         
Michal Oleszczyk      
Pablo O. Scholz       8
Alejandro G. Calvo    9
Xavi Serra            
Guido Castillo        8.5
Ronald Rovers         
Javier H. Estrada     6.5
Rose Kuo              
Pamela Bienzobas      
Alvaro Arroba         6.5
Fredy Friedlander     
# critic.de
Adam Cook            6       http://jury.critic.de/cannes/ 
Arnaud Hée           7.5
Christoph Huber      9       http://jury.critic.de/cannes/ 
Frédéric Jaeger      
Till Kadritzke       
Daniel Kasman        6       http://jury.critic.de/cannes/ 
Michael Kienzl       7.5     http://www.critic.de/film/limage-manquante-5582/

"DEATH MARCH" (Adolfo ALIX JR.) [Un Certain Regard]
  http://www.festival-cannes.fr/en/archives/ficheFilm/id/11409819/year/2013.html
Diego Lerer           4
Ángel Quintana       6
Rüdiger Suchsland    2
Fernando Juan Lima    2
Guido Castillo        1
Javier H. Estrada     7.5
Christoph Huber      4        http://jury.critic.de/cannes/ 

"OMAR" (Hany ABU-ASSAD) [Un Certain Regard]
  http://www.festival-cannes.fr/en/archives/ficheFilm/id/11409601/year/2013.html
Jose Luis De Lorenzo  5
Guido Castillo        7
Ronald Rovers         6
Frédéric Jaeger       4       http://jury.critic.de/cannes/
Jon Frosch            6       http://www.indiewire.com/film/omar
Ryland Aldrich        7       http://www.indiewire.com/film/omar

"AS I LAY DYING" (James FRANCO) [Un Certain Regard]
  http://www.festival-cannes.fr/en/archives/ficheFilm/id/11406263/year/2013.html
Mike d'Angelo         0     https://twitter.com/gemko/status/336597474598858752
Roger Koza            5
Diego Batlle          3
Diego Lerer           4
Alex Vicente          4
Jose Luis De Lorenzo  2
Cecilia Martinez      1
Ángel Quintana       5.5
José Luis Losa       3
Jaime Pena            2
Rüdiger Suchsland    5.5
Alexandra Zawia       1.5
Alejandro G. Calvo    8
Guy Lodge             3       https://twitter.com/GuyLodge/status/336511757117960192
Beatrice Behn                 http://www.kino-zeit.de/blog/cannes/as-i-lay-dying

"SARAH PRÉFÈRE LA COURSE (SARAH PREFERS TO RUN)" (Chloé ROBICHAUD) [Un Certain Regard]
  http://www.festival-cannes.fr/en/archives/ficheFilm/id/11409764/year/2013.html
Carlo Chatrian        5
Rüdiger Suchsland    6

"LES SALAUDS (BASTARDS)" (Claire DENIS) [Un Certain Regard]
  http://www.festival-cannes.fr/en/archives/ficheFilm/id/11409929/year/2013.html
Diego Batlle          7.5
Diego Lerer           9
Alex Vicente          6
Eulàlia Iglesias     8
Violeta Kovacsics     9
Boris Nelepo          3
Philip Engel          8
Guido Castillo        8
# critic.de +++ 9, ++ 7.5, + 6, +- 5, - 4, -- 2.5, --- 1
Adam Cook                    
Arnaud Hée                   
Christoph Huber              
Frédéric Jaeger      7.5     http://jury.critic.de/cannes/
Till Kadritzke       9       http://jury.critic.de/cannes/
Daniel Kasman        7       http://jury.critic.de/cannes/
Michael Kienzl               

"WAKOLDA" (Lucía PUENZO) [Un Certain Regard]
  http://www.festival-cannes.fr/en/archives/ficheFilm/id/11412006/year/2013.html

"LA JAULA DE ORO" (Diego QUEMADA-DIEZ) [Un Certain Regard]
  http://www.festival-cannes.fr/en/archives/ficheFilm/id/11409875/year/2013.html

"MY SWEET PEPPER LAND" (Hiner SALEEM) [Un Certain Regard]
  http://www.festival-cannes.fr/en/archives/ficheFilm/id/11416039/year/2013.html

"NORTE, HANGGANAN NG KASAYSAYAN (NORTE, THE END OF HISTORY)" (Lav DIAZ) [Un Certain Regard]
  http://www.festival-cannes.fr/en/archives/ficheFilm/id/11409844/year/2013.html

"TORE TANZT (NOTHING BAD CAN HAPPEN)" (Katrin GEBBE) [Un Certain Regard]
  http://www.festival-cannes.fr/en/archives/ficheFilm/id/11411998/year/2013.html

"DAST-NEVESHTEHAA NEMISOOSAND (Manuscripts Don’t Burn)" (Mohammad RASOULOF) [Un Certain Regard]
  http://www.festival-cannes.fr/en/archives/ficheFilm/id/11409842/year/2013.html

OUT OF COMPETITION

"ALL IS LOST" (J.C CHANDOR) [Out of Competition]

"BLOOD TIES" (Guillaume CANET) [Out of Competition]
Alex Vicente          5
Ángel Quintana       5.5
Pedro Butcher         5
Alexandra Zawia       1
Alejandro G. Calvo    1.5
Alvaro Arroba         3.5
Fredy Friedlander     6
# critic.de
Frédéric Jaeger      4       http://jury.critic.de/cannes/
Till Kadritzke               http://www.critic.de/film/blood-ties-5588/
Kevin Jagernauth     3       http://blogs.indiewire.com/theplaylist/cannes-review-sprawling-uneven-crime-saga-blood-ties-falls-short-of-epic-scope-20130519
Ryland Aldrich       7       http://www.indiewire.com/film/blood-ties

"LE DERNIER DES INJUSTES (THE LAST OF THE UNJUST)" (Claude LANZMANN) [Out of Competition]
Roger Koza            
Diego Batlle          9
Diego Lerer           8.5
Alex Vicente          
Jose Luis De Lorenzo  
Cecilia Martinez      
Fernando Ganzo        8
Eulàlia Iglesias     8.5
Ángel Quintana       10
José Luis Losa       10
Pedro Butcher         
Kieron Corless        
Luciano Barisone      
Carlo Chatrian        7.5
Violeta Kovacsics     
Luciano Monteagudo    
Jaime Pena            10
Rüdiger Suchsland    7.5
Carlos F. Heredero    8
Robert Koehler        5
Dana Linssen          
Cristina Nord         
Francisco Ferreira    
Paolo Moretti         
Neil Young            
Scott Foundas         
Marcelo Alderete      
Alexandra Zawia       5
Boris Nelepo          
Carlos Reviriego      
Fernando Juan Lima    
Paolo Bertolin        
Nando Salva           
Philip Engel          
Eugenio Renzi         
Michal Oleszczyk      
Pablo O. Scholz       
Alejandro G. Calvo    
Xavi Serra            
Guido Castillo        
Ronald Rovers         7.5
Javier H. Estrada     8.5
Rose Kuo              
Pamela Bienzobas      
Alvaro Arroba         10
Fredy Friedlander     8
# critic.de
Adam Cook             
Arnaud Hée            5
Christoph Huber       9      http://jury.critic.de/cannes/
Frédéric Jaeger       9      http://jury.critic.de/cannes/
Till Kadritzke        
Daniel Kasman         7.5        
Michael Kienzl        7.5    http://jury.critic.de/cannes/

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
Roger Koza            3.5
Diego Batlle          6
Diego Lerer           6.5
Alex Vicente          6
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
Violeta Kovacsics     5
Luciano Monteagudo    5
Jaime Pena            5.5
Rüdiger Suchsland     6.5       http://www.negativ-film.de/2013/05/die-letzte-party-cannes-blog-2-folge
Carlos F. Heredero    3
Robert Koehler        2
Dana Linssen          6
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
Alvaro Arroba         1.5
Fredy Friedlander     
Michael Sennhauser             http://sennhausersfilmblog.ch/2013/05/15/cannes-13-the-great-gatsby-von-baz-luhrman/
# Le film français 0-4
Stéphanie Lamome      5
Arnaud Schwartz       5
Fabrice Leclerc       7.5
Eric Neuhoff          1
Stéphane Delorme      2.5   
Thomas Sotinel        2.5
Philippe Rouyer       2.5
Pierre Vavasseur      5
Pierre Murat          
Jean Roy              5
Serge Kaganski        1
Pierre Fornerod       5
Pascal Merigeau       2.5
Danielle Attali       5
Christophe Carriére   2.5
Craig Williams        2 	http://www.indiewire.com/film/the-great-gatsby
Fico Cangiano         4
Adam Batty            3 	http://www.indiewire.com/film/the-great-gatsby
Robert Gassaway       2 	http://www.indiewire.com/film/the-great-gatsby
Yair Raveh            7 	http://www.indiewire.com/film/the-great-gatsby
Patrick Heidmann      4 	http://www.indiewire.com/film/the-great-gatsby
Adam Cook             
Arnaud Hée           
Christoph Huber       2.5     http://jury.critic.de/cannes/
Frédéric Jaeger       6       http://jury.critic.de/cannes/
Till Kadritzke        6       http://www.critic.de/film/the-great-gatsby-4168/
Daniel Kasman                 
Michael Kienzl        4       http://jury.critic.de/cannes/

"ZULU" (Jérôme SALLE) [Out of Competition]

MIDNIGHT PROJECTIONS

"MONSOON SHOOTOUT" (Amit KUMAR) [Out of Competition]
Roger Koza            3
Alejandro G. Calvo    4
#criticwire
Craig Skinner         1      http://www.indiewire.com/film/monsoon-shootout
Ryland Aldrich        5      http://www.indiewire.com/film/monsoon-shootout

"BLIND DETECTIVE (MAN TAM)" (Johnnie TO) [Out of Competition]
Mike d'Angelo        4.9      http://www.avclub.com/articles/cannes-2013-day-five-takashi-miike-schlocks-it-up,97957/
Roger Koza            8
Diego Batlle          4.5
Diego Lerer           4
Alex Vicente          
Jose Luis De Lorenzo  6.5
Cecilia Martinez      7.5
Fernando Ganzo        
Eulàlia Iglesias     
Ángel Quintana       
José Luis Losa       3
Pedro Butcher         7
Kieron Corless        
Luciano Barisone      
Carlo Chatrian        
Violeta Kovacsics     
Luciano Monteagudo    
Jaime Pena            3.5
Rüdiger Suchsland    3.5
Carlos F. Heredero    3
Robert Koehler        4
Dana Linssen          
Cristina Nord         
Francisco Ferreira    
Paolo Moretti         
Neil Young            4
Scott Foundas         
Marcelo Alderete      
Alexandra Zawia       4.5
Boris Nelepo          8
Carlos Reviriego      
Fernando Juan Lima    7
Paolo Bertolin        
Nando Salva           
Philip Engel          7
Eugenio Renzi         
Michal Oleszczyk      
Pablo O. Scholz       
Alejandro G. Calvo    5.5
Xavi Serra            
Guido Castillo        
Ronald Rovers         
Javier H. Estrada     6
Rose Kuo              
Pamela Bienzobas      
Alvaro Arroba         
Fredy Friedlander     
# critic.de
Adam Cook             7.5    http://jury.critic.de/cannes/
Arnaud Hée            4      http://jury.critic.de/cannes/
Christoph Huber       9      http://jury.critic.de/cannes/
Frédéric Jaeger       
Till Kadritzke        
Daniel Kasman         9      http://jury.critic.de/cannes/
Michael Kienzl
Craig Skinner         5      http://www.indiewire.com/film/blind-detective

SPECIAL SCREENINGS

"STOP THE POUNDING HEART" (Roberto MINERVINI) [Special Screening]
Carlo Chatrian        7.5

"OTDAT KONCI (BITE THE DUST)" (Taisia IGUMENTSEVA) [Special Screening]
José Luis Losa       6.5
Neil Young            5       http://www.jigsawlounge.co.uk/film/reviews/canas13/ 
Fernando Juan Lima    2
Pablo O. Scholz       4
Javier H. Estrada     6.5

"BOMBAY TALKIES" (Zoya AKHTAR, Dibakar BANERJEE, Karan JOHAR, Anurag KASHYAP) [Special Screening]

"SEDUCED AND ABANDONED" (James TOBACK) [Special Screening]
Mike d'Angelo        5.2      https://twitter.com/gemko/status/336076257953464321
José Luis Losa       7
Jaime Pena            6
Rüdiger Suchsland    10
Alexandra Zawia       4.5
Xavi Serra            4
Alvaro Arroba         5.5
Kevin Jagernauth     6       http://blogs.indiewire.com/theplaylist/review-seduced-and-abandoned-enjoyably-explores-the-surreal-world-of-film-financing-20130519
Ryland Aldrich       3       http://www.indiewire.com/film/seduced-abandoned

"MUHAMMAD ALI'S GREATEST FIGHT" (Stephen FREARS) [Special Screening]

"WEEKEND OF A CHAMPION" (Frank SIMON) [Special Screening]

"MAX ROSE" (Daniel NOAH) [Special Screening]


SEMAINE DE LA CRITIC

"AIN'T THEM BODIES SAINTS" (David Lowery) [Semaine]
  (Sundance)
Carlo Chatrian        5
Jaime Pena            6
Carlos F. Heredero    6.5
Guido Castillo        7.5
Sebastian Doggart (Guardian, UK) 10 http://www.guardian.co.uk/film/2013/jan/25/aint-them-bodies-saints-review
Jordan Hoffman (Film.com, USA) 8.3 http://www.metacritic.com/movie/aint-them-bodies-saints/critic-reviews
Peter Debruge (Variety, USA) 8 http://variety.com/2013/film/reviews/ain-t-them-bodies-saints-1117949039/
Todd McCarthy (The Hollywood Reporter, USA) 7 http://www.metacritic.com/movie/aint-them-bodies-saints/critic-reviews
Ethan Anderton        8       http://www.indiewire.com/film/aint-them-bodies-saints
Don Simpson           9       http://www.indiewire.com/film/aint-them-bodies-saints
Allison Loring        9       http://www.indiewire.com/film/aint-them-bodies-saints
A.A. Dowd             4       http://www.indiewire.com/film/aint-them-bodies-saints
Jordan Raup           8       http://www.indiewire.com/film/aint-them-bodies-saints
Kyle Smith (New York Post, USA) 1.5     http://www.indiewire.com/film/aint-them-bodies-saints
Sam Adams (Los Angeles Times, Philadelphia Inquirer, A.V. Club, USA) 8 http://www.indiewire.com/film/aint-them-bodies-saints
Eric Kohn             9       http://www.indiewire.com/film/aint-them-bodies-saints
Rodrigo Perez         8       http://www.indiewire.com/film/aint-them-bodies-saints
Alex Billington       8       http://www.indiewire.com/film/aint-them-bodies-saints
Till Kadritzke        7.5     http://jury.critic.de/cannes/ 

"SALVO" (Fabio Grassadonia & Antonio Piazza) [Semaine]
Roger Koza            8
Violeta Kovacsics     6
José Luis Losa        0
Jaime Pena            4.5
Fernando Juan Lima    9
Javier H. Estrada     7

"SUZANNE" (Katell Quillévéré) [Semaine]
Diego Lerer           6.5
Ángel Quintana       7.5
Jaime Pena            7
Neil Young            7    https://twitter.com/JigsawLounge/status/335140082728194048
Fredy Friedlander     7
Adam Cook            
Arnaud Hée           4
Christoph Huber      
Frédéric Jaeger      
Till Kadritzke       5
Daniel Kasman        
Michael Kienzl       

"LE DÉMANTÈLEMENT (The Dismantling)" (Sébastien Pilote) [Semaine]
Robert Koehler        2

"FOR THOSE IN PERIL" (Paul Wright) [Semaine]
Robert Koehler        4

"THE LUNCHBOX (Dabba)" (Ritesh Batra) [Semaine]
Carlo Chatrian        6.5
Robert Koehler        7

"LES RENCONTRES D’APRÈS MINUIT" (Yann Gonzalez) [Semaine]
Fernando Ganzo        6
Neil Young            5.5
Boris Nelepo          8.5
Javier H. Estrada     8.5
Alvaro Arroba         6.5
# critic.de
Adam Cook             5       http://jury.critic.de/cannes/
Arnaud Hée            6       http://jury.critic.de/cannes/

"LOS DUEÑOS" (Agustín Toscano & Ezequiel Radusky) [Semaine]
Roger Koza            7.5
Diego Batlle          7.5
Diego Lerer           6.5
Carlo Chatrian        6.5
Robert Koehler        6.5
Fernando Juan Lima    7.5
Pablo O. Scholz       7

"NOS HÉROS SONT MORTS CE SOIR" (David Perrault) [Semaine]

"THE MAJOR" (Yury Bykov) [Semaine]

"3X3D" (Peter Greenaway, Jean-Luc Godard & Edgar Perâ) [Semaine]
Jaime Pena            9
Alvaro Arroba         7
Fredy Friedlander     6


QUINZAINE

"THE CONGRESS" (Ari Folman) [Quinzaine]
Jessica Kiang        4.5  http://blogs.indiewire.com/theplaylist/cannes-review-ari-folmans-the-congress-has-too-a-little-too-much-of-everything-20130516
Guy Lodge            5	  http://www.hitfix.com/in-contention/review-robin-wright-gets-animated-in-messy-sometimes-mesmerising-the-congress
Alex Vicente          5
Fernando Ganzo        10
Kieron Corless        3.5
Jaime Pena            8
Rüdiger Suchsland    6
Carlos F. Heredero    6
Dana Linssen          6
Alejandro G. Calvo    8
Guido Castillo        4
Alvaro Arroba         10
Eric Kohn            9   http://www.indiewire.com/article/cannes-is-ari-folmans-the-congress-the-most-anti-hollywood-movie-ever-made
Adam Cook                     
Arnaud Hée            2.5     http://jury.critic.de/cannes/
Christoph Huber       
Frédéric Jaeger       
Till Kadritzke        
Daniel Kasman         
Michael Kienzl        

"THE SELFISH GIANT" (Clio Barnard) [Quinzaine]
Mike d'Angelo         6.8        http://www.avclub.com/articles/cannes-2013-day-three,97927/
Diego Batlle          7.5
Diego Lerer           7
Eulàlia Iglesias     6.5
Ángel Quintana       5.5
Kieron Corless        5
Jaime Pena            5
Neil Young            6.5        http://www.jigsawlounge.co.uk/film/reviews/canas13/
Guido Castillo        8
Ronald Rovers         7.5
Javier H. Estrada     4
Fredy Friedlander     8
Guy Lodge                        http://variety.com/2013/film/reviews/the-selfish-giant-review-1200480590/
Clementine Gallot     7          http://www.indiewire.com/film/the-selfish-giant

"UN VOYAGEUR (Ain't Misbehavin)" (Marcel Ophuls) [Quinzaine]
Roger Koza            6
Diego Batlle          8
Eulàlia Iglesias     6
Ángel Quintana       5.5
José Luis Losa       5
Kieron Corless        4
Luciano Monteagudo    8.5
Jaime Pena            3.5
Robert Koehler        0.5
Cristina Nord         7
Marcelo Alderete      2.5
Boris Nelepo          5
Pablo O. Scholz       8
Alejandro G. Calvo    6
Javier H. Estrada     5.5
Adam Cook            
Arnaud Hée           
Christoph Huber      6       http://jury.critic.de/cannes/
Frédéric Jaeger      4       http://jury.critic.de/cannes/
Till Kadritzke       
Daniel Kasman        4       http://jury.critic.de/cannes/
Michael Kienzl       

"UGLY" (Anurag Kashyap) [Quinzaine]
Kieron Corless       3
Javier H. Estrada     6
Christoph Huber      6       http://jury.critic.de/cannes/
Frédéric Jaeger      2.5     http://jury.critic.de/cannes/

"BLUE RUIN" (Jeremy Saulnier) [Quinzaine]
Eulàlia Iglesias     6.5
Ángel Quintana       6
Cristina Nord         6.5
Guido Castillo        7.5
Michael Kienzl       2.5     http://jury.critic.de/cannes/
Allan Hunter                 http://www.screendaily.com/reviews/the-latest/blue-ruin/5056353.article?blocktitle=The-Latest&contentID=598
Clementine Gallot    6    http://www.indiewire.com/film/blue-ruin
Eric Kohn                    http://www.indiewire.com/article/how-brooklyn-based-filmmaker-jeremy-saulnier-went-from-shooting-corporate-videos-to-premiering-his-movie-blue-ruin-at-cannes

"LA DANZA DE LA REALIDAD (The Dance of Reality)" (Alejandro Jodorowsky) [Quinzaine]
Roger Koza            1
Jose Luis De Lorenzo  10
Cecilia Martinez      6
Luciano Monteagudo    0.5
Rüdiger Suchsland    10
Marcelo Alderete      1
Boris Nelepo          7.5
Alvaro Arroba         3.5
Eric Kohn             7        http://www.indiewire.com/article/cannes-review-the-dance-of-reality-alejandro-jodorworskys-first-film-in-23-years-is-a-wacky-intimate-return-to-form
Christoph Huber      9       http://jury.critic.de/cannes/
Daniel Kasman        6       http://jury.critic.de/cannes/
Michael Kienzl       5       http://jury.critic.de/cannes/
Craig Skinner        9       http://www.indiewire.com/film/la-danza-de-la-realidad

"JODOROWSKY'S DUNE" (Frank Pavich) [Quinzaine]
Roger Koza            5
Eulàlia Iglesias     5.5
José Luis Losa       6
Marcelo Alderete      3
Boris Nelepo          4

"ILO ILO" (Anthony Chen) [Quinzaine]
Robert Koehler        7.5
Javier H. Estrada     6.5

"TIP TOP" (Serge Bozon) [Quinzaine]
Roger Koza            5.5
Diego Batlle          6.5
Diego Lerer           7
Fernando Ganzo        7
Eulàlia Iglesias     5.5
Ángel Quintana       5.5
Kieron Corless        6.5
Robert Koehler        6
Cristina Nord         8
Boris Nelepo          7
Fernando Juan Lima    5
#critic.de
Adam Cook            6       http://jury.critic.de/cannes/ 
Arnaud Hée           
Christoph Huber      6       http://jury.critic.de/cannes/ 
Frédéric Jaeger      
Till Kadritzke       
Daniel Kasman        5       http://jury.critic.de/cannes/ 
Michael Kienzl       

"L'ESCALE" (Kaveh Bakhtiari) [Quinzaine]
José Luis Losa       4.5
Carlo Chatrian        6.5
Robert Koehler        3.5
Javier H. Estrada     5

"EL VERANO DE LOS PECES VOLADORES (The Summer of Flying Fish)" (Marcela Said) [Quinzaine]
Roger Koza            6.5
Diego Lerer           7
Robert Koehler        4.5

"LES GARÇONS ET GUILLAUME, À TABLE ! (Me Myself and Mum)" (Guillaume Gallienne) [Quinzaine]
Robert Koehler        6.5
Arnaud Hée            5       http://jury.critic.de/cannes/

"THE LAST DAYS ON MARS" (Ruairí Robinson) [Quinzaine]
Kieron Corless        4.5
Robert Koehler        4.5
Javier H. Estrada     2.5
Arnaud Hée            2.5       http://jury.critic.de/cannes/

"A STRANGE COURSE OF EVENTS" (Raphaël Nadjari) [Quinzaine]

"WE ARE WHAT WE ARE" (Jim Mickle) [Quinzaine]
  (Sundance Midnight)
Tim Grierson (Screen Daily, USA)   http://www.screendaily.com/reviews/the-latest/we-are-what-we-are/5055835.article?blocktitle=DIRECTORS'-FORTNIGHT&contentID=40446
Eulàlia Iglesias     6.5

"ATÉ VER A LUZ" (Basil da Cunha) [Quinzaine]

"LES APACHES" (Thierry de Peretti) [Quinzaine]

"LA FILLE DU 14 JUILLET (The Rendez-Vous of Déjà-Vu)" (Antonin Peretjatko) [Quinzaine]
Fernando Ganzo        7
Carlo Chatrian        5
Arnaud Hée            5      +-  http://jury.critic.de/cannes/

"MAGIC MAGIC" (Sebastián Silva) [Quinzaine]
  (Sundance)
Fredy Friedlander     1
Sebastian Doggart (Guardian, UK) 6 http://www.guardian.co.uk/film/2013/jan/25/magic-magic-first-look-review
Russ Fischer (slashfilm.com, USA) 7
Chris Bumbray (joblo.com, USA) 7
Mark Olsen (LA Times, USA) http://articles.latimes.com/2013/jan/27/entertainment/la-et-mn-sundance-michael-cera-magic-20130126
Nicolas Bell (Ioncinema.com, Canada) http://www.ioncinema.com/reviews/magic-magic-review
Clementine Gallot    6       http://www.indiewire.com/film/magic-magic
Ethan Anderton       3       http://www.indiewire.com/film/magic-magic
Don Simpson          8       http://www.indiewire.com/film/magic-magic
Joe Bendel           4       http://www.indiewire.com/film/magic-magic
Eric Kohn            4       http://www.indiewire.com/film/magic-magic
Arnaud Hée           2.5     http://jury.critic.de/cannes/

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
Philip Engel (Go Mag, España) 
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
Dennis Lim (The New York Times, USA) 
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
# indiewire + various other
$critics[5] = "
Kevin Jagernauth (Indiewire's The Playlist, USA) 
James Rocchi (MSN Movies, Indiewire's The Playlist, USA) 
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
Brian Brooks (indieWIRE, USA) 
Chris Knipp (Filmleaf, USA)
Clementine Gallot (Cahiers du cinema, France)
Craig Skinner (Craig Skinner on Film, HeyUGuys, BleedingCool, UK)
Craig Williams (Cine Vue, UK)
David Edelstein (New York Magazine-Vulture, USA)
David Ehrlich (Movies.com, Box Office Magazine, Reverse Shot)
David Fear (Time Out New York, USA) 
David Gritten (The Telegraph, UK)
David Jenkins (Little White Lies blog, UK)
David Sterrit (Tikkun Magazine, USA)
Don Simpson (Smells Like Screen Spirit, USA)
Drew McWeeny (InContention, USA)
Drew Taylor (The Playlist, USA)
Eduardo Valente (Revista Cinema, Brazil) 
Elisabeth Quin (Paris Premiere, France) 
Emanuel Levy (EmanuelLevy.com, USA)
Eric D. Snider (Film.com, USA)
Eugene Hernandez (Film Society of Lincoln Center, USA) 
Ethan Anderton (FirstShowing.net, USA)
Fico Cangiano (CineXpress, Puerto Rico)
Frédéric Jaeger (critic.de, Deutschland)
Glenn Heath Jr. (Slant Magazine, Press Play, USA)
Ignatiy Vishnevetsky (Freelance, USA)
Jessica Kiang (The Playlist, USA)
Jo Ann Titmarsh (FlickeringMyth.com, UK)
Joachim Kurz (Kino-Zeit, Deutschland)
Joe Bendel (Libertas Film Magazine, The Epoch Times, USA)
John Bleasdale (Cine Vue, UK)
Jon Frosch (France 24, France)
Jonathan Rosenbaum (Chicago Reader, USA) 
Jordan Raup (The Film Stage, USA)
Justin Chang (Variety, USA)
Kaleen Aftab (The Independent, UK)
Karina Longworth (LA Weekly, USA) 
Keith Uhlich (Time Out New York, USA)
Kristy Puchko (Freelance, USA)
Laremy Legel (Film.com, USA) 
Leda Galanou (Flix, France)
Lee Marshall (Screen Daily, USA)
Marc van de Klashorst (IntlCinephileSociety, Netherlands)
Mark Adams (Screen Daily, USA)
Matt Holmes (Obsessedwithfilm.com, USA) 
Michael Ghennam (Les Fiches du Cinéma, France)
Michael Sennhauser (SRF, Suisse)
Michael Giltz (The Huffington Post, USA) 
Nev Pierce (Empire, USA)
Patrick Heidmann (Cineman, Deutschland)
Patrick McGavin (Light Sensitive, Stop Smiling, The Nation, US)
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
Robert Gassaway (The Flicksation Podcast, USA)
Rodrigo Perez (The Playlist, USA)
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
Yair Raveh (Cinema Scope, Israel)
";
# former apichatpoll members
$critics[6] = "
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
http://jury.critic.de/cannes/ (german),
Screen Daily (US/UK mainstream),
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
http://www.ioncinema.com/
History at https://github.com/rurban/cannes-rurban.rhcloud.com/commits/master/

</pre>";

$HEADER =~ s{(https?)://(.+?) }{<a href="$1://$2">$2</a> }g;
$FOOTER =~ s{(https?)://(.+)\n}{<a href="$1://$2">$2</a>\n}g;
1;
