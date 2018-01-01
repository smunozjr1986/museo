require 'minitest'
require 'minitest/autorun'
require 'minitest/pride'
require './lib/curator'
require './lib/artist'
require './lib/photograph'
require './lib/museum'

class CuratorTest < Minitest::Test

  def test_if_it_exist
    curator = Curator.new

    assert_instance_of Curator, curator
  end

  def test_if_artist_is_empty
    curator = Curator.new

    assert_equal [], curator.artists
  end

  def test_if_museums_is_empty
    curator = Curator.new

    assert_equal [], curator.museums
  end


    def test_if_photogrpahs_is_empty
      curator = Curator.new

      assert_equal [], curator.photographs
    end


      def test_add_museum_exist
        curator = Curator.new
        curator.add_museum(name: "MoMa")

        assert_equal 1, curator.museums.count
        assert_equal 1, curator.museums.first.id
      end

      def test_add_artist_exist
        curator = Curator.new
        curator.add_artist({born: 1902, country: "United States", died: 1984, id: 1, name: "Ansel Adams", })

        assert_equal 1, curator.artists.count
        assert_equal 1, curator.artists.first.id
      end

      def test_add_photograph_exist
        curator = Curator.new
        curator.add_photograph({ artist_id: 1, id: 1,  museum_id: 1, name: "Moonrise, Hernandez", year: 1941})

        assert_equal 1, curator.photographs.count
        assert_equal 1, curator.photographs.first.id
      end

      def test_add_find_museum_exist
        curator = Curator.new
        curator.add_museum({name: "Museo de Arte Mordeno"})
        museum = curator.find_museum(1)

        assert_equal "Museo de Arte Mordeno" , museum.name
        assert_equal 1, museum.id
      end

      def test_add_find_artist_exist
        curator = Curator.new
        curator.add_artist({name: "Ansel Adams", born: 1902, died: 1984, country: "United States"})
        artist = curator.find_artist(1)

        assert_equal "Ansel Adams" , artist.name
        assert_equal 1, artist.id
      end

      def test_find_museum_by_photograph
        curator = Curator.new
        curator.add_museum({name: "Metropolitan Museum of Art"})
        curator.add_artist({name: "Diane Arbus", born: 1923, died: 1971, country: "United States"})
        curator.add_photograph({name: "Identical Twins, Roselle, New Jersey", artist_id: 1, museum_id: 1, year: 1967})
        photograph = curator.photographs.first
        museum = curator.find_museum_by_photograph(photograph)

        assert_equal 1, museum.id
        assert_equal "Metropolitan Museum of Art", museum.name
      end

      def test_find_artist_by_photograph
        curator = Curator.new
        curator.add_museum({name: "Metropolitan Museum of Art"})
        curator.add_artist({name: "Diane Arbus", born: 1923, died: 1971, country: "United States"})
        curator.add_photograph({name: "Identical Twins, Roselle, New Jersey", artist_id: 1, museum_id: 1, year: 1967})
        photograph = curator.photographs.first
        artist = curator.find_artist_by_photograph(photograph)

        assert_equal 1, artist.id
        assert_equal "Diane Arbus", artist.name
      end

end
