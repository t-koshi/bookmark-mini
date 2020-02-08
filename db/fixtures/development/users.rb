require 'bcrypt'

User.seed(:id,
  { id: 1, email: "test@example.com", password: 'password', name: "test", confirmed_at: Time.zone.now },
  { id: 2, email: "test2@example.com", password: 'password', name: "test2", confirmed_at: Time.zone.now }
)
