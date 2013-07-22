#encoding utf-8
class DestinationImage
  def initialize(columns, rows)
    @image_magick_image = Magick::Image.new(columns, rows)
  end

  def pixel(x,y,pixel)
    @image_magick_image.pixel_color(x,y,pixel)
  end

  def write(file)
    @image_magick_image.write(file)
  end
end
