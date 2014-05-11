class LocationsController < ApplicationController

  
  def browse
    voxes = Location.find_all_by_category(params[:category])
    @totalopen = []
    @totalclose = []
      @testimonials = Post.testimonials
     voxes.each do | vox |
        splitVoxes(vox,@totalopen,@totalclose)
      end
      @isSearch = true
    render "/welcome/index"
  end
  
  private 
    
  def splitVoxes(vox, openList,closedList)
    post = vox.post
      if post.status == 'Open'
        openList << post
      else
        closedList << post
      end
  end
  
end
