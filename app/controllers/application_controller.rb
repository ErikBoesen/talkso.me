class ApplicationController < ActionController::Base
    protect_from_forgery with: :exception

    def home
        render html: 'I solemnly swear there will be useful things here later on.'
    end

end