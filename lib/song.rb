class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song
  end

    def self.create_by_name(song_name)
    song = self.create
    song.name = song_name
    song
  end

  def self.find_by_name(song_name)
    self.all.find {|n| n.name == song_name}
  end

  def self.find_or_create_by_name(song_name)

    if self.all.include?(song_name)== true
      return song_name
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    @@all.sort_by { |song| song.name[0] }
  end

  def self.new_from_filename(song_name)
    song = Song.new
    song.artist_name = song_name.split(".").first.split(" - ").first
    song.name = song_name.split(".").first.split(" - ").last
    song
  end

  def self.create_from_filename(song_name)
    song = Song.new
    song.artist_name = song_name.split(".").first.split(" - ").first
    song.name = song_name.split(".").first.split(" - ").last
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
