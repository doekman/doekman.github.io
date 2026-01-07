---
layout: post
title: "Open Tab's on My Devices"
date: 2026-01-06
author: Doeke Zanstra
category: ICT
---

Below are the links on the internet-tab's I found on my devices. I did a virtual cleanup of my browsers. I'll keep the links for reference, but I doubt I'll need them again. The list is obviously slightly redacted.

I used [these instructions](https://www.idownloadblog.com/2025/10/17/copy-all-open-tab-links-safari/#On-iPhone) (I'm using Safari on my Apple devices) to save the links. With the use of an editor and macro's, I converted the list to MarkDown. However, the iPhone-list didn't come with titles, so I wrote a [simple Python script](https://gist.github.com/doekman/121cc8e71368aaf2396f97b232b58f2a) to fetch the titles. I did get around 10 `403 Forbidden` responses, they probably thought I was an AI crawler. I fixed the titles by hand. Then I did a visual inspection, and fixed some other problems (no `|` allowed in MarkDown link-text? Some WFT-8 problems with my script). 

<html>
<p>
    To add some actual use to this page, I've added the following button (style by <a href="https://codepen.io/zastrow/pen/eYxvQZW">this CodePen</a>):
    <br>
    <button onclick='window.open(getRandomLink());'>I'm feeling adventurous and nostalgic</button>
</p>
<script>
    function getRandomLink() {
        const nr_of_links_above = 3;
        let container = document.getElementsByClassName('post-content')[0];
        let links = container.getElementsByTagName('A');
        let nr = Math.floor(Math.random() * (links.length - nr_of_links_above) + nr_of_links_above);
        let link = links[nr];
        console.info("Opening link nr %s.", nr, links);
        return link.href;
    }
</script>
<style>
    header {
        
    }
    body {
    	font-family: "Lucida Grande", system-ui, sans-serif;
    	min-height: 100vh;
        /*
    	display: flex;
    	justify-content: center;
    	align-items: center;
        */
    	background-image: repeating-linear-gradient(
    		#fff 0%,
    		#fff 50%,
    		#f0f0f0 50%,
    		#f0f0f0 100%
    	);
    	background-size: 0.5ch 0.5ch;
    	/* Try changing these values to change the color	 */
    	--light-adjust: 0%;
    	--chroma-base: 41; /* Default: 41 */
    	--chroma-range: 13; /* Default: 13 */
    	--hue-base: 267deg; /* Default: 267deg */
    }

    button {
    	appearance: none;
    	font-family: inherit;
    	font-size: 1rem;
    	text-shadow: 0 0.25ch 0.25ch
    		lch(calc(30% + var(--light-adjust)) var(--chroma-base) var(--hue-base) / 50%);
    	position: relative;
    	border: none;
    	color: lch(0% 0 0deg);
    }

    button,
    button::after {
    	border-radius: 1.5ch;
    	padding: 0.5ch 1.5ch;
    	background-color: lch(
    		calc(98% + var(--light-adjust))
    			calc(var(--chroma-base) + (var(--chroma-range) * 2)) var(--hue-base) / 50%
    	);
    	box-shadow: inset 0 0 0.05ch 0.025ch
    			lch(
    				calc(100% + var(--light-adjust))
    					calc(var(--chroma-base) + var(--chroma-range)) var(--hue-base) / 10%
    			),
    		inset 0 0 0.1ch 0.05ch
    			lch(
    				calc(100% + var(--light-adjust))
    					calc(var(--chroma-base) + var(--chroma-range)) var(--hue-base) / 50%
    			),
    		inset 0 0.2ch 0.4ch 0.1ch
    			lch(calc(60% + var(--light-adjust)) var(--chroma-base) var(--hue-base) / 50%),
    		inset 0 -0.25ch 0.25ch 0 lch(calc(20% + var(--light-adjust)) 41
    					var(--hue-base) / 10%),
    		inset -0.25ch 0 0.25ch 0 lch(calc(20% + var(--light-adjust))
    					calc(var(--chroma-base) + var(--chroma-range)) var(--hue-base) / 40%),
    		inset 0.25ch 0 0.25ch 0
    			lch(
    				calc(20% + var(--light-adjust))
    					calc(var(--chroma-base) + var(--chroma-range)) var(--hue-base) / 40%
    			),
    		inset 0 0.5ch 1ch 0.5ch
    			lch(
    				calc(30% + var(--light-adjust))
    					calc(var(--chroma-base) + var(--chroma-range)) var(--hue-base) / 60%
    			);
    	transition: all ease-in-out 250ms;
    }

    button:hover {
    	--light-adjust: 10%;
    }

    button::before,
    button::after {
    	content: "";
    	display: block;
    	position: absolute;
    }

    button::before {
    	inset: 0.25ch 0.75ch auto;
    	background: linear-gradient(
    		lch(calc(100% + var(--light-adjust)) 0 var(--hue-base) / 50%),
    		lch(
    			calc(100% + var(--light-adjust)) var(--chroma-base) var(--hue-base) / 30%
    		),
    		lch(calc(98% + var(--light-adjust)) var(--chroma-base) var(--hue-base) / 5%)
    	);
    	height: 0.875ch;
    	border-radius: 2ch 2ch 0.5ch 0.5ch;
    	z-index: 1;
    }

    button::after {
    	inset: 0;
    	opacity: 80%;
    	filter: blur(0.25ch);
    	translate: 0 0.875ch;
    	z-index: -1;
    }
</style>
</html>

Tab's on my iMac
----------------

- Window 1
    * [The IBM MDA Should Have Been The CDA \| Hackaday](https://hackaday.com/2023/11/12/the-ibm-mda-should-have-been-the-cda/)
    * [Ports \| MacPorts](https://ports.macports.org/)
    * [Support Tiers — Homebrew Documentation](https://docs.brew.sh/Support-Tiers#tier-3)
    * [Dyson sphere - Wikipedia](https://en.wikipedia.org/wiki/Dyson_sphere)
    * [Quick Start \| Garage HQ](https://garagehq.deuxfleurs.fr/documentation/quick-start/)
    * [the terminal of the future](https://jyn.dev/the-terminal-of-the-future/)
    * [Progress Report: Linux 6.18 - Asahi Linux](https://asahilinux.org/2025/12/progress-report-6-18/)
    * [Pivot to AI – It can't be that stupid, you must be prompting it wrong](https://pivot-to-ai.com/)
    * [The Complete Bash Scripting Course - ysap.sh](https://course.ysap.sh/)
    * [iOS 6 Revisited — Martin Nobel](https://www.martinnobel.com/techresearch/ios-6-screenshots)
    * [shortcut to export all opened tabs in safari – Qwant](https://www.qwant.com/?client=ext-safari-macos-sb&t=web&q=shortcut+to+export+all+opened+tabs+in+safari)
    * [How to copy website links of all open tabs in Safari](https://www.idownloadblog.com/2025/10/17/copy-all-open-tab-links-safari/)
    * [How to Copy URLs of All Open Tabs in Safari](https://www.howtogeek.com/758131/how-to-copy-urls-of-all-open-tabs-in-safari/)
- Window 2
    * [Zed — Love your editor again](https://zed.dev/)
    * [Jan-Piet Mens :: Using 2FAS TOTP codes in the terminal](https://jpmens.net/2024/02/23/totp-codes-in-the-terminal/)
    * [phuocng/html-dom: Common tasks of managing HTML DOM with vanilla JavaScript. Give me 1 ⭐if it’s useful.](https://github.com/phuocng/html-dom)
    * [Mijn account - Beheer Je BIKEBAZE® Fietsregistraties](https://www.bikebaze.nl/user-account)
    * [The time has come to declare war on AI](https://www.sfgate.com/tech/article/time-to-declare-war-ai-21221535.php)
    * [doekman/PySQL: Use raw SQL directly from python. Inspired by PugSQL, but with more Pythonesque. - Codeberg.org](https://codeberg.org/doekman/PySQL)
    * [PugSQL :: SQL is Extremely Good, Actually](https://pugsql.org/)
- Window 3 (minimized to dock)
    * [Fastpen : a client side only codepen alternative](https://fastpen.lecaro.me/#H4sIAAAAAAAAE31TQZKbMBC8%2BxUqckmqQjDxHlIy5pCfCGmA2ZUllSRssym%2FIB%2FYWz6SPyVPiAQ2YHsrOlCt6ZY008wUzHrkEgiKXcJb5pNyRcIq2rw8MCUYa4os4DFoCJfMuV2ifQs2KQtnmCr%2F%2Fnp7K7IBFpm5lzqQ9X%2BVtbb7EQ7bqvNeq%2FLP759FdsEzicp0nvjewC7xcPIJMZJxaLUUYHfJd7DI26mGbLy6yC5FBsiZOjA3VjvAkFo2onK1KpzvoyyerrTof0wv6wPYWuojbVEIUFsyMS1g03qar9eHdjtFBbqQWU9rCac5GnepQAvco1aUa9nt1UwziY1K0cPeUQ7Kg5255855rPuU6xBX%2FoGvQzyt2R5lT4ljyqUumFHPgvCYtvTDZrNZJG%2FAOhOzOQAl39Zrc0n2PHwvts0uDEe0wyF7C5LFg9sb%2BjVFJeBE89twxfhLY3WnBD22ocJb9ojCt%2FTr%2FP51GSYEqiZQ90ylbfjlqWUCO0ef3qdpbk7EaYmCVKFPXpbFtflcV2yldHD%2Fwdc9sw0qul4YKYFZyqRc3mZI7GoyXzn8D4evQJ%2FuXP0yDM9SKjXzlEio%2FY0uTs6DzMZuu08vHaL0xqS7fOK6NiUqiQrSSuqrJdflbeicODWhhziT8DHNP5P80yw6LxKMusULoy9VqO7SYOcweZeBCpPFLRofUTbBKJqOvw9mzT%2FmWRMPqgQAAA%3D%3D)
    * [Tools that build you \| Adam Stoddard](https://aaadaaam.com/notes/tools-that-build-you/)
    * [Anthony’s Mac Labs Blog \| Blog Post or Wiki Edit? (📦)](https://maclabs.jazzace.ca/2025/06/07/blog-or-wiki.html)
    * [Recreating the bird animation from Swift.org – alexwlchan](https://alexwlchan.net/2025/swift-bird-animation/?ref=mastodon)
- Window 4 (minimized to dock)
    * [Nepalese thee \| Hotsoup.nl online thee voor fijnproevers](https://www.hotsoup.nl/nl/herkomst/nepalese-thee.html)
    * [MikroTik · Routers and Wireless](https://mikrotik.com/)
    * [Overzicht \| Mijn eBay \| eBay](https://www.ebay.nl/mye/myebay/summary)
- Window 5 (minimized to dock)
    * [Klusjesman in Groningen, Haren, Meerstad, Eelderwolde](https://www.kleine-klussen.nl/#klusplanner)
    * [Ontzorgingsprogramma Verduurzaming Monumenten \| Monumenten.nl](https://www.monumenten.nl/ontzorgingsprogramma)
    * [Weg van Big Tech stap 4: navigatie en kaarten – Bits of Freedom](https://www.bitsoffreedom.nl/2025/10/16/weg-van-big-tech-stap-4-navigatie-en-kaarten/)
    * [Export Gmail/GSuite to Maildir with All Components](https://www.bitrecover.com/blog/export-gmail-to-maildir/)
    * [Soverin: Migratie van Google naar Soverin](https://soverin.nl/help/migratie-van-google-naar-soverin)
    * [LastDodo - ’s Werelds grootste catalogus & community voor verzamelaars](https://www.lastdodo.nl/nl/my/shop_orders/12093119)
- Window 6 (minimized to dock)
    * [Senior DevOps Engineer IDP bij Ministerie van Economische Zaken en Klimaat (EZK) \| Noorderlink](https://noorderlink.nl/vacature/74268-01422-079603050116-senior-devops-engineer-idp-ministerie-van-economische-zaken-en-klimaat-ezk?utm_medium=email&utm_source=transactional&utm_campaign=vacatures@noorderlink.nl)
    * [Mijn Movum](https://www.mijnmovum.nl/folders/27/blocks)
    * [Parking Page](https://runwaylanderspot.com/?d=durdraw.org&pkAId=2143526812)
{% comment %}
- Window 7 (minimized to dock)
    * [Diagnostisch onderzoek - Website Annelies Spek](https://www.anneliesspek.nl/diagnostisch-onderzoek/)
    * [Home - Autisme Expertise.nl](https://www.autismeexpertise.nl/)
    * [Autismespectrumstoornissen bij volwassenen - 2021 - Een praktische gids voor volwassenen met ASS, naastbetrokkenen en hulpverleners – Hogrefe, psychologische, testuitgeverij, boeken, tests, psychologie, psychotherapie](https://www.hogrefe.com/nl/shop/boeken/autismespectrum/autismespectrumstoornissen-bij-volwassenen-86368.html#1+1)
    * [Contact \| Psychiatrie Noord](https://psychiatrienoord.nl/contact-en-locatie/)
    * [Wij zijn gestopt met onze praktijk](https://www.polyzoom.nl/)
    * [Cognitieve capaciteitentest \| Iris Haaksma](https://www.irishaaksma.nl/methoden/cognitieve-capaciteitentest/)
{% endcomment %}


Tab's on my MacBook Pro
-----------------------

- Window 1
    * [he Case for Blogging in the Ruins](https://www.joanwestenberg.com/the-case-for-blogging-in-the-ruins/)
    * [Shantell Sans → ArrowType](https://shantellsans.com/process)
    * [Special Schrijven \| Writing](https://www.felienne.nl/2026-01/)
    * [Reisplanner \| Plan je reis \| NS](https://www.ns.nl/reisplanner/#/?vertrek=Zwolle&vertrektype=treinstation&aankomst=Groningen&aankomsttype=treinstation&type=vertrek&tijd=2026-01-04T19:30&firstMileModality=PUBLIC_TRANSPORT&lastMileModality=PUBLIC_TRANSPORT&context=arnu%7CfromStation%3D8400747%7CrequestedFromStation%3D8400747%7CtoStation%3D8400263%7CrequestedToStation%3D8400263%7CplannedFromTime%3D2026-01-04T19:16:00%2B01:00%7CplannedArrivalTime%3D2026-01-04T20:12:00%2B01:00%7CexcludeHighSpeedTrains%3Dfalse%7CsearchForAccessibleTrip%3Dfalse%7ClocalTrainsOnly%3Dfalse%7CtravelAssistance%3Dfalse%7CtripSummaryHash%3D3604313121&ritnummers=765)
    * [Topdrukte voor strooiers: 'Dit is onze wintersport'](https://nos.nl/artikel/2596943-topdrukte-voor-strooiers-dit-is-onze-wintersport)
    * [VK en Frankrijk bombarderen IS-complex in Syrië](https://nos.nl/artikel/2596914-vk-en-frankrijk-bombarderen-is-complex-in-syrie)
    * [Home](https://www.unilin.com/nl)
    * [This Connection Is Not Private](https://evabits.com/)
    * [Wadcon \| Speciaalmachinebouw \| Automatisering \| Transfersystemen](https://www.wadcon.nl/)
- Window 2
    * [Voorbereid – Zo zien de grootste Nederlandse rampscenario's eruit](https://voorbereidboek.nl/)
    * [Recreating the Canon Cat document interface - Little Lab](https://lab.alexanderobenauer.com/updates/the-jasper-report)
    * [How to Use Linting for Python Code Quality — w3tutorials.net](https://www.w3tutorials.net/python-tutorial/how-to-use-linting-for-python-code-quality/)
    * [Ruff: A Modern Python Linter for Error-Free and Maintainable Code – Real Python](https://realpython.com/ruff-python/)
- Window 3
    * [The TTY demystified](https://www.linusakesson.net/programming/tty/)
    * [Typography for Lawyers](https://typographyforlawyers.com/)
    * [Scripting News](http://scripting.com/)
    * [The Trap You Set For Yourself](https://blog.codinghorror.com/the-trap-you-set-for-yourself/)
    * [Bildhuus Aspect](https://aspect.bildhuus.com/#file-system)
    * [Weg van Big Tech stap 1: e-mail & agenda – Bits of Freedom](https://www.bitsoffreedom.nl/2025/09/16/stap-over-op-privacyvriendelijke-e-mail-agenda/)
    * [I am sorry, but everyone is getting syntax highlighting wrong @ tonsky.me](https://tonsky.me/blog/syntax-highlighting/)
    * [Tangible Media: A Historical Collection of Information Storage Technology](https://tangiblemediacollection.com/)
- Window 4
    * [PhotoSync – Photo Transfer and Backup App \| For iOS & Android - PhotoSync](https://www.photosync-app.com/home)
    * [git/Documentation/gitdatamodel.adoc at master · git/git](https://github.com/git/git/blob/master/Documentation/gitdatamodel.adoc)
    * [(4) Latest UI/UX Feedback/iOS UI/UX topics - Signal Community](https://community.signalusers.org/c/ux/ios-ux-ui/29)
    * [doekman / Repositories — Bitbucket](https://bitbucket.org/doekman/workspace/repositories/)
- Window 5
    * [Collections \| Jekyll • Simple, blog-aware, static sites](https://jekyllrb.com/docs/collections/#output)
    * [Pagina openen mislukt](http://127.0.0.1:4000/like/)
    * [Infrastructure photography manifesto](https://nora.codes/post/infrastructure-photography-manifesto-and-decker-in-html/)
    * [https://beyondloom.com/decker/](https://beyondloom.com/decker/)
- Window 6
    * [n oral history of Bank Python](https://calpaterson.com/bank-python.html)
    * [Active Listening: Swiss Army Knife of Communication (with Examples)](https://togetherlondon.com/insights/active-listening-swiss-army-knife)
- Window 7 (hidden in a virtual desktop)
    * [The many, many, many JavaScript runtimes of the last decade • Buttondown](https://buttondown.com/whatever_jamie/archive/the-many-many-many-javascript-runtimes-of-the-last-decade/)
    * [mcfunley/pugsql: A HugSQL-inspired database library for Python](https://github.com/mcfunley/pugsql)
    * [(35) Python: The Documentary \| An origin story - YouTube](https://www.youtube.com/watch?v=GfH4QL4VqJ0&list=WL&index=11)
    * [molenwinkel](https://www.devalkzalk.nl/nl/molenwinkel)
    * [Contact museum ANNO Zwolle](https://anno.nl/contact/)
    * [Familiereizen Nepal \| Het Andere Nepal](https://hetanderenepal.nl/familiereizen-nepal/)
    * [Beste reistijd Nepal \| Weer en klimaat Nepal » ANWB](https://www.anwb.nl/vakantie/nepal/beste-reistijd)
    * [Amsterdam to Kathmandu \| Google Flights](https://www.google.com/travel/flights/search?tfs=CBwQAhonEgoyMDI2LTAzLTAyagsIAhIHL20vMGszcHIMCAMSCC9tLzA0Y3g1GicSCjIwMjYtMDMtMjNqDAgDEggvbS8wNGN4NXILCAISBy9tLzBrM3BAAUgBcAGCAQsI____________AZgBAQ)
    * [Nepal - Wikipedia](https://en.wikipedia.org/wiki/Nepal)
    * [Nepal temperatuur, klimaat en weer per maand](https://www.bestereistijd.nl/nepal/#weerervaringen)



Tab's on my iPhone mini
-----------------------

- [Datasette: An open source multi-tool for exploring and publishing data](https://datasette.io/)
- [Groentekwekerij Noordlaren  - Boerderijwinkel, Kwekerij en Anders in Noordlaren](https://lekkerder.nl/groentekwekerij-noordlaren)
- [https://zuriga.com/de/Produkte/ZURIGA-E2/ZEEU401 (no title)](https://zuriga.com/de/Produkte/ZURIGA-E2/ZEEU401)
- [PINECIL – Smart Mini Portable Soldering Iron (Version 2) - PINE STORE](https://pine64.com/product/pinecil-smart-mini-portable-soldering-iron/)
- [BlueSCSI v2 Pico Announcement - BlueSCSI](https://bluescsi.com/v2#new)
- [The Ozark Mountain Daredevils](https://en.m.wikipedia.org/wiki/The_Ozark_Mountain_Daredevils)
- [Brain Connections May Cause Blurring Sense Of Self With LSD : Shots - Health News : NPR](https://www.npr.org/sections/health-shots/2016/04/13/474071268/how-lsd-makes-your-brain-one-with-the-universe)
- [cat lee king and his cooks at DuckDuckGo](https://duckduckgo.com/?q=cat+lee+king+and+his+cooks&t=iphone&ia=web)
- [https://weblogs.vpro.nl/plots/](https://weblogs.vpro.nl/plots/) -- 404 Not Found
- [Houtbouwers \| VPRO Tegenlicht](https://www.vpro.nl/programmas/tegenlicht/kijk/afleveringen/2019-2020/houtbouwers.html)
- [Make me think! – Ralph Ammer](https://ralphammer.com/make-me-think/)
- [Beautiful Free Images & Pictures \| Unsplash](https://unsplash.com/)
- [De mooiste interieurstudio en showroom van Groningen - O'42 interieur](https://www.o42interieur.nl/)
- [https://www.mantherapy.org/ (no title)](https://www.mantherapy.org/)
- [Vimeo: Vera Weekly](https://vimeo.com/showcase/9459437/video/838408969/embed)
- [✂Templatemaker](https://www.templatemaker.nl/en/)
- [Official Website: Gordon Hempton – The Sound Tracker®](https://soundtracker.com/)
- [Jij dacht dat je goed kon luisteren? Luister dan eens naar deze man met microfoon  - De Correspondent](https://decorrespondent.nl/11931/jij-dacht-dat-je-goed-kon-luisteren-luister-dan-eens-naar-deze-man-met-microfoon/3ae02ea8-67fb-0e9a-27cb-2eef1bd1ee06)
- [All About USB-C: Power Delivery \| Hackaday](https://hackaday.com/2023/01/09/all-about-usb-c-power-delivery/)
- [100 Best Comics And Graphic Novels : NPR](https://www.npr.org/2017/07/12/533862948/lets-get-graphic-100-favorite-comics-and-graphic-novels)
- [Literary Hub » Climate Change Library](https://lithub.com/tag/climate-change-library/)
- [Invidious - search](https://yewtu.be/)
- [Cumbia: The Musical Backbone Of Latin America : Alt.Latino : NPR](https://www.npr.org/sections/altlatino/2013/09/30/227834004/cumbia-the-musical-backbone-of-latin-america)
- [C-support \| Wij ondersteunen mensen met langdurige corona klachten](https://www.c-support.nu/)
- [Aardvark'd: The Fog Creek Documentary, 18 Years Later ·mtlynch.io](https://mtlynch.io/aardvarkd/)
- [https://www.abortretry.fail/p/an-introduction-to-linux-part-1](https://www.abortretry.fail/p/an-introduction-to-linux-part-1) -- 404 Not Found
- [Shure SM57LC Bundle II – Thomann Nederland](https://www.thomann.de/nl/shure_sm57lc_bundle_ii.htm?msclkid=fcfac665a0f915896003a3681845bcf5&utm_source=bing&utm_medium=cpc&utm_campaign=Shopping%20NL&utm_term=4576717170826333&utm_content=MI)
- [LASAGNE MET POMPOEN, RICOTTA, SPINAZIE EN SALIE](https://www.lovemysalad.com/nl/recepten/lasagne-met-pompoen-ricotta-spinazie-en-salie)
- [jon spencer blues explosion at DuckDuckGo](https://duckduckgo.com/?q=jon+spencer+blues+explosion&t=iphone&ia=web)
- [jenny odell - writing](https://jennyodell.com/writing.html)
- [Watch – Chris Fitzgerald](https://chrisfitzgeraldmusic.com/watch/)
- [https://chrisfitzgeraldmusic.com/download/walking-bass-line-theory-basics/?wpdmdl=1258&refresh=652eb84518c8f1697560645 (no title)](https://chrisfitzgeraldmusic.com/download/walking-bass-line-theory-basics/?wpdmdl=1258&refresh=652eb84518c8f1697560645)
- [First Amazon Order](https://neal.fun/internet-artifacts/amazon-order/)
- [De lekkerste tempeh-marinade - Plantbased Dennis](https://plantbaseddennis.nl/nl/recepten/diner/de-lekkerste-tempeh-marinades/)
- [https://tome.one/slides/amiet-pelissier-security-keys-workshop-ph0wn-2023-slides.pdf (no title)](https://tome.one/slides/amiet-pelissier-security-keys-workshop-ph0wn-2023-slides.pdf)
- [Primer (film)](https://en.m.wikipedia.org/wiki/Primer_(film))
- [Browse Standard Ebooks - Standard Ebooks: Free and liberated ebooks, carefully produced for the true book lover](https://standardebooks.org/ebooks)
- [Luchtverfrisser Buiten: Natuurlijke luchtverfrisser: Airdancer.nl](https://www.airdancer.nl/airdancer/natuurlijke-luchtverfrisser/luchtverfrisser-buiten/13823)
- [Shop Hawaiian Shirts-Hawalili \| hawalili](https://www.hawalili.com/)
- [Shuriken - Macintosh Repository](https://www.macintoshrepository.org/48943-shuriken)
- [korte cursus korte  verhalen schrijven \| reddend zwemmen](https://rvessen.wordpress.com/2023/07/30/korte-cursus-korte-verhalen-schrijven/)
- [data model web shop at DuckDuckGo](https://duckduckgo.com/?q=data+model+web+shop&t=iphone&ia=web)
- [ActivityPub Server in a Single PHP File – Terence Eden’s Blog](https://shkspr.mobi/blog/2024/02/activitypub-server-in-a-single-file/)
- [3 Breathing Exercises to Relieve Stress and Improve Health - The New York Times](https://www.nytimes.com/interactive/2023/03/03/well/mind/breathing-exercises.html)
- [Tammo80.nl - Tammo Jan Dijkema](https://www.tammo80.nl/)
- [Optimizing SQLite for servers](https://kerkour.com/sqlite-for-servers)
- [Wie bepaalt het narratief rond AI? – Goed Maken ❤️](https://goedmaken.org/index.php/2024/04/15/wie-bepaalt-het-narratief-rond-ai/)
- [Building a GPS Receiver, Part 1: Hearing Whispers \| Phillip Tennen](https://axleos.com/building-a-gps-receiver-part-1-hearing-whispers/)
- [Op vakantie naar Afghanistan - Andere Tijden](https://anderetijden.nl/aflevering/707/Op-vakantie-naar-Afghanistan)
- [Woodworking as an escape from the absurdity of software](https://alinpanaitiu.com/blog/woodworking-escape-from-software-absurdity/#other-small-wood-things)
- [Practical SVG is Now Free to Read Online – Chris Coyier](https://chriscoyier.net/2024/07/22/practical-svg-is-now-free-to-read-online/)
- [Compare • JVC Nederland](https://nl.jvc.com/compare/?cat=93&products=4228,1584,591,585)
- [Arthur Baker - Arthur Baker presents Breaker’s Revenge And Original B-Boy and B-Girl... \| bol](https://www.bol.com/nl/nl/p/breaker-s-revenge-original-b-boy-and-b-girl-breakdance-classics/9300000178253704/?s2a=#productTitle)
- [https://pagedout.institute/download/PagedOut_001_beta1.pdf (no title)](https://pagedout.institute/download/PagedOut_001_beta1.pdf)
- [The Dying Web \| Matthias Endler](https://endler.dev/2024/the-dying-web/)
- [NeoFinder – The Digital Asset Manager for macOS and iOS](https://www.cdfinder.de/index.html)
- [Source Files for iPhone, iPad & Mac](https://sourcefiles.app/)
- [MailMate](https://freron.com/)
- [Landsat - NASA Science](https://landsat.gsfc.nasa.gov/apps/YourNameInLandsat-main/index.html)
- [Beyond Ctrl-C: The dark corners of Unix signal handling · sunshowers](https://sunshowers.io/posts/beyond-ctrl-c-signals/)
- [Tropicfeel \| The Ultimate Travel Gear](https://shop.tropicfeel.com/)
- [Fretboard Note Identification](https://www.musictheory.net/exercises/fretboard)
- [The Body Keeps the Score: Brain, Mind, and Body in the Healing of Trauma](https://www.amazon.com/Body-Keeps-Score-Healing-Trauma/dp/0143127748)
- [Sign In @ tonsky.me](https://tonsky.me/sign-in/)
- [Trouwambtenaren \| Gemeente Schiermonnikoog](https://www.schiermonnikoog.nl/trouwambtenaren)
- [velux dakraam monteren at DuckDuckGo](https://duckduckgo.com/?q=velux+dakraam+monteren&t=iphone&ia=web)
- [Harira: Marokkaanse tomatensoep met linzen en kikkererwten](https://foxilicious.nl/harira-marokkaanse-tomatensoep/)
- [Sumana Harihareswara - HTTP Can Do That?! - Speaker Deck](https://speakerdeck.com/pycon2016/sumana-harihareswara-http-can-do-that?slide=9)
- [pipe: authenticated pubsub over ssh](https://pipe.pico.sh/)
- [Links \| Hi-Lo](https://hi-lo-art.com/links)
- [‘Werk is politiek’ –  De Groene Amsterdammer](https://www.groene.nl/artikel/werk-is-politiek?utm_campaign=website&utm_medium=owned_social&utm_source=mastodon)
- [https://moviesjoy.kim/](https://moviesjoy.kim/) -- (exception when retrieving: HTTPSConnectionPool(host='moviesjoy.kim', port=443): Max retries exceeded with url: / (Caused by NameResolutionError("HTTPSConnection(host='moviesjoy.kim', port=443): Failed to resolve 'moviesjoy.kim' ([Errno 8] nodename nor servname provided, or not known)")))
- [PostScript® 1.0 - A Code Study \| ℤ→ℤ](https://ztoz.blog/posts/postscript-code/)
- [POSSE](https://www.mollywhite.net/micro/entry/202403091817)
- [At Home - TheartofbeingaMAN](https://theartofbeingaman.nl/#contact)
- [European search engines \| European Alternatives](https://european-alternatives.eu/category/search-engines)
- [The Internet's Own Boy: The Story of Aaron Swartz : Brian Knappenberger : Free Download, Borrow, and Streaming : Internet Archive](https://archive.org/details/TheInternetsOwnBoyTheStoryOfAaronSwartz)
- [Mijn pensioenoverzicht](https://www.mijnpensioenoverzicht.nl/)
- [Waarom leerstijlen niet bestaan - NEMO Kennislink](https://www.nemokennislink.nl/publicaties/waarom-leerstijlen-niet-bestaan/)
- [Klevgrand - Dream Louder](https://klevgrand.com/products/speldosa)
- [Odoo Planning - Gratis Software voor Planningbeheer](https://www.odoo.com/nl_NL/app/planning)
- [Daylight \| A More Caring Computer](https://daylightcomputer.com/)
- [How Interactive Shells Work · oils-for-unix/oils Wiki · GitHub](https://github.com/oils-for-unix/oils/wiki/How-Interactive-Shells-Work#1-processing-user-inputs)
- [BIT-101 \| Journal](https://bit-101.com/blog/posts/2024-12-28/journal/)
- [Handgemaakte 14k edel champagnegoud voor hem en haar Mobius-trouwringset](https://www.etsy.com/nl/listing/1322634709/handgemaakte-14k-edel-champagnegoud-voor?ga_order=most_relevant&ga_search_type=all&ga_view_type=gallery&ga_search_query=trouwringen&ref=sc_gallery-4-2&frs=1&cns=1&sts=1&search_preloaded_img=1&plkey=7a0ef5e3202ca95ec326a37978c1df8f23023c95%3A1322634709&variation1=2931233890&variation0=2947772965)
- [100R — small space](https://100r.co/site/small_space.html)
- [The Tiny Book of Great Joys · Muffin Man](https://muffinman.io/blog/the-tiny-book-of-great-joys/)
- [Zangles voor Mannen \| Zangles voor Mannen in Zwolle](https://www.zanglesvoormannen.nl/)
- [offerte velux dakkspel groningen at DuckDuckGo](https://duckduckgo.com/?q=offerte+velux+dakkspel+groningen&t=iphone&ia=web)
- [FediMeteo: How a Tiny €4 FreeBSD VPS Became a Global Weather Service for Thousands - IT Notes](https://it-notes.dragas.net/2025/02/26/fedimeteo-how-a-tiny-freebsd-vps-became-a-global-weather-service-for-thousands/)
- [Led Leeslampje voor boek – 3 Standen oogvriendelijk licht – Dimbare oplaadbare... \| bol](https://www.bol.com/nl/nl/p/woodoro-led-leeslampje-bevordert-slaap-3-lichtstanden-oplaadbaar/9300000001817264/)
- [This page is under construction - localghost](https://localghost.dev/blog/this-page-is-under-construction/)
- [Tjeerd Bottema](https://nl.m.wikipedia.org/wiki/Tjeerd_Bottema)
- [Ecologisch onkruid bestrijden op verhardingen – ecohovenier.nl](http://www.ecohovenier.nl/wp/artikelen/onkruid-bestrijden-op-verhardingen-2/)
- [ALTREX Huishoudtrap Double Decker, 5 treden kopen! \| HORNBACH](https://www.hornbach.nl/p/altrex-huishoudtrap-double-decker-5-treden/4100185/)
- [Something Pretty Right: A History of Visual Basic \| Retool](https://retool.com/visual-basic)
- [Creating a static website for all my bookmarks – alexwlchan](https://alexwlchan.net/2025/bookmarks-static-site/?utm_source=mastodon)
- [Zalk – van Dijksweg 31 \| Veltkamp & Stam Admono Makelaars](https://veltkampenstam.nl/woning/zalk-van-dijksweg-31/)
- [KNMI meet langste periode ooit dat Nederlanders niet zeiken over het weer](https://speld.nl/2025/05/13/knmi-meet-langste-periode-ooit-dat-nederlanders-niet-zeiken-over-het-weer/)
- [PC & Zubehör & Software gebraucht kaufen in Prenzlauer Berg - Pankow \| kleinanzeigen.de](https://www.kleinanzeigen.de/s-anzeige/dell-6k-32-monitor-u3224kba/3084829569-225-3490)
- [De zwakke plek van de Verenigde Staten vind je op zee](https://decorrespondent.nl/16100/de-zwakke-plek-van-de-verenigde-staten-vind-je-op-zee/ebd85e6c-351c-00c5-10c2-b4db9c79ee42)
- [You Might Not Need jQuery](https://youmightnotneedjquery.com/)
- [Knolselderij koken, bakken of grillen](https://www.hoelangmoetkoken.nl/knolselderij/)
- [How Convenience Kills Curiosity](https://www.joanwestenberg.com/how-convenience-kills-curiosity/)
- [direnv – unclutter your .profile \| direnv](https://direnv.net/)
- [Positieve ervaringen met open hiring: solliciteren zonder sollicitatieprocedure - EFKO Beton](https://efkobeton.nl/positieve-ervaringen-met-open-hiring-solliciteren-zonder-sollicitatieprocedure/)
- [Just fucking use HTML](https://justfuckingusehtml.com/)
- [Core Language · An Introduction to Elm](https://guide.elm-lang.org/core_language.html)
- [Straun – Natuureducatie Schiermonnikoog](https://straun.nl/)
- [Bootstrapping HTTP/1.1, HTTP/2, and HTTP/3](https://www.netmeister.org/blog/http-123.html)
- [Neven Mrgan on Why Skeuomorphism Is Like a Classic Car \| App: The Human Story - Available Now](https://appdocumentary.com/2015/01/08/neven-mrgan-on-why-skeuomorphism-is-like-a-classic-car/)
- [Stream episode PS165 - Clip - Sculley - Atkinson - Hypercard by The Powersharing Series podcast \| Listen online for free on SoundCloud](https://m.soundcloud.com/thepowersharingseries/ps165-clip-sculley-atkinson-hypercard)
- [Welcome to the BAG: The Dutch Building and Addresses database - Bert Hubert's writings](https://berthub.eu/articles/posts/dutch-postcode-and-building-database/)
- [TET Netherlands - Trans Euro Trail - Europe's Dirt Road Adventure](https://transeurotrail.org/netherlands/#5.84/52.131/5.659)
- [Autistic, Allistic, Neurodiverse, and Neurotypical: Say what? \| Cracked Mirror in Shalott](https://crackedmirrorinshalott.wordpress.com/2013/04/12/autistic-allistic-neurodiverse-and-neurotypical-say-what/)
- [Hosting a Fediverse instance on an original Raspberry Pi](https://cablespaghetti.dev/hosting-a-fediverse-instance-on-an-original-raspberry-pi.html) -- (exception when retrieving: HTTPSConnectionPool(host='cablespaghetti.dev', port=443): Max retries exceeded with url: /hosting-a-fediverse-instance-on-an-original-raspberry-pi.html (Caused by NewConnectionError("HTTPSConnection(host='cablespaghetti.dev', port=443): Failed to establish a new connection: [Errno 51] Network is unreachable")))
- [Writing a basic Linux device driver when you know nothing about Linux drivers or USB // crescentro.se](https://crescentro.se/posts/writing-drivers/)
- [Je zocht naar Zalkerbos - Het dorp Zalk](https://hetdorpzalk.nl/?s=Zalkerbos&doing_wp_cron=1751886056.3051149845123291015625)
- [TermDriver 2 \| Crowd Supply](https://www.crowdsupply.com/excamera/termdriver-2)
- [Feynman Lecures on Physics](https://www.feynmanlectures.caltech.edu/)
- [HomeComputerMuseum - Aster Computers](https://www.homecomputermuseum.nl/en/collectie/aster/)
- [Notes on Managing ADHD](https://borretti.me/article/notes-on-managing-adhd#strategies)
- [Nij Begun](https://isolatie.nijbegun.nl/over-de-isolatieaanpak/wat-is-een-isolatieplan/)
- [v86](https://copy.sh/v86/)
- [Handige bronnen – Dansschool Descarga Salsa](https://descargasalsa.nl/handig/)
- [There’s no such thing as a CSS reset \| Adam Stoddard](https://aaadaaam.com/notes/useful-defaults/)
- [Web platform features explorer - Home](https://web-platform-dx.github.io/web-features-explorer/)
- [Web platform features explorer - Widely available](https://web-platform-dx.github.io/web-features-explorer/widely-available/)
- [Shipwrecked: A Shocking Tale of Love, Loss, and Survival in the Deep Blue Sea](https://www.bostonmagazine.com/news/lost-at-sea/)
- [How to Clean your iPhone's Lightning Port - iFixit reparatiehandleiding](https://nl.ifixit.com/Guide/How+to+Clean+your+iPhone's+Lightning+Port/164631)
- [Online houten scherjon klompen kopen](https://www.klompen.frl/webshop/)
- [TRMNL \| E-ink dashboard to stay focused](https://usetrmnl.com/)
- [PairDrop/docs/faq.md at master · schlagmichdoch/PairDrop · GitHub](https://github.com/schlagmichdoch/pairdrop/blob/master/docs/faq.md)
- [Ursula K. Le Guin — Blog (2010–2017)](https://www.ursulakleguin.com/blog)
- [Ibiza Retreat for Men \| New Masculinity \| Ibiza Men's Group](https://www.newmasculinity.org/)
- [Socca: glutenvrije kikkererwten pannenkoek - Simone's Kitchen](https://simoneskitchen.nl/socca-glutenvrije-kikkererwten-pannenkoek/)
- [Jan-Piet Mens :: I clone all GitHub repositories I've starred](https://jpmens.net/2019/04/04/i-clone-all-repositories-i-ve-starred/)
- [Two Scenario Threat Modeling - Jacob Kaplan-Moss](https://jacobian.org/2025/aug/8/two-scenario-threat-modeling/)
- [eM Client \| The Best Email Client for Windows and Mac](https://www.emclient.com/)
- [OverType - The Markdown Editor That's a Textarea](https://overtype.dev/)
- [Explore Offline Wikipedia and Educational Content with Kiwix- Kiwix](https://kiwix.org/en/)
- [djot](https://djot.net/)
- [Candle Flame Oscillations as a Clock – Tim's Blog](https://cpldcpu.com/2025/08/13/candle-flame-oscillations-as-a-clock/)
- [Hanggai › Noorderzon](https://www.noorderzon.nl/programma/hanggai)
- [The TTY demystified](https://www.linusakesson.net/programming/tty/)
- [Why might the Big Bang theory be in crisis very soon? \| Aeon Essays](https://aeon.co/essays/why-might-the-big-bang-theory-be-in-crisis-very-soon?ref=readtangle.com)
- [Listen to Mindful Magic Mushrum Mircordosing Meditation for Men 2.wav by Sudhir, Zorah & friends in Meditations playlist online for free on SoundCloud](https://m.soundcloud.com/sudhir-ibiza/mindful-magic-mushrum?in=sudhir-ibiza%2Fsets%2Fmedittions)
- [iOS and iPadOS 26: The MacStories Review](https://www.macstories.net/stories/ios-and-ipados-26-the-macstories-review/)
- [Houweling Telecomm Museum, Rotterdam \| Flickr](https://www.flickr.com/photos/mwichary/albums/72177720329068272/)
- [UTF-8 is a Brilliant Design — Vishnu's Pages](https://iamvishnu.com/posts/utf8-is-brilliant-design)
- [Reflection Frame](https://www.reflectionframe.com/)
- [» Table of Contents The Digital Antiquarian](https://www.filfre.net/sitemap/)
- [Who Goes Nazi?, by Dorothy Thompson](https://harpers.org/archive/1941/08/who-goes-nazi/)
- [Roman Mars on the curse of efficiency – Legends of the Sun Pig](https://sunpig.com/martin/2025/09/28/roman-mars-on-the-curse-of-efficiency/)
- [The web you want](https://the-web-we-want.com/)
- [mySamasati - Today's Meditation](https://mysamasati.com/?mid=223)
- [Python Software Foundation News: The PSF has withdrawn a $1.5 million proposal to US government grant program](https://pyfound.blogspot.com/2025/10/NSF-funding-statement.html?m=1)
- [non-ai-licenses/README.md at main · non-ai-licenses/non-ai-licenses · GitHub](https://github.com/non-ai-licenses/non-ai-licenses/blob/main/README.md)
- [Ondertussen aan de Hofvijver \| AVROTROS](https://www.avrotros.nl/program/ondertussen-aan-de-hofvijver~75/)
- [Malicious compliance](https://en.wikipedia.org/wiki/Malicious_compliance)
- [Dithering - Part 1](https://visualrambling.space/dithering-part-1/)
- [Pumped up \| Adam Stoddard](https://aaadaaam.com/notes/pumped-up/)
- [How Can We See and Steer Through Our Life "Crises" to Find a New Path? - Create an Adaptable Life](https://createadaptablelife.com/2025/10/how-can-we-see-and-steer-through-our-life-crises-to-find-a-new-path.html)
- [Small Things Considered](https://smallthingsconsidered.blog/)
- [ongoing by Tim Bray · Bye, Google Search](https://www.tbray.org/ongoing/When/202x/2025/11/01/Blog-Search-Pagefind)
- [Nieuw in de ASN-app en ASN Online Bankieren - ASN Bank](https://www.asnbank.nl/betalen/nieuw-in-de-asn-app-en-asn-online-bankieren.html)
- [The web you want](https://the-web-you-want.org/?css=vasilis2)
- [https://scripting.com/2022/07/19/152235.html?title=devNotesForMarkdownInRss](https://scripting.com/2022/07/19/152235.html?title=devNotesForMarkdownInRss) -- (exception when retrieving: ('Connection aborted.', ConnectionResetError(54, 'Connection reset by peer')))
- [Op vakantie midden in de natuur, overnacht in een Wikkelhouse bij Stayokay \| Stayokay](https://www.stayokay.com/nl/tips/overnachten-in-een-wikkelhouse)
- [Kies je stoelen \| Kaartverkoop SPOT Groningen](https://tickets.spotgroningen.nl/mtTicket/performance?id=108512&lang=nl#seats)
- [Pannenkoeken basisrecept](https://www.ah.nl/allerhande/recept/R-R1189426/pannenkoeken-basisrecept?as_templateId=23793&msclkid=8bcf0be5da3519893b6462f062e3fbcd&utm_source=bing&utm_medium=cpc&utm_campaign=NL%2FNL%20-%20AO%20-%20Search%20-%20API%20-%20NB%20-%20Gerechten%20-%20Top%20100&utm_term=pannenkoeken&utm_content=Gerecht%20-%C2%A0Pannenkoeken%20-%C2%A0HV)
- [Byte - a visual archive](https://byte.tsundoku.io/#198610b-266)
- [The Overly Humble Programmer](https://jimmyhmiller.com/overly-humble-programmer)
- [Web Design Museum - Discover old websites, apps and software](https://www.webdesignmuseum.org/)
- [Informatie - Toekomst Haddingestraatgarage](https://stemvan.groningen.nl/toekomst-haddingestraatgarage/?utm_campaign=Nieuwsbrief+Centrum+&utm_medium=email&utm_source=Mailer#reageren)
- [Nevel Wild Ales bier](https://www.nevel.org/)
- [Zonnesteen (kompas)](https://nl.wikipedia.org/wiki/Zonnesteen_(kompas))
- [Biologisch-dynamische groente met smaak - Eemstuin](https://eemstuin.nl/)
- [Eikemaheert \| Biologisch landbouwbedrijf in Loppersum dat natuur en cultuur verbindt](https://eikemaheert.nl/)
- [Unsure Calculator](https://filiph.github.io/unsure/)
- [Lusknopen](https://hpsv-vissen.nl/Lusknopen.htm)
- [Laptop Revive – Sociaal, duurzaam en open](https://www.laptoprevive.nl/)
- [Alternatieve herenkleding kopen? Simsalabim](https://simsalabimwebshop.com/alternatieve-herenkleding/)
- [Inbinden bij sportklimmen \| NKBV](https://nkbv.nl/kenniscentrum/inbinden-bij-sportklimmen.html)
- [Herinrichtingsplannen POL-gebied zes weken ter inzage - Provincie Groningen](https://www.provinciegroningen.nl/actueel/nieuws/nieuwsartikel/herinrichtingsplannen-pol-gebied-zes-weken-ter-inzage/)
- [Taste Ventura](https://app.tasteventura.nl/nl/quiz/intro/oNMd)
- [The People Outsourcing Their Thinking to AI - The Atlantic](https://www.theatlantic.com/technology/2025/12/people-outsourcing-their-thinking-ai/685093/?gift=iWa_iB9lkw4UuiWbIbrWGTqj_UFH3shy9qJgLM4CAq4&utm_source=copy-link&utm_medium=social&utm_campaign=share)
- [Resisting GenAI & Big Tech in Higher Education](https://www.danmcquillan.org/resisting_genai_highered_cjuu.html)
- [Floorp Browser](https://floorp.app/)
- [LibreWolf](https://librewolf.net/)
- [Deen Design Zandbak is under construction](https://gwij.nl/) -- The Woodsmen
- [Glutenvrije soezen, basisrecept](https://marikebol.com/2023/04/26/glutenvrije-soezen/)
- [Nina Kalinina's home page](https://www.ninakalinina.com/)
- [Escapisme](https://nl.wikipedia.org/wiki/Escapisme)
- [Ambient 1: Music for Airports](https://en.wikipedia.org/wiki/Ambient_1:_Music_for_Airports)
- [On Being Useful - Bert Hubert's writings](https://berthub.eu/articles/posts/on-being-useful/)
- [HDMI](https://en.wikipedia.org/wiki/HDMI#ARC)

