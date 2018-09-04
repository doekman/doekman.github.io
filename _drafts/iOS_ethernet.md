---
layout: post
title:  Networking with iOS via Ethernet
date:   2018-09-04
tags:   [does-it-work]
---

This summer I went to [Ecolonie][], a very nice place in __France__. It is an idealistic place that doesn't want to exclude anyone.
So they don't allow digital wireless connections like Wifi and Bluetooth, because this can make some people sick.

So I thought of connecting my iPad via Ethernet to internet.
[I'm not][eth0] [the first one][eth1] [to try this][eth2], but I wanted to share my experiences.
I first bought the [Apple Lightning to USB 3 camera adapter][camera-adapter] (you can get cheaper clones, but non-Apple periferals can suffer from some kind of compatiblity issue).
Next was a [powered USB hub][aukey-hub] from the Aukey, which already has an ethernet LAN adapter build in!
So there's no need to buy an external USB Ethernet Adapter.

This setup works (almost) perfectly with both iPhone 5 (iOS 10.3.3), iPhone SE and iPad Air 2 (both iOS 11.new). 
When connecting the setup, you'll get an entry between Wifi and Bluetooth in the settings menu, where you can check your TCP/IP settings.
When I plugged in my Apple USB Ethernet Adapter, the Ethernet menu shows two adapters (also one for the build-in Aukey ethernet).
Like in macOS, it will prioritize the adapters automatically and choose the "best" one.
I performed some speed tests, and I didn't find significant differences between Wifi and Ethernet.

I found one downside which stops it from working perfectly. I switch on Airplane Mode to make sure no digital wireless signals were emitted.
However, in that case for almost every app you open, you'll get a warning to switch off Airplane Mode.
Luckily these warnings can be dismissed without any problems, and bytes will happily flow between your device and the internet.

Other findings: I charged by iPad via a cable between the lightning connector in the Camera Adapter and the fast-charge port in the USB hub.
This caused noise on the speaker I had connected to the iPad via the 3½mm audio jack.
The noise disappeared when removing the charging cable from the USB hub and did not return when connecting to iPad's charging adapter.

One final note on USB Ethernet adapters: naturally they have built-in MAC-addresses. But you can expect some complications on your network when you use a MAC-addresses to identify all allowed devices.
Devices, like in Lisa's tablet and Bart's iPhone... D'oh!


[Ecolonie]: https://www.ecolonie.eu/en
[eth0]: https://www.lifewire.com/connect-ipad-to-wired-ethernet-port-1994242
[eth1]: https://sixcolors.com/post/2016/07/ios-10-a-place-for-ethernet/
[eth2]: https://9to5mac.com/2017/03/01/ios-10-2-ethernet-adapter-ui-settings-app/
[camera-adapter]: https://www.apple.com/nl/shop/product/MK0W2ZM/A/lightning-naar-usb-3-camera-adapter?fnode=5a77c06a31d0e5022a688a2defec8127910a5c967ad27547e77a7424219ab7f0a55463cd85fcdd333d6606c4fa120dfcc8c4531e057b6b3771cf23ba049aaa7807f3e771f4c29345bec09a21c843c02ccb64fe33ce5ec4bf8ae31ebbf3f1d902
[aukey-hub]: https://www.amazon.de/gp/product/B00QWYJSUG/ref=oh_aui_detailpage_o00_s01?ie=UTF8&psc=1

