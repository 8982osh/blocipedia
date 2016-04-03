class WikiPolicy < ApplicationPolicy
  #allow wikis to be viewed by anyone
  def index?
  	true
  end

  def show?
  	record.public? || user.present?
    #record.private != true || (user.present? && ((user.role == 'admin') || record.user == user || record.users.include?(user)))    
  end

  def update?
  	show?
  end

  def edit?
  	show?
  end


#restrict private wikis visiblility to admins, wiki creater, wiki collaborators
   class Scope
     attr_reader :user, :scope
 
     def initialize(user, scope)
       @user = user
       @scope = scope
     end
 
     def resolve
       wikis = []
       if user.role == 'admin'
         wikis = scope.all # if the user is an admin, show them all the wikis
       elsif user.role == 'premium'
         all_wikis = scope.all
         all_wikis.each do |wiki|
           if wiki.public? || wiki.user == user || wiki.users.include?(user)
             wikis << wiki # if the user is premium, only show them public wikis, or that private wikis they created, or private wikis they are a collaborator on
           end
         end
       else # this is the lowly standard user
         all_wikis = scope.all
         wikis = []
         all_wikis.each do |wiki|
           if wiki.public? || wiki.users.include?(user)
             wikis << wiki # only show standard users public wikis and private wikis they are a collaborator on
           end
         end
       end
       wikis # return the wikis array we've built up
     end
   end
 end