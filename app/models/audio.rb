class Audio < ApplicationRecord
  validates :link, presence: true

  before_save :embed_link

  private

  # detects if the link is an album or song as the src is different for the two

  def detect_album_or_song
    if self.link =~ /(album)/
      "<iframe src='https://open.spotify.com/embed/album/#{album_code}' width='300' height='auto' frameborder='0' allowtransparency='true' allow='encrypted-media'></iframe>"
    else
       "<iframe src='https://open.spotify.com/embed/track/#{track_code}' width='300' height='auto' frameborder='0' allowtransparency='true' allow='encrypted-media'></iframe>"
    end
  end

  # retrives the album/song code

  def album_code
    code = self.link.match(/album\/(.*)/)
    code.captures.first
  end

  def track_code
    code = self.link.match(/track\/(.*)/)
    code.captures.first
  end

  # will set the embed attribute to an iframe object which is inserted directly into the DOM

  def embed_link
    self.embed = detect_album_or_song
  end
end

