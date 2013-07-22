#encoding utf-8

class SourceImage
  def initialize(file)
    @image_magick_image= Magick::Image::read(file).first
  end

  def rows
    @image_magick_image.rows
  end

  def columns
    @image_magick_image.columns
  end

  def pixel(x,y)
    @image_magick_image.pixel_color(x,y)
  end
end
