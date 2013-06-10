require 'rubygems'
require 'bundler/setup'
require 'rmagick'
require 'pry'

pixels = []

file = '/Users/james/Pictures/background0155.jpg'

img = Magick::Image::read(file).first

img.each_pixel do |pixel, c, r|
  binding.pry
  pixels.push(pixel)
end
