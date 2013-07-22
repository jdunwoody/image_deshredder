#encoding utf-8

class Pixel
  attr_reader :x, :y, :pixel

  def initialize(x,y,pixel)
    @pixel = pixel
    @x = x
    @y = y
  end

  def closeness_score(other_pixel)
    (@pixel.red - other_pixel.red).abs
    + (@pixel.green - other_pixel.green).abs
    + (@pixel.blue - other_pixel.blue).abs
  end
end
