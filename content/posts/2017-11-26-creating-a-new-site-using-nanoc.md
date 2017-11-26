---
title: creating and deploying a nanoc 4 static website
created_at: 2017-11-26 11:44:17 -0500
kind: article
published: true
---

I was recently on the market for a new static site generator. I looked at the lists of popular options. I vistied [Static Gen](https://www.staticgen.com/), a site designated to comparing static site generators, to see what was available. My preference was a Ruby site so I narrowed in on middleman, jekyll, and nanoc. I decided on nanoc for a few reasons.

First, I wanted to have a site that was more than just a blog. Jekyll is by far the strongest leader of blog sites. I had used middleman in the past and liked the flexibility. Truth be told, what had me try nanoc was that there were Zero issues or pull requests on a repo containing over 5,000 commits. Impressive! That gave me the sense that any question or issue I might have would be resolved quickly.

I followed along the tutorial but found it lacking a few specific steps. Specifically, I wasn't sure how to deploy or post a blog. I googled for a few tutorials and was surprised to discover the most popular one was from 2012 that covered Nanoc Version 3. Nanoc is now on Version 4.

This post collects the best content from the nanoc tutorial, david clrk's post, and my own additions. Feel free to read those but I want to have a complete step by step process in one post. So here goes!

## Step 1. Installation

Let's install nanoc, create a site, and add a gemfile.

`gem install nanoc`

Once that installs, you can use

`nanoc create-site [site name]`

The official tutorial has readers installing global gems rather than managing the site's gems through a gemfile. I prefer a gemfile so I created one with the following gems

```
gem 'nanoc'       # because it's a nanoc site
gem 'kramdown'    # markdown
gem 'adsf'        # server
gem 'stringex'    # string parsing
gem 'rake'        # have some rake tasks

group :nanoc do
  gem 'guard-nanoc'
end
```

Nanoc does a good job of keeping out extra content. The point that I have to deliberaly create a gemfile and a rakefile is proof that this project is not currently suffering from bloat. That's a good thing to me!

Run `bundle` to install those gems.

## Step 2. Viewing locally

Nanoc serves static content. By default, nanoc puts all static content into a folder called 'output'. We're going to use github pages to serve our site and github uses a directory called **docs**.

Override the output directory by visiting `nanoc.yaml` and changing the line like so;

`output_dir: docs`

Nanoc comes with an empty `output/` directory but we don't need that so you can just delete it.

In order to create a static version of the site, run the command

`bundle exec nanoc`

If all goes well, here is what the output should look like;

```
$ bundle exec nanoc
Loading site… done
Compiling site…
      create  [0.00s]  docs/index.html
      create  [0.00s]  docs/stylesheet.css

Site compiled in 0.01s.
```

To view your site locally run

`bundle exec nanoc view`

You should see your new site at [localhost:3000](http://127.0.0.1:3000/)

## Step 3. Improving development experience

Nanoc outsources live reload to guard, which is why we installed guard-nanoc. Let's create a nanoc guard file.

`bundle exec guard init nanoc`

Now, run `bundle exec nanoc live` to have live updates.

## Step 2. Deployment to Github

I like to deploy as soon as possible so I know the rocket can get off the launch pad.
If you have a github account and know how to use it, then this part will be very easy for you. If you are not familiar with github, please [visit this page]().

### Sidenote nanoc deploy

Nanoc comes with `nanoc deploy`. However, I found the explanation and implementation to be more complicated than necessary. Github allows static sites to be served from master branch out of a specific directory called **docs**.

### Configuring github

1. Create a new repo
2. follow typical git commands;

```
git init
git add .
git commit -m "New Nanoc Site"
git remote add origin [YOUR REPO HERE DUDE]
git push -u origin master
```

Then, visit /settings and change the static site to 'master/docs'

Once you push your repo, then your site is deployed!

## But but..

At this point you may have run over to your newly deployed site and noticed that it doesn't look like the local one.

![picture of local]()

![picture of deployed]()

At this point, you have two options;

1. Simply add a CNAME to `content/` directory and github pages will use that domain.

## Part 2

If you don't want to go out and buy a domain name everytime, then you probably want the ability to manage urls dynamically. Let's address that in the next post...

be nanoc --env=[prod]

# problem -
- stylesheets / dynamic paths

1. nanoc.yaml comes as a @config
2. need an env variable
3. build some link_to helpers for stylesheets
4. how to deploy with nanoc stylesheets


## Step 4. Introducing some guts

2. Or, you need to configure base url. Let's proceed with configuring the base_url.

`be nanoc --env=[prod]`

## adding content

All our code will be managed in `content/`, `layouts/`, `Rules`, and `lib/`. We will talk about these later.
