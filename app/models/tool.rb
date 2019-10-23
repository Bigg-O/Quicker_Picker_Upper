class Tool < ApplicationRecord
    belongs_to :room
    has_many :roominfos

    # CLASS METHODS

end
