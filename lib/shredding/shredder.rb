#encoding utf-8

require 'ostruct'
require_relative 'source_image'
require_relative 'destination_image'

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

class Section < OpenStruct
end

