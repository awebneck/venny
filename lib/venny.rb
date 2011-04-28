require 'set'

VENNY_PATH = File.dirname(__FILE__) + '/venny/'
[
  'stdlib_ext'
],each do |library|
  require VENNY_PATH + library
end
