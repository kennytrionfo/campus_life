class User < ActiveRecord::Base

  validates :first_name, :last_name, presence: true

  def name
    [first_name, last_name].join(' ')
  end

  def age
    Time.now.year - birthday.year
  end

end
