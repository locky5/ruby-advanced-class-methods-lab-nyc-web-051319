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
    song = Song.new # initializes song
    song.save
    song
  end

  def self.new_by_name(string)
    song = Song.new
    song.name = string
    song
  end

  def self.create_by_name(string)
    song = Song.new
    song.name = string
    song.save
    song
  end

  def self.find_by_name(string)
    self.all.find { |song| song.name == string}
  end

  def self.find_or_create_by_name(string)
    self.find_by_name(string) || self.create_by_name(string) # literally find OR create
  end

  def self.alphabetical
    name_array=self.all.sort_by { |song| song.name}
  end

  def self.new_from_filename(listname)
    new_song = listname.split(" - ")
    artist_name = new_song[0]
    song_name = new_song[1].chomp(".mp3")

    song = self.new
    song.artist_name = artist_name
    song.name = song_name
    song
  end

  def self.create_from_filename(listname)
    new_song = listname.split(" - ")
    artist_name = new_song[0]
    song_name = new_song[1].chomp(".mp3")

    song = self.create
    song.artist_name = artist_name
    song.name = song_name
    song
  end

  def self.destroy_all
    @@all.clear
  end

end
