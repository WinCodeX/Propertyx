class DashboardController < ApplicationController
  before_action :set_sidebar, except: [:show]

  def index
  end

  def properties
  end

  def reports
  end

  private
  def set_sidebar
    @show_sidebar = true
  end
end
