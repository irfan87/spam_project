class Post < ActiveRecord::Base
	resourcify
	belongs_to	:user # need to look into User#admin function
	has_many	:comments
	has_many	:categories, through: :post_categories
	has_many	:post_categories

	accepts_nested_attributes_for :categories
	
	searchkick text_start: [:title], suggest: [:title]

	def search_data
		{
			title: title,
			body: body
		}
	end
end
