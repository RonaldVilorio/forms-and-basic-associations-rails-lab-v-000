class Song < ActiveRecord::Base
  belongs_to :artist
  belongs_to :genre
  has_many :notes

  def artist_name=(name)
    self.artist = Artist.find_or_create_by(name: name)
  end
  def artist_name
    if self.artist
      self.artist.name
    end
  end
  def note_ids=(ids)
    note = Note.find_or_create_by(id)
    self.notes << note
  end

  def genre_name=(id)
    self.genre = Genre.find_by(id: id)
  end
  def genre_name
    if self.genre
      self.genre.name
    end
  end

end
