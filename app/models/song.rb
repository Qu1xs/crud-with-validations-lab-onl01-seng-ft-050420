class Song < ApplicationRecord
    # Must not be blank
    # Cannot be repeated by the same artist in the same year
    validates :title, presence: true
    validates :title, uniqueness: { scope: [:artist_name, :release_year] }
    # Must be true or false
    validates :released, exclusion: { in: [nil] }
    # Optional if released is false
    # Must not be blank if released is true
    # Must be less than or equal to the current year
    validates :release_year, numericality: { 
    only_integer: true,
    presence: true, if: :released?,
    less_than_or_equal_to: ->(_song) { Date.current.year }
    }
    # Must not be blank
    validates :artist_name, presence: true
end
