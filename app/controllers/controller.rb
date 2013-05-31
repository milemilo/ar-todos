class Controller
  attr_reader :list
 
  def initialize
    argv_parser
    to_display = send_command
    display(to_display)
  end
 
  def argv_parser
    argv_entry = ARGV
    @command = argv_entry.shift
    @task = argv_entry.join(" ")
  end
 
  def send_command
    if List.respond_to?(@command)
      List.send @command, @task
    else  
      "Enter a valid command!"
    end  
  end
 
  def display(string)
    puts string
  end
end
