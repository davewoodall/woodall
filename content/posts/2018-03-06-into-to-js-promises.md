---
title: Hand roll a ECMA Promise
description: into to js promises
created_at: 2018-03-06 14:44:56 -0500
last_updated: 2018-03-06 14:44:56 -0500
kind: article
published: false
tags: ["javascript"]
---

I have been consuming Javascript Promises for a while but I had yet to build one from scratch. I wanted to be able to reason about the various moving parts so I wrote a simple promise to see how these things work together.

function successTwo() {
return {a: 'b', c: 'd'};
}

async function boom2() {
try {
var b = await successTwo();
console.log('we got success')
console.log(b)
} catch(e) {
console.log('we got error')
console.log(e)
}
}

boom2()

// function success(callback) {
// var data = {a: 'b', c: 'd'};
// callback(data);
// }

// function promiseFunction() {
// return new Promise(function(zebra, reject) {
// success(function(data) {
// console.log('from the success')
// zebra(data)
// })
// })
// }

// promiseFunction().then(function(response){
// console.log(response)
// })
