module TagPages
  # finds out every item containing tags
  # @return Array an array of Nanoc::Item
  def tagged_items
    @items.select do |item|
      item[:tags].is_a? Array
    end
  end

  # finds each tags from every page. Each tag appears once in the result
  # @return Array an array of String (tag)
  def all_tags
    # keeps from rebuilding tag list each time this method is called
    return @all_tags unless @all_tags.nil?

    tags = []
    tagged_items.each do |item|
      tags += item[:tags]
    end
    @all_tags = tags.uniq
  end

  # finds out what should tag pages base path should be
  # will read configuration in nanorc.yml file or provide
  # a default path (/tags)
  # @example Configuring tag prefix
  #
  #   tag_pages:
  #     prefix: /keywords
  #
  # @return String the tag page prefix
  def tag_pages_prefix
    default = "/tags"
    return @config[:tag_pages][:prefix] || default unless @config[:tag_pages].nil?
    default
  end

  # provide a link to a tag page. Uses #tag_page_pefix to build the tag page path
  # @see #tag_pages_prefix
  def tag_link tag, attributes = {}
    link_to tag, @items["#{tag_pages_prefix}/#{tag}.html"], attributes
  end

  # Same as Nanoc::Helpers::Tagging#tags_for, but provides a list of link
  # to the tag pages
  #
  # @return String
  def tag_links_for item, links_attributes = {}
    item[:tags].map { |tag| tag_link tag, links_attributes }.join(', ') unless item[:tags].nil?
  end

  # Creates one Nanoc::Item for each tag
  #
  # @see #tag_pages_prefix
  # @see #all_tags
  def create_tags_pages
    all_tags.map do |tag|
      @items.create(
       %Q(<% items_with_tag(\"#{tag}\").each do |item| %>
         <a class='blog-post-card' href="<%= item.path %>">
           <%= render '/partials/card.*',
             data: {
               title: item[:title],
               date: created_at(item),
               summary: item[:description]
             } %>
         </a>
         <% end %>),
        {
          title: "#{tag} posts",
          description: "Posts tagged '#{tag}'",
        },
        "#{tag_pages_prefix}/#{tag}.html"
      )
    end
  end
end

include TagPages
