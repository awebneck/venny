require 'set'

VENNY_PATH = File.dirname(__FILE__) + '/venny/'
[
  'std_lib_ext'
].each do |library|
  require VENNY_PATH + library
end
