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

  def sections
    x_start = 0

    sections = []
    while x_start < @image_magick_image.columns do
      x_end = [x_start + rand(@image_magick_image.columns / 10),
               @image_magick_image.columns].min

      section = Section.new(from: x_start,
                            to: x_end)

      x_start = x_end
      sections << section
    end

    sections.shuffle
  end

  def pixel_color(x,y)
    @image_magick_image.pixel_color(x,y)
  end
end

