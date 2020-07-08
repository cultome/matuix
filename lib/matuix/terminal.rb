class Matuix::Terminal
  def initialize
    console.print "#{reset}#{clear}"
  end

  def max_width
    console.winsize.last - 1
  end

  def max_height
    console.winsize.first - 1
  end

  def close
    if @console
      # "#{disable_mouse}#{show_cursor}#{screen_colour_reset}#{reset}#{last_character_position}\n"
      @console.close
    end
  end

  def print(msg, position = []) # [col, row]
    set_pos(*position) unless position.empty?

    console.print msg
  end

  def puts(msg, position = []) # [col, row]
    set_pos(*position) unless position.empty?

    console.puts msg
  end

  def set_pos(x, y)
    print "\e[#{x};#{y}H"
  end

  private

  def console
    @console ||= IO.console
  end

  def clear
    "\e[2J"
  end

  def reset
    "\e[0m"
  end
end
