class Matuix::Word
  # LETTER = %w[A B C D E F G H I J K L M N O P Q R S T U V W X Y Z]
  LETTER = [
    "\u00C6",
    "\u0194",
    "\u019A",
    "\u019F",
    "\u01EE",
    "\u0283",
    "\u0376",
    "\u039E",
    "\u0403",
    "\u0480",
    "\u05E2",
    "\u05DA",
    "\u05D1",
    "\u071B",
    "\u10F6",
    "\u13C6",
    "\u16F8",
    "\u1965",
    "\u19A1",
    "\u1C85",
    "\u1FFC",
    "\u2203",
    "\u2200",
    "\u22DB",
    "\u23DA",
    "\u2A09",
    "\u2C8A",
    "\u2C96",
  ]
  COLORS = %w[#193300 #336600 #4C9900 #66CC00 #80FF00 #99FF33 #B2FF66 #CCFF99 #E5FFCC]

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
      return @line_size.times.map { ' ' }
    end

    chars = if step < @word_size
             color_word(word_content.take(step)) + [head_letter]
           else
             segment = color_word(word_content.drop(step - @word_size).take(@word_size), true)
             [' '] * (step - @word_size) + segment + [head_letter]
           end

    (chars + [' '] * @line_size)[0...@line_size]
  end

  def word_content
    @content[rand(@content.size)] = LETTER.sample

    @content
  end

  def color_word(value, past = false)
    color_segment_size = @word_size / COLORS.size
    value.reverse.map.with_index do |letter, idx|
      if letter == ' '
        letter
      else
        color_id = if past
                     (@word_size - idx - (@word_size - value.size)) / color_segment_size
                   else
                     (@word_size - idx) / color_segment_size
                   end
        color = color_id < COLORS.size ? COLORS[color_id] : COLORS.last

        letter.fg(color)
      end
    end.reverse
  end

  def head_letter
    LETTER.sample.fg("#FFFFFF").bright
  end
end
