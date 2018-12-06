class TestViewsController < ApplicationController
    
    layout 'test_views'
    
    def index
    end
    
    def about
        
    end
    
    def contact
    end
    
    def games
    end
    
    def home
        render :layout => 'home'
    end
    
    def news
    end
    
    def single
        gameId = params[:gameId]
        @gameName = Game.find(gameId).name
        @gameDetail = Game.find(gameId).detail
        puts @gameDetail
    end
    
end
