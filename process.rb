#$LOAD_PATH.unshift('lib/*')
require 'rubygems'
require 'bundler/setup'
require 'rmagick'
require 'pry'

require_relative 'lib/shredder'
require_relative 'lib/deshredder'

in_file = 'data/background0155.jpg'
out_file = 'data/background_out.jpg'

shredder = Shredder.new
shredder.from_file(in_file, out_file)

#deshredder = Deshredder.new
#deshredder.from_file(file)

