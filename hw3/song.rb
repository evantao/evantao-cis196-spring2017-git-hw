class Song
  
  attr_reader :name
  attr_reader :artist_name
  attr_reader :errors
  attr_reader :validators
  @all = []
  @now_playing = nil

  def initialize(name, artist_name)
    @name = name
    @artist_name = artist_name
    @errors = []
    @validators = [validate_name, validate_artist_name, validate_in_spotify]
  end

  def self.all 
    @all
  end

  def self.now_playing
    @now_playing
  end

  def self.now_playing=(now_playing)
    @now_playing = now_playing
  end
  
  def song_search
    @name.gsub(' ', '+') + '+' + @artist_name.gsub(' ', '+')
    end

  def validate_name
    lam = -> { errors << "The song's name must not be empty" if @name.empty? }
  end

  def validate_artist_name
    lam = -> { errors << "The artist's name must not be empty" if @artist_name.empty? }
  end
  
  def validate_in_spotify
    lam = lambda { if @artist_name.empty? || @name.empty?
                     errors << "The song you entered does not exist in Spotify"
                   elsif false 
                     errors << "The song you entered does not exist in Spotify" 
                   end }
  end

  def valid?
    if !errors.empty?
      errors.clear
    end
    @validators.each { |method| method.call }
    if errors.empty?
      true
    else
      errors.each { |error| puts error }
      false
    end
  end

  def self.list
    if all.empty?
      puts 'There are no songs in your library'
    else
      puts 'Song library: '
      i = 0
      all.each { |song| puts (i+=1).to_s + '. ' + song.name + ' by ' + song.artist_name }
    end
  end

  def self.request_info
    puts 'What is the name of the song?'
    s_name = gets.strip
    puts "What is the artist's name?"
    a_name = gets.strip
    s = self.new(s_name, a_name)
  end
  
  def self.add
    s = self.request_info
    if !s.nil? && s.valid?
      @all << s
      puts 'The song was added successfully'
    end  
  end
  
  def self.play
    s = self.request_info
    if !s.nil? && s.valid? 
      @now_playing = s
      puts 'Now playing: ' + s.name + ' by ' + s.artist_name
    end
  end
  
  def self.current
    if @now_playing.nil?
      puts "There's no song playing right now"
    else puts 'Now playing: ' + @now_playing.name + ' by ' + @now_playing.artist_name
    end
  end

end
