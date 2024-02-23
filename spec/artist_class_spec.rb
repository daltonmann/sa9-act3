require 'artist_class'

RSpec.describe Artist do
  describe "#initialize" do
    it "creates an artist with default values" do
      artist = Artist.new
      expect(artist.name).to eq('unknown')
      expect(artist.birth_year).to eq(-1)
      expect(artist.death_year).to eq(-1)
    end

    it 'creates an artist with specific values' do
      artist = Artist.new('Van Gogh', 1853, 1890)
      expect(artist.name).to eq('Van Gogh')
      expect(artist.birth_year).to eq(1853)
      expect(artist.death_year).to eq(1890)
    end
  end

  describe '#print_info' do
    it 'creates an artist with known information' do
      artist = Artist.new('Van Gogh', 1853, 1890)
      expect{artist.print_info}.to output("Artist: Van Gogh (1853 to 1890)\n").to_stdout
    end

    it 'creates an artist who is still living' do
      artist = Artist.new('Van Gogh', 1853)
      expect{artist.print_info}.to output("Artist: Van Gogh (1853 to present)\n").to_stdout
    end

    it 'creates an artist with unknown birth and death years' do
      artist = Artist.new('Van Gogh')
      expect{artist.print_info}.to output("Artist: Van Gogh (unknown)\n").to_stdout
    end

    it 'creates an artist with no information' do
      artist = Artist.new
      expect{artist.print_info}.to output("Artist: unknown (unknown)\n").to_stdout
    end
  end
end

RSpec.describe Artwork do
  describe '#initialize' do
    it 'creates an artwork with default values' do
      artwork = Artwork.new
      expect(artwork.title).to eq('unknown')
      expect(artwork.year_created).to eq(-1)
      expect(artwork.artist.name).to eq('unknown')
    end

    it 'creates an artwork with specific values' do
      artist = Artist.new('Van Gogh', 1853, 1890)
      artwork = Artwork.new('Starry Night', 1889, artist)
      expect(artwork.title).to eq('Starry Night')
      expect(artwork.year_created).to eq(1889)
      expect(artwork.artist.name).to eq('Van Gogh')
    end
  end

  describe '#print_info' do
    it 'prints artwork information' do
      artist = Artist.new('Van Gogh', 1853, 1890)
      artwork = Artwork.new('Starry Night', 1889, artist)
      expect { artwork.print_info }.to output("Artist: Van Gogh (1853 to 1890)\nTitle: Starry Night, 1889\n").to_stdout
    end
  end
end
