---
layout: post
title:  "Moving away from Server.app to Jamf Pro"
date:   2021-01-11

---

At [Archipunt](https://archipunt.nl) we manage around 100 _macOS_ computers. We used to manage them via _Server.app_. Because of several reasons, we now are moving to an all-MDM solution with Jamf Pro.

To migrate the computers, we identified the following things to be fixed on these computers:

* The registration to Server.app's _Network Account_ server needs to be removed
* After this, some cleanup needs to be done in the computers local directory
* Since password authentication was done via Server.app, the _mobile account_ need to be migrated to a _local account_
* Some computers used Server.app's MDM solution. When still present, old profiles need to be removed
* Most computers are registered via DEP, so enrolment needs to be renewed in order to configure the to be managed via Jamf Pro.

Because of COVID-19, most computers need to be migrated by the users themselves at home. Luckily, all users have elevated privileges. Otherwise, this migration would take a lot more time on our side.

To migration will be done by a custom application. The GUI part will be written in AppleScript because it is so well suited for this. The actual migration is done via a shell-script. I couldn't have written this without the [this script by Rich Trouton][migrate-mobile-account]: I made it work with Open Directory (which Server.app users), instead of Active Directory. Another post that helped enormously was this [check and fix for an expired Apple Push Service Delivery certificate][apsd].

I designed the shell-script via a "check-fix" strategy: I first check if something needs to be fixed, and if so, fix it. For example, first I check if the machine is linked to a network account server. If so, the link is disconnected. This way, the script can be run as often as one wants without breaking stuff. Most items about are coded via a check/fix pair. An added advantage is separate parts can easily be tested.

It's also handy in the case the machine has to be rebooted. After that, just run the script again, and it factually starts where it was before the computer was rebooted.

The AppleScript front-end handles the start screen and the request for the elevated privileges. When an error occurs within the shell-script, the user is advised about this and the log file is shown in the finder. I reserved exit-code 199 via which the shell-script can tell AppleScript the computer needs to be rebooted.

To test the AppleScript without running the actual migration shell-script, I used the user defaults system. By writing a key/value pair to the application bundle domain (`defaults write  nl.archipunt.public.go-jamf-pro test -string "PASS"`) the test-application's behaviour can be influenced. When the key is not present, the actual migration code will be used. 

For source-code, please check out [the repository][archibucket] on bitbucket.

About implementation: we first asked a small group of users to test the script, so we could detect common problems early and fix them. This worked very well. After errors from this initial group were fixed, most errors we experienced where plain user errors and could be handled via the phone very quickly. 

The hardest error to fix was a user who just didn't get the enrolment notification. Turned out, the user accidentally had switched on _do not distrub_. And also had no idea that option existed...





[archibucket]: https://bitbucket.org/archipunt/go-jamf-pro/src/master/
[migrate-mobile-account]: https://github.com/rtrouton/rtrouton_scripts/blob/master/rtrouton_scripts/migrate_ad_mobile_account_to_local_account/MigrateADMobileAccounttoLocalAccount.command
[apsd]: https://www.reddit.com/r/macsysadmin/comments/c97zgf/removing_apsdkeychain_to_enroll_devices_in_dep/
