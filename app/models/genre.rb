class Genre < ActiveRecord::Base
  has_many :songs
  has_many :artists, through: :songs

  def song_count
    self.songs.count
  end

  def artist_count
    self.songs.map do |song|
      song.artist
    end.uniq.size
  end

  def all_artist_names
    self.songs.collect do |song|
      song.artist.name
    end
  end
end
