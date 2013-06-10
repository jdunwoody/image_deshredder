#$LOAD_PATH.unshift('lib/*')
require 'rubygems'
require 'bundler/setup'
require 'rmagick'
require 'pry'

require_relative 'lib/deshredder'

file = '/Users/james/Pictures/background0155.jpg'

deshredder = Deshredder.new

deshredder.from_file(file)

