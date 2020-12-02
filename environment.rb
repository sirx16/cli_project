#* Require gems
require "pry"
require "httparty"
require "json"

#* require necessary files that are outside of the program

require_relative './lib/api.rb'

require_relative './lib/article.rb'

require_relative './lib/cli.rb'

#require_relative is a subset of require that you can use when referring to a file that is related to the file you are currently working on