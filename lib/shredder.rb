require 'ostruct'

class Shredder
  def from_file(in_file, out_file)
    source = SourceImage.new(in_file)
    destination = DestinationImage.new(source.columns, source.rows)

    destination_x = 0

    source.sections.each do |section|
      (section.from..section.to).each do |x|
        (0..source.rows).each do |y|
          destination.pixel_color(destination_x,
                                  y,
                                  source.pixel_color(x,y))
        end
        destination_x = destination_x + 1
      end
    end

    destination.write(out_file)
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

  def sections
    x_start = 0
    puts "#{@image_magick_image.columns}x#{@image_magick_image.rows}"

    sections = []
    while x_start < @image_magick_image.columns do
      x_end = [x_start + rand(@image_magick_image.columns / 10),
               @image_magick_image.columns].min

      section = Section.new(from: x_start,
                            to: x_end)

      puts "section #{section.from},#{section.to}"
      x_start = x_end
      sections << section
    end

    sections.shuffle
  end

  #number_of_sections = rand(10..30)
  #sections = (1..number_of_sections).map do |section_number|

  def pixel_color(x,y)
    @image_magick_image.pixel_color(x,y)
  end
end

class Section < OpenStruct
end

class DestinationImage
  def initialize(columns, rows)
    @image_magick_image = Magick::Image.new(columns, rows)
  end

  def pixel_color(x,y,pixel)
    @image_magick_image.pixel_color(x,y,pixel)
  end

  def write(file)
    @image_magick_image.write(file)
  end
end

#offset_start = Random.rand(source.columns)
#offset_width = 100 #Random.rand(offset_start..source.columns) - offset_start
#(0..img.columns).each
#pixels = img.get_pixels(0,0,img.width, img.height)
#binding.pry
##img.each_pixel do |pixel, c, r|
##pixels[c][r] = pixel
