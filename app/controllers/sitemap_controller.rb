class SitemapController < ApplicationController
	layout nil
	respond_to :xml
	def index
		@host_url = "http://www.umvox.com/posts/"
		@file_type=".html"
		@posts = Post.all
	end
end
