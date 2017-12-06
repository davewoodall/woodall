module Footer
  def footer_blurb_written?
    if !!item[:footer_blurb]
      true
    elsif !!@config[:footer_blurb]
      true
    else
      false
    end
  end

  def footer_blurb
    if !!item[:footer_blurb]
      item[:footer_blurb]
    else !!@config[:footer_blurb]
      @config[:footer_blurb]
    end
  end

  def prev_page_exists?
    !!item[:prev_page]
  end

  def link_to_previous_page
    link_to item[:prev_page], "/#{item[:prev_page]}/"
  end

  def next_page_exists?
    !!item[:next_page]
  end

  def link_to_next_page
    link_to item[:next_page], "/#{item[:next_page]}/"
  end
end

include Footer
