# == Schema Information
#
# Table name: authentications
#
#  id         :integer         not null, primary key
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

class Authentication < ActiveRecord::Base
    attr_accessible :user_id
end
