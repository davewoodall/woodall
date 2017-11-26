#!/usr/bin/env ruby

route '/posts/*' do
  y,m,d,slug = /([0-9]+)\-([0-9]+)\-([0-9]+)\-([^\/]+)/.match(item.identifier).captures
  "/#{y}/#{m}/#{slug.chomp('.md')}/index.html"
end

compile '/posts/*' do
  filter :kramdown
  layout '/post.*'
end

compile '/blog.html' do
  filter :erb
  layout '/blog.*' # this really should be index view but let's keep it simple and specific until we need to make this more generic.
end

compile '/**/*.html' do
  filter :erb
  layout '/default.*'
end

compile '/**/*.md' do
 filter :kramdown
 layout '/default.*'
end

route '/**/*.{html,md}' do
  if item.identifier =~ '/index.*'
    '/index.html'
  else
    item.identifier.without_ext + '/index.html'
  end
end

compile '/**/*.scss' do
  filter :sass, syntax: :scss
  write item.identifier.without_ext + '.css'
end

compile '/**/*' do
  write item.identifier.to_s
end

layout '/**/*', :erb
