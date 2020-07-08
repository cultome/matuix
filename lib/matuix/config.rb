module Matuix::Config
  def tick_duration
    0.05
  end

  def colors
    @colors ||= %w[#193300 #336600 #4C9900 #66CC00 #80FF00 #99FF33 #B2FF66 #CCFF99 #E5FFCC]
  end

  def letter_mutation_ratio
    5
  end

  def head_letter_color
    '#FFFFFF'
  end

  def letters
    @letters ||= [
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
  end
end
