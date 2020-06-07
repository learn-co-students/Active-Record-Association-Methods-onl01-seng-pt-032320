class Artist < ActiveRecord::Base
  has_many :songs
  has_many :genres, through: :songs

  def get_first_song
    self.songs.first
  end

  def get_genre_of_first_song
    self.get_first_song.genre
  end

  def song_count
    self.songs.size
  end

  def genre_count
    self.songs.map do |song|
      song.genre
    end.uniq.size
  end
end
