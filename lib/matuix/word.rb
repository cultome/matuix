class Matuix::Word
  LETTER = %w[A B C D E F G H I J K L M N O P Q R S T U V W X Y Z]
  COLORS = %w[#7DFF6B #73EF61 #69E058 #5FD04F #55C146 #4BB23D #41A234 #37932B #2D8322 #237419]

  def initialize(line_size:, word_size:, step_size: rand(1..3), content: nil, started_at: 0)
    @line_size = line_size
    @step_size = step_size
    @started_at = started_at
    @word_size = word_size
    @content = content.nil? ? @line_size.times.map { LETTER.sample } : content.split('')
  end

  def display(tick)
    step = (tick - @started_at) / @step_size

    if step >= @line_size + @word_size
      @started_at = tick + 1
      return ' ' * @line_size
    end

    line = if step < @word_size
             segment = @content.take(step).join
             segment + rand_letter
           else
             segment = @content.drop(step - @word_size).take(@word_size).join
             ' ' * (step - @word_size) + segment + rand_letter
           end

    color_segment_size = @line_size / 10
    full_line = line.ljust(@line_size, ' ')[0...@line_size]
  end

  def rand_letter
    LETTER.sample
  end
end
