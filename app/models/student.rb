class Student < ApplicationRecord
    validates :name, presence: true
    validates :email, presence: true, uniqueness: true, email: true
    validates :address, presence: true, length: {minimum: 5}
    validates :phone, presence: true, phone: true, length: {is: 10}
end
