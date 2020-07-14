class Matuix::Word
  include Matuix::Config

  def initialize(line_size:, word_size:, step_size: rand(1..5), content: nil, started_at: 0)
    @line_size = line_size
    @step_size = step_size
    @started_at = started_at
    @word_size = word_size
    @content = content.nil? ? @line_size.times.map { letters.sample } : content.split('')
  end

  def display(tick)
    step = (tick - @started_at) / @step_size

    if step >= @line_size + @word_size
      @started_at = tick + 1
      return [' '] * @line_size
    end

    mutate_content! && calculate_content_at(step)
  end

  private

  def calculate_content_at(step)
    if step < @word_size
      apply_color(@content.take(step)) + [head_letter]
    else
      segment = @content.drop(step - @word_size).take(@word_size)
      [' '] * (step - @word_size) + apply_color(segment) + [head_letter]
    end[0...@line_size]
  end

  def mutate_content!
    letter_mutation_ratio.times do
      @content[rand(@content.size)] = letters.sample
    end
  end

  def apply_color(value)
    value.reverse.map.with_index do |letter, idx|
      if letter == ' '
        letter
      else
        gone_letters = @word_size > value.size ? @word_size - value.size : 0
        color_id = (@word_size - idx - gone_letters) / color_segment_size
        color = color_id < colors.size ? colors[color_id] : colors.last

        letter.fg(color)
      end
    end.reverse
  end

  def head_letter
    letters.sample.fg(head_letter_color).bright
  end

  def color_segment_size
    @word_size / colors.size
  end
end
