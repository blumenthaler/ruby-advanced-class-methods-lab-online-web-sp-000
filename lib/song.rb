
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
    song
  end
  
  def self.new_by_name(string)
    song = self.new
    song.name = string
    song
  end
  
  def self.create_by_name(string)
    song = self.new_by_name(string)
    song.save
    song
  end
  
  def self.find_by_name(string)
    song = self.all.select {|song| song.name == string}
    song[0]
  end
  
  
  def self.find_or_create_by_name(string)
    if !self.find_by_name(string)
      self.create_by_name(string)
    else
      self.find_by_name(string)
    end
  end
  
  def self.alphabetical
    self.all.sort_by {|song| song.name[0]}
  end
  
  def self.new_from_filename(filename)
    song_data = filename.sub!(/.mp3/,'').split(' - ')
    song = self.create
    song.artist_name = song_data[0]
    song.name = song_data[1]
    song
  end
  
  def self.create_from_filename(filename)
    song = self.new_from_filename(filename)
  end
  
  def self.destroy_all
    self.all.clear
  end
end
