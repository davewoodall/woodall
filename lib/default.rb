include Nanoc::Helpers::Blogging
include Nanoc::Helpers::Tagging
include Nanoc::Helpers::Rendering
include Nanoc::Helpers::LinkTo
include Nanoc::Helpers::Text


def google_fonts_loader
  case config[:google_fonts].length
  when 1
    ''
  when 2
    %Q(<link href="https://fonts.googleapis.com/css?family=#{config[:google_fonts][0]}|#{config[:google_fonts][1]}" rel="stylesheet">)
  else
    ''
  end
end
