---
title: overview of a business card
description: business card template
created_at: 2017-12-01 12:54:05 -0500
last_updated: 2017-12-01 12:54:05 -0500
kind: article
published: true
---

A business card is an erb partial which will manage responsive layout and text.

At minimum it is this;

~~~ruby
    <%= render '/partials/card.*', data: {} %>
~~~

The data has 5 optional attributes: `title`, `org`, `date`, `summary`, `list`

Let's review those each;

### title

Title is the name of the card. It can be a job description, subject of the card, or other content. The idea of the title is it is something about you.

~~~ruby
  <%= render '/partials/card.*', data: {
    title: My first business Card
  } %>
~~~

This will produce a card that looks like so;

### org (optional)

Org represents the company, institution, or similar concept that is associated to the title.

~~~ruby
  <%= render '/partials/card.*', data: {
    title: My first business Card,
    org: 'Pretend business name'
  } %>
~~~

This will produce a card that looks like so;

### date (optional)

Date represents the time you were involved at this org. It is a string value so it can take any kind of input.

~~~ruby
  <%= render '/partials/card.*', data: {
    title: My first business Card,
    org: 'Pretend business name',
    date: 'Jan 1 - Dec 31, 2035'
  } %>
~~~

This will produce a card that looks like so;

### summary (optional)

Summary is a paragraph which provides you with a few words about your time spent on that business card.

~~~ruby
  <%= render '/partials/card.*', data: {
    title: My first business Card,
    org: 'Pretend business name',
    date: 'Jan 1 - Dec 31, 2035',
    summary: 'I needed to make some business cards to get a job
      so this is one of them.'
  } %>
~~~

This will produce a card that looks like so;

### list (optional)

list comes in two forms. With or without a url. lists are an array of hashes

~~~ruby
  <%= render '/partials/card.*', data: {
    title: My first business Card,
    org: 'Pretend business name',
    date: 'Jan 1 - Dec 31, 2035',
    summary: 'I needed to make some business cards to get a job
      so this is one of them.',
    list: [
      {
        name: 'Just a list without a link',
      },
      {
        name: 'Google is a website',
        url: 'google link'
      },
  } %>
~~~

### Lazy reward

You can also make a card by simply adding the class `class='card'` to a div. That can be for something where you want to insert a random note or whatever. Like so;

~~~ruby

<div class="card">
  <p class="p">
    I am a card.
  </p>
</div>

~~~

This will produce a card that looks like so;




It's up to you how you want to do it!

And that is a business card.

There is one other type of 'card' which is called a 'break'. It is for the times in your story that you want to tell. Here is an example;

break image

To learn how break's work - [visit the post]()
