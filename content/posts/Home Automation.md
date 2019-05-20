---
title: "Home Automation"
date: 2019-05-09T19:49:05+01:00
draft: false
toc: false
images:
- img/post-cover.png
tags:
  - smarthome
---

 I've been experimenting/playing with home automation for a while now, specifically SmartThings and their development environment.  At first I was overwhelmed by it all as it seemed a steep learning curve, getting to grips with the Groovy IDE and terminology such as device handlers and SmartApps - but now it's a labour of love.  
 
 First things first though, home automation is largely pointless, it's un-necessary and will likely cause you more problems than it's worth :)  However, from a developer and technology perspective - it's AWESOME.  You can spend literally hours configuring devices to trigger events and turn things on/off, dim or change the colour of lights etc.  All at the expense of anyone else you live with, who will most likey hate it and just say "really?" when you've finally got the postbox to make the lamp flash on/off.

 The first smart device on the SmartThings ecosystem I toyed with was a Samsung Smart Fridge.  As well as a touch screen and speaker, this also has builtin sensors that report it's running temperature, how much energy it's using and whether either of the fridge/freezer doors are open/closed.  It also came with an ice dispenser, so my first challenge was to see if the sensors reported if it was dispensing ice or not (unfortunately it doesn't).  This is where you head over to the SmartThings Live Logging feature to watch all the activity within your home automation graph.  So the fall-back plan was to play "Ice Ice Baby" by Vanilla Ice whenever the freezer door was opened.

 I'm an avid Spotify user and subscribe to the Premium service, this give me access to Spotify Connect - allowing me to target individual playback devices.  Crucially, Spotify has an API that allows you to control what music track gets played and on what device, as well as controlling things such as the volume.  So the next challenge was how to invoke the Spotify API from SmartThings.  I initially thought about invoking it directly from a custom SmartApp, however this would have involved a fair amount of code in Groovy, which you have little control of where it actually runs and things like rate limits.  Instead I went with a server-side approach, creating a lightweight SmartApp that invokes an Azure Function which does the grunt work - automating Spotify via the API.  To make life even easier, I discovered a nuget package by Jonas Dellinger that wraps the Spotify API into a simple SDK.

 I've had some fun (and tears) with this project, but it's amazing what automation scenarios you can achieve.  For instance - I now have a "Game" mode for the entire house.  Using a little device from the team at https://konnected.io I've been able to convert the existing alarm sensors around the house into SmartThings sensors.  So, not only can I trigger different music from different sensors, I can choose where the music gets played, what lights to flash and so on ;)

 The full source code is available here: https://github.com/daltskin/ST-HomeAutomation