class Video < ApplicationRecord
  validates :link, presence: true

  before_save :embed_link

  private

  # detects if the link is from youtube or vimeo as the src is different for the two

  def detect_host
    if self.link =~ /(youtube)/
      "<iframe width='560' height='315' src='https://www.youtube.com/embed/#{youtube_code}' frameborder='0' allow='accelerometer; autoplay; encrypted-media; gyroscope; picture-in-picture' allowfullscreen></iframe>"
    else
      "<iframe src='https://player.vimeo.com/video/#{vimeo_code}?color=ffffff' width='640' height='360' frameborder='0' allow='autoplay; fullscreen' allowfullscreen></iframe>"
    end
  end

  # retrives the youtube/vimeo code

  def youtube_code
    code = self.link.match(/v=(.*)/)
    code.captures.first
  end

  def vimeo_code
    code = self.link.match(/.com\/(.*)/)
    code.captures.first
  end

  # will set the embed attribute to an iframe object which is inserted directly into the DOM

  def embed_link
    self.embed = detect_host
  end
end
