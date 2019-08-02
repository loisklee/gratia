class Entry < ActiveRecord::Base
    belongs_to :user

    require_relative './concerns/time_conversion.rb'
	include TimeConversion::InstanceMethods
end
