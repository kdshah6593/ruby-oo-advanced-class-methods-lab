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
    song = self.new
    song.save
    return song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    return song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    song.save
    return song
  end

  def self.find_by_name(name)
    @@all.find { |song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if self.all.include?(self.find_by_name(name))
      return self.find_by_name(name)
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by { |song| song.name }
  end

  def self.new_from_filename(song_filename)
    song_data = song_filename.split(" - ").collect {|item| item.split(".")}.flatten
    song = self.new
    song.artist_name = song_data[0]
    song.name = song_data[1]
    song
  end

  def self.create_from_filename(song_filename)
    song_data = song_filename.split(" - ").collect {|item| item.split(".")}.flatten
    song = self.new
    song.artist_name = song_data[0]
    song.name = song_data[1]
    song.save
    song
  end

  def self.destroy_all
    self.all.clear
  end

end
