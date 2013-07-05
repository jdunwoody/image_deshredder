class Shredder
  attr_accessor :number_of_sections

  def from_file(in_file, out_file)
    source = SourceImage.new(in_file)
    destination = DestinationImage.new(source.columns, source.rows)

    destination_x = 0

    source.sections.each do |section|
      source_x = section.x

      (0..source.rows).each do |y|
        destination.pixel_color(destination_x,
                                y,
                                source.pixel_color(source_x,y))
      end
      destination_x = destination_x + 1
    end

    destination.write(out_file)
  end
end

class SourceImage
  def initialize(file)
    @image_magick_image= Magick::Image::read(file).first
  end

  def sections
    [50,100,150,200,300]
  end
end

class DestinationImage
  def initialize(columns, rows)
    @image_magick_image = Magick::Image.new(columns, rows)
  end
end

#offset_start = Random.rand(source.columns)
#offset_width = 100 #Random.rand(offset_start..source.columns) - offset_start
#(0..img.columns).each
#pixels = img.get_pixels(0,0,img.width, img.height)
#binding.pry
##img.each_pixel do |pixel, c, r|
##pixels[c][r] = pixel
