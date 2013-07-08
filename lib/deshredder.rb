class Deshredder
  def analyse(in_file, out_file)
    source = SourceImage.new(in_file)
    destination = DestinationImage.new(source.columns, source.rows)

    (0..source.columns).each do |y|
      pixel = Pixel.new(0,y,source.pixel(0,y))

      best_score = [100000,pixel]

      ((y+1)..source.columns).each do |other_y|
        new_score = pixel.closeness_score(source.pixel(0,other_y))
        best_score = [new_score, pixel] if best_score.nil? || new_score < best_score[0]
      end

      (0..source.rows).each do |x|
        destination.pixel(x,y,best_score[1].pixel)
      end
    end

    destination.write(out_file)
  end
end

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
