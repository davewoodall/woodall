module Post
  def get_pretty_date(post)
    attribute_to_time(post[:last_updated]).strftime('%B %-d, %Y')
  end

  def created_at(post)
    attribute_to_time(post[:created_at]).strftime('%B %-d, %Y')
  end

  def show_tags(post)
    if tags_for(post) == '(none)'
      ''
    else
      post[:tags].map do |tag|
        "#{tag_link tag, class: 'tag'}"
      end.join(" ")
    end
  end

  def get_post_start(post)
    content = post.compiled_content
    if content =~ /\s<!-- more -->\s/
      content = content.partition('<!-- more -->').first +
      "<div class='read-more v-space'><a href='#{post.path}'>continue reading &rsaquo;</a></div>"
    end
    return content
  end

  def published_posts
    sorted_articles.select {|p| p if p[:published] == true }
  end

  def latest_post
    sorted_articles.select {|p| p if p[:published] == true }.first
  end
end

include Post
