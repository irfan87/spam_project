class Post < ActiveRecord::Base

	belongs_to	:user # need to look into User#admin function
	has_many	:comments
end
