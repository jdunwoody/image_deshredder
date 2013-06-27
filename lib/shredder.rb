class Shredder
  def from_file(in_file, out_file)
    image = Magick::Image::read(in_file).first

    offset_start = Random.rand(image.columns)
    offset_width = Random.rand(offset_start..image.columns) - offset_start

    (0..image.columns).each do |x|
      (0..image.rows).each do |y|
        if x >= offset_start && x <= offset_start + offset_width
          from = image.pixel_color(x, y)
          to = image.pixel_color(x + offset_width, y)

          image.pixel_color(x + offset_width, y, from)
          image.pixel_color(x, y, to)
        end
      end
    end

    image.write(out_file)
  end
end


#(0..img.columns).each
#pixels = img.get_pixels(0,0,img.width, img.height)
#binding.pry
##img.each_pixel do |pixel, c, r|
##pixels[c][r] = pixel
