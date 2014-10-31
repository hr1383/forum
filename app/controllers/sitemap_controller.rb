class SitemapController < ApplicationController
	layout nil
	respond_to :xml
	def index
		@posts = Post.all
	end
end
