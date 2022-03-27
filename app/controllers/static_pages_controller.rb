class StaticPagesController < ApplicationController
  skip_before_action :require_login, only: [:privacy, :terms]
  def privacy; end

  def terms; end
end
