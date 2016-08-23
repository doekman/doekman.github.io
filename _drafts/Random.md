---
layout: post
title:  "`Math.random()` and the normal distribution"
categories: javascript
---

In response to [De Circulaire][circulaire] #18 ("Vraag me niet waarom, maar ik had gewoon even zin om visueel 
te maken dat als je twee dobbelstenen rolt je een normaalverdeling krijgt. Zie [alhier][normal]. Klik op 'go'.") 
and also [this][math-random], and [vsause](https://youtu.be/9rIy0xY99a0) and [veratasium](https://youtu.be/sMb00lz-IfE).

Not:

    function rand(min, max) {
        return Math.floor(Math.random() * (max - min + 1)) + min;
        //The following gives the first and last element 50% less chance
        //return Math.round(Math.random() * (max - min)) + min; 
    }

[circulaire]: http://tinyletter.com/circulaire
[normal]: http://projects.haykranen.nl/labs/normal/
[math-random]: https://medium.com/@betable/tifu-by-using-math-random-f1c308c4fd9d#.1mhmo5uhp

