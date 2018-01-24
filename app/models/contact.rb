class Contact < ApplicationRecord
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :email, uniqueness: true

  def full_name
   "#{first_name}#{last_name}".titleize

  end

  

  def as_json
      {
       id: id,
       full_name: full_name,
       middle_name: middle_name,
       first_name: first_name,
       last_name: last_name,
       email: email,
       phone_number: phone_number,
       updated_at: friendly_updated_at,
       bio: bio
      }  
  end

  def friendly_updated_at
   updated_at.strftime("%b %d, %Y")
  end

  
end
