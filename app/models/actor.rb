class Actor < ActiveRecord::Base
  has_many :characters
  has_many :shows, through: :characters

  def full_name
    self.first_name + " " + self.last_name
  end

  def list_roles
    string = nil
    self.characters.count.times do |x|
        string = "#{self.characters.find(x+1).name} - #{self.shows.find(x+1).name}"
    end
    string
  end
end