class Roominfo < ApplicationRecord
    belongs_to :tool, :mess, :room
end
