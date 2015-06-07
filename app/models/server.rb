class Server < ActiveRecord::Base
  validates  :ip, presence: true
end
