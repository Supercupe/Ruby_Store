class AdminController < ApplicationController
    before_action :authenticate_admin!
    def show_admin
    end
end