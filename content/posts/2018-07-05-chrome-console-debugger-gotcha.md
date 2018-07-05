---
title: Chrome Console Debugger Gotcha
description: An issue with Javascript Imports that got me.
created_at: 2018-07-05 09:00:54 -0400
last_updated: 2018-07-05 09:00:54 -0400
kind: article
published: true
tags: ["blog"]
---

Google Chrome Debugger is one of my favorite tools. I use it in both environments, development, and testing because it reveals the state and data of an object that I don't know anything about. Just yesterday I discovered an issue related to how and when it recognizes Javascript `imports`. I mistakenly thought that some modules were not available because, in debugger, chrome console said they were not found. I was confused because the console was picking up other variables, but for some of the imported ones, it was returning `undefined`.

    import Component from 'component';
    // down later in a debugger session
    debugger
    // Component
    // => undefined or 'cant find Component'

What I ended up doing is something similar to this;

    import Component from 'component';
    // down later in a debugger session
    let c = Component
    debugger
    // Now, Component is assigned to c and it is in context.

I think that has caused me to take some longer journeys. My code will be much cleaner now moving forward. Promise :-)
