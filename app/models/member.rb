class Member < Player
require 'bcrypt'
has_secure_password
validates :username, uniqueness: true

end