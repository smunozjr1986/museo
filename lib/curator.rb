class Curator

  attr_reader :artists,
              :museums,
              :photographs

  def initialize
    @artists = []
    @museums = []
    @photographs = []
  end

  def add_museum(data)
    museums << Museum.new({id: (museums.count + 1), name: data[:name] })
  end

  def add_artist(data)
    artists << Artist.new({born: 1902, country: "United States", died: 1984, id: 1, name: data[:name], })
  end

  def add_photograph(data)
    photographs << Photograph.new({artist_id: 1, id:
      (photographs.count + 1), museum_id: 1, name: "Moonrise, Hernandez", year: 1941})
  end

  def find_museum(data)
    museums.each.find do |museum|
      museum if museum.id == data
    end
  end

  def find_artist(data)
    artists.each.find do |artist|
      artist if artist.id == data
    end
  end

  def find_museum_by_photograph(data)
    museums[data.museum_id-1]
  end

  def find_artist_by_photograph(data)
    artists[data.artist_id-1]
  end

end
