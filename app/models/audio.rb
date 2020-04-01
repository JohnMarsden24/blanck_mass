class Audio < ApplicationRecord

  def detect_album_or_song
    if self.link =~ /(album)/
      "<iframe src='https://open.spotify.com/embed/album/#{album_code}' width='300' height='auto' frameborder='0' allowtransparency='true' allow='encrypted-media'></iframe>"
    else
       "<iframe src='https://open.spotify.com/embed/track/#{track_code}' width='300' height='auto' frameborder='0' allowtransparency='true' allow='encrypted-media'></iframe>"
    end
  end

  def album_code
    code = self.link.match(/album\/(.*)/)
    code.captures.first
  end

  def track_code
    code = self.link.match(/track\/(.*)/)
    code.captures.first
  end

  def embed
    detect_album_or_song
  end
end

