---
title: how to write a technical blog post
description: Some simple suggestions on how and why you should write technical posts.
created_at: 2017-11-30
last_updated: 2017-11-30
kind: article
published: true
tags: ['writing', 'tutorial', 'marketing']
---

So you want to be a technical blogger. Great! It is really not as difficult as it seems. Many times, technical posts are the outflow of someone who is taking notes while they are learning new subjects themselves.

This post is going to cover a few of the basics in hopes to give you the confidence that you too can write technical blogs.

But first, I want to share a few reasons why I write blog posts. I want to start here to give you additional motivation and determination to write so that you can break through any kinds of obstacles.

Blogging is a great way to introduce yourself. The exercise of blogging is writing. Good writing takes time, effort, and determination. Good writing is rare. Good writing captures the readers attention. Bad writing makes you start scrolling.

<!-- more -->

Blogging is also a great way to market yourself. You can demonstrate your grasp of subjects that companies are in the market for. By blogging about your skills, you set yourself apart as someone who is genuinely interested in the subject and not just saying so during the interview.

Lastly, as I mentioned, blogging helps you thinking and learn for yourself. By committing to words, you are thereby committing your understanding because after all, you are writing as best you know how, right!

So let's dive into how to write a technical blog post!

### Step 1: Find something that interests you

It's difficult to spend time writing for free if it's not for fun. So your incentive should be an opportunity to document what you are currently learning. Rather than taking notes in your evernote or dropbox take notes here so that people can see what you're working on.

### Step 2: Give a specific title

The more specific title, the more specific your audience. If you write a 'how to' then put that in the title. There are many titles out there built for click bait, but I don't think technical posts are where you want random readers. Especially if you decide to include comments.

### Step 3: Writing about code? Then add some code snippets

Not all technical posts have to include code. But if they do, it is helpful to provide some snippets for your readers to follow along.

~~~ruby
route '/**/*.{html,md}' do
  if item.identifier =~ '/index.*'
    '/index.html'
  else
    item.identifier.without_ext + '/index.html'
  end
end

layout '/**/*', :erb
~~~

Here is a simple javascript function that when you call `hello()`, it will return `hi`

~~~javascript
function hello() {
  return 'hi'
}
~~~
