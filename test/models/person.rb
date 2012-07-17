class Person < ActiveRecord::Base
    has_many :places
    has_many :things
end