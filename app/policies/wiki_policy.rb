class WikiPolicy < ApplicationPolicy
  #allow wikis to be viewed by anyone
  def index?
  end
end