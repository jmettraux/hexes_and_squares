
require 'hexapdf'

# A4 595 x 842
# inch is 72 points

INCH = 72.0
MAR = INCH * 0.17
#MAR = 13

doc = HexaPDF::Document.new
page = doc.pages.add

page.box(
  :trim,
  HexaPDF::Rectangle.new([ 595 - 2 * MAR, 842 - 1 * MAR, MAR, MAR ]))
page.box(
  :crop,
  HexaPDF::Rectangle.new([ 595 - 2 * MAR, 842 - 1 * MAR, MAR, MAR ]))

canvas = page.canvas

canvas.stroke_color('grey')

def cross(c, x, y)
  hl = INCH / 15.0
  c.line(x, y - hl, x, y + hl)
  c.line(x - hl, y, x + hl, y)
end

12.times do |y|
  9.times do |x|
    cross(canvas, x * INCH - MAR, y * INCH - MAR)
  end
end
canvas.stroke

doc.write('squares.pdf')

