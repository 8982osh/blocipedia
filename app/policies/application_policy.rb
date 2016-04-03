class ApplicationPolicy
  attr_reader :user, :record

  def initialize(user, record)
    @user = user
    @record = record
  end

  def index?
    false
    #@user.admin?
  end

  def show?
    scope.where(id: record.id).exists?
    #@user.admin? || @user == @user
  end

  def create?
    user.present?
  end

  def new?
    create?
  end

  def update?
    #allow record owner or admin
    user.present? #&& (record.user == user || user.admin?)
  end

  def edit?
    update?
  end

  def destroy?
    #limit to owner or admin
    user.present? && user.admin?
    #@user.admin?
  end

  def scope
    record.class
  end

  class Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      scope
    end
  end
end


