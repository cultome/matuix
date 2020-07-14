class Matuix::View
  include Matuix::Config

  def initialize(terminal, screen)
    @terminal = terminal
    @screen = screen
  end

  def start
    loop do
      @terminal.puts @screen.display, [0, 0]

      sleep tick_duration
    rescue Exception
      break
    end

    @terminal.clean
  end
end
