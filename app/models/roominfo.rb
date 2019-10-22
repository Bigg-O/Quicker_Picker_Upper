class Roominfo < ApplicationRecord
    belongs_to :tool
    belongs_to :mess
    belongs_to :room
end
