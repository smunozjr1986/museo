class Photograph

  attr_reader :name,
              :id,
              :artist_id,
              :museum_id,
              :year

  def initialize(name:, id:, artist_id:, museum_id:, year:)

    @name = name
    @id = id
    @artist_id = artist_id
    @museum_id = museum_id
    @year = year
  end


end
