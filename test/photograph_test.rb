require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/photograph'

class PhotographTest < Minitest::Test

  def test_if_it_exist
  photograph = Photograph.new({name: "Rue Mouffetard, Paris (Boy with Bottles)", id: 1, artist_id: 4, museum_id: 2, year: 1954})

  assert_instance_of Photograph, photograph
  end
end
