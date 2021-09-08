---
layout: post
title: "Wat heeft Archipunt te maken met de Ingenuity Mars Helicopter?"
date: 2021-09-08
author: Doeke Zanstra
category: ICT
lang: nl
---

Op 30 april 2021 keek ik op [m'n GitHub pagina][profile], en zag ik dat ik de volgende "achievement" erbij had gekregen:

> __Mars 2020 Helicopter Contributor__  
> __[Doeke Zanstra][profile]__ contributed code to 1 repository used in the [Mars 2020 Helicopter Mission][verhaal]  
> [pallets/werkzeug][pallets]

Ik was echt _totaal_ verbaasd. Hoe kan dit? Wat heb ik hieraan gedaan? Maar ik las de tekst hierboven nog een keer, en toen viel het kwartje bij me. Tijdens het werken bij [Archipunt][archipunt] heb ik aan software gewerkt wat ook gebruikt is bij het laten vliegen van een helicopter op Mars.

OK. Dit behoeft enige toelichting.

APAWA
-----

Aan het eind van 2017 was ik bij Archipunt aan het werk aan [APAWA][apawa]. Dit is een _web-applicatie_ voor het berekenen van het lokale effect (voor een specifiek adres dus) van aardbevingen. Ik kan hier verder uitleggen wat dat precies is, maar het is misschien gemakkelijker om voorgenoemde link te klikken en zelf een kijkje te nemen.

Terloops noemde ik het woord "web-applicatie": dit is de software van het internet. In feite een gewone applicatie, zoals bijvoorbeeld Microsoft Word, alleen dan voor het _web_.

En die software was ik dus aan het schrijven. Maar om het wiel niet iedere keer opnieuw uit te vinden maak ik gebruik van software componenten. En voor het web-applicatie aspect van deze software maak ik gebruik van het _open source_ component met de naam [Flask][flask].

Open source is erg handig. De broncode is beschikbaar. Zodat als je een fout tegenkomt, kun je deze analyseren. Meestal heb je zelf een fout gemaakt, en is de broncode handig om daar achter te komen. Heel, heel soms kom je iets tegen wat verbetering behoeft. Ook dan is open source handig: niet alleen de broncode is open, maar het hele proces is open. Ook verbeter trajecten. Voordat ik hier op in ga nog even het volgende.

Flask zelf bestaat ook weer uit componenten. Ik liep tegen een onvolkomenheid aan in het component _Werkzeug_ (overigens: zowel Flask als Werkzeug is niet in Amerika, maar bij onze Oosterburen bedacht).

Eén van de functionaliteiten van Werkzeug is het bepalen welke _browser_ (zoals Chrome, Safari of Firefox) een eind-gebruiker gebruikt. In een moderne applicatie wil je niet dat er een gedateerde browser gebruikt: de belangrijkste reden hiervoor is om de test-inspanning niet te groot te laten worden.

Nu was er een gebruiker die _Microsoft Edge_ (de opvolger van Internet Explorer) gebruikte. En deze werd niet herkend door _Werkzeug_, en dus ook niet door Apawa. Edge maakt onder water gebruik van hetzelfde component als Chrome, en is dus modern. Reden om Edge toe te voegen. Als je wilt zien hoe dit er exact uit ziet, [kijk dan hier][PR] voor de details.

Tot hier heb ik uitgelegd hoe software ontwikkeling kan leiden tot een toevoeging van een open source component. Maar wat heeft dit met Helicopters, Mars en NASA te maken?


Helicopters, Mars en NASA
-------------------------

Laat ik om te beginnen verwijzen naar het Engelstalige artikel [Open Source on Mars: Community powers NASA’s Ingenuity Helicopter][verhaal]. Erg interessant om te lezen. NASA maakt dus gebruik van open source code. Waarschijnlijk worden _Flask_ en dus ook _Werkzeug_ gebruikt bij _ground control_ om de helicopter aan te sturen.

In het stuk valt ook te lezen hoe men bepaald heeft welke software gebruikt werd voor het project. NASA heeft een lijst van componenten en hun versienummers aangeleverd aan GitHub, de centrale plek waar open source opgeslagen wordt.

Omdat open source ontwikkeling zich in de openbaarheid voltrekt, kan elke wijziging in open source code gekoppeld worden aan een identiteit. De lijst van componenten en hun versienummers levert dan ook een éénduidige lijst op van namen. Mijn wijziging is opgenomen in _Werkzeug versie 0.14_ en voor Ingenuity wordt versie 0.16 gebruikt. Inmiddels is versie 2.0.0 net uit. Degene die aan versies na 0.16 hebben bijgedragen worden derhalve niet genoemd bij de "achievement". Maar wellicht wordt deze code in toekomstige missies gebruikt.

Ik vond het leuk om achter dit feit te komen, en uit te zoeken hoe het precies zit. En ik hoop in de toekomst nog aan andere projecten te kunnen bijdragen.

[profile]: https://github.com/doekman/
[verhaal]: https://github.com/readme/nasa-ingenuity-helicopter
[pallets]: https://github.com/pallets/werkzeug
[archipunt]: https://archipunt.nl/
[PR]: https://github.com/pallets/werkzeug/pull/1216 "Pull Request om edge browser detectie aan Werkzeug toe te voegen"
[apawa]: https://apawa.archipunt.nl/ "Archipunt Piekgrond Acceleratie Web Applicatie."
[flask]: https://flask.palletsprojects.com/en/2.0.x/




<div class="postscript"><span>Eerder gepubliceert</span> als <a href="https://www.archipunt.nl/archipunt-op-mars/">Archipunt op Mars</a>.</div>

