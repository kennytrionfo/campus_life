class Assignment < ActiveRecord::Base

  belongs_to :user

  validates :text, presence: true

  def incomplete?
    !complete?
  end

end
