class Menu < ActiveRecord::Base
  has_many :food_genres
  belongs_to :cafes
end

class Cafe < ActiveRecord::Base
  has_many :menus

end

class User  < ActiveRecord::Base
  has_many :orders
  has_many :lunchbags
end

class Food_genre  < ActiveRecord::Base
end


class Order < ActiveRecord::Base
  belongs_to :users
end

class LunchBag < ActiveRecord::Base
   belongs_to :users
end

#not going to bother with friendly ids; not enough time
#     extend FriendlyId
# #     friendly_id :title, use: :slugged


# #  # validates_presence_of :slug

# #   def to_param
# #     slug
# #   end

