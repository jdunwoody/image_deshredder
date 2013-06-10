class Deshredder

  def from_file(file)
    pixels = []

    img = Magick::Image::read(file).first

    img.each_pixel do |pixel, c, r|
      pixels.push(pixel)
    end
  end
end

