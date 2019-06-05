class EventPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user) # cada usuario ira ver seus eventos
    end
  end

  def index?
    record.user == user
  end

  def show?
    record.user == user
  end

  def create?
    user.present?
  end

  def update?
    record.user == user
  end

  def destroy?
    record.user == user
  end
end
