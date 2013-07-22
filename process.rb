#$LOAD_PATH.unshift('lib/*')
require 'rubygems'
require 'bundler/setup'
require 'rmagick'
require 'pry'

require_relative 'lib/shredding/shredder'
require_relative 'lib/deshredding/deshredder'

in_file = 'data/background0155.jpg'
out_file = 'data/background_shredded.jpg'

shredder = Shredder.new
shredder.from_file(in_file, out_file)

#in_file = 'data/background_out.jpg'
#out_file = 'data/background_deshredded.jpg'

#deshredder = Deshredder.new
#deshredder.analyse(in_file, out_file)
