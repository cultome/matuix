class Matuix::Screen
  def initialize(rows:, cols:)
    @tick = 0
    @rows = rows - 1
    @cols = cols - 1
    @grid = rows.times.map { ' ' * cols }
    @words = @cols.times.map { nil }
  end

  def display
    add_line?

    @words.each_with_index do |word, word_pos|
      next if word.nil?

      value = word.display(@tick)
      value.split('').each_with_index { |letter, idy| @grid[idy][word_pos] = letter }
    end

    @tick += 1

    @grid.join("\n")
  end

  def add_line?
    if rand > 0.5
      new_word_idx = @words.map.with_index { |word, idx| word.nil? ? idx : nil }.compact.sample

      @words[new_word_idx] = Matuix::Word.new(line_size: @rows, word_size: @rows / 2, started_at: @tick)
    end
  end
end
