---
title: working with javascript modules
description: Adjusting to JAM
created_at: 2017-12-04 12:27:30 -0500
last_updated: 2017-12-04 12:27:30 -0500
kind: article
published: false
---

JavaScript modules serve two purposes as I see. They allow you to easily consume packages from npm. They allow you to develop modular code. Modules make JavaScript highly configurable. If you are new to JavaScript or do not work with modules much, it is easy to be overwhelmed at the many moving parts. I confess I was until I slowed down and recognized the pattern that developing with modules takes on.

1. Modules can be created by you or pulled down via npm.
2. let's start with install packages via npm
3. require them wherever needed
4. name the require whatever you want
5. the package you require has exported some or all of it's contents
you do your work, which might include overriding, merging, or using content required.
6. then export what you want
