class SyndicationsController < ApplicationController
    
    def show
        @syndicate = Syndication.where(name: params[:name] + ".txt").order("created_at DESC").first
        if @syndicate.present?
            send_data @syndicate.body,
            type: 'text/plain',
            filename: @syndicate.name, 
            disposition: 'attachment'
        end
    end
    
    private
    
    def syndicate_params
        params.require(:syndicate).permit(:name, :body)
    end
end
