module GoogleFonts
  def google_fonts_loader
    fonts = case config[:google_fonts].length
    when 1
      base_url("#{config[:google_fonts][0]}")
    when 2
      base_url("#{config[:google_fonts][0]}|#{config[:google_fonts][1]}")
    else
      ''
    end
  end

  def base_url(fonts)
    %Q(<link href="https://fonts.googleapis.com/css?family=#{fonts}" rel="stylesheet">)
  end
end

include GoogleFonts
