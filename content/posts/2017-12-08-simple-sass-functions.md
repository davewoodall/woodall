---
title: simple sass functions
description: simple sass functions
created_at: 2017-12-08 11:09:26 -0500
last_updated: 2017-12-08 11:09:26 -0500
kind: article
published: false
tags: ["scss", "syntax", "vocab"]
---

I've been writing basic css as much as possible because I learned that many of the reasons I wrote scss were in css3. However, I the scss syntax is cleaner. I'm writing most of my CSS in Vue components these days. As such, there is no loss for adding  `<style :lang='scss'>` to the component and letting it compile as Webpack does.

A few functions that I recently came across looked interesting. I may try some of these;

```
$color: red
$amount: 0.5

rgba($color, $amount)
fade($color, $amount)
lighten($color, $amount)
darken($color, $amount)
```

Here is the full documentation;
http://sass-lang.com/documentation/Sass/Script/Functions.html
