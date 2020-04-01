class Video < ApplicationRecord

  def detect_host
    if self.link =~ /(youtube)/
      "<iframe width='560' height='315' src='https://www.youtube.com/embed/#{youtube_code}' frameborder='0' allow='accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture' allowfullscreen></iframe>"
    else
      "<iframe src='https://player.vimeo.com/video/#{vimeo_code}?color=ffffff' width='640' height='360' frameborder='0' allow='autoplay; fullscreen' allowfullscreen></iframe>"
    end
  end

  def youtube_code
    code = self.link.match(/v=(.*)/)
    code.captures.first
  end

  def vimeo_code
    code = self.link.match(/.com\/(.*)/)
    code.captures.first
  end

  def embed
    detect_host
  end

end
