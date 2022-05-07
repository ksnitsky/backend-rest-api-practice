class ApplicationRecord < ActiveRecord::Base
  primary_abstract_class

  def change_rating(num)
    update(rating: (self.rating += num))
  end
end
