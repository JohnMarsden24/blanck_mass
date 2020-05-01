class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :landing, :jonny ]

  def landing
  end

  def jonny
  end

end
