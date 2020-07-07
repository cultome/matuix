RSpec.describe Matuix do
  it "does something useful" do
    word = Matuix::Word.new(line_size: 6, word_size: 3, step_size: 1, content: "ABCDEFGHI")

    expect(word.display(0)).to eq 'X     '
    expect(word.display(1)).to eq 'AX    '
    expect(word.display(2)).to eq 'ABX   '
    expect(word.display(3)).to eq 'ABCX  '
    expect(word.display(4)).to eq ' BCDX '
    expect(word.display(5)).to eq '  CDEX'
    expect(word.display(6)).to eq '   DEF'
    expect(word.display(7)).to eq '    EF'
    expect(word.display(8)).to eq '     F'
    expect(word.display(9)).to eq '      '
    expect(word.display(10)).to eq 'X     '
    expect(word.display(11)).to eq 'AX    '
  end
end
