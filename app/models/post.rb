class Post < ActiveRecord::Base
	belongs_to	:user # need to look into User#admin function
	has_many	:comments

	searchkick text_start: [:title], suggest: [:title]

	def search_data
		{
			title: title,
			body: body
		}
	end
end
