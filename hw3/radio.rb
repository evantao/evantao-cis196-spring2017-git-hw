require './song'

class Radio
  
  def run 
    loop do
      puts "Do you want to view the 'current song', 'play a song', 'add a song' to your library, 'list songs' in your library, or exit?"
      line = gets.strip
      if line == 'exit'
        break
      else
        match_user_input(line)
      end
    end
  end
  
  def match_user_input(line)
    if line == 'current song'
      Song.current
    elsif line == 'play a song'
      Song.play 
    elsif line == 'add a song'
      Song.add
    elsif line == 'list songs'
      Song.list
    else
      puts "I didn't understand that"
    end  
  end   
end
  
