class App < ActiveRecord::Base

  has_many :builds

  def to_param
    name
  end

end