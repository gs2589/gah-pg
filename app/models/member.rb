class Member < Player

has_secure_password
validates :username, uniqueness: true

end