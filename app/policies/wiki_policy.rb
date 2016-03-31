class WikiPolicy < ApplicationPolicy
  #allow wikis to be viewed by anyone
  def index?
  	true
  end

  def show?
  	record.public? || user.present?
  end
end