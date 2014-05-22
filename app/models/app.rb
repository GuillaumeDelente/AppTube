class App < ActiveRecord::Base
  belongs_to :user
  has_many :builds

  def to_param
    name
  end

end