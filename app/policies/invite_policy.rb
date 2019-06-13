class InvitePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def create?
    record.user == user
  end

  def update?
    record.email == user.email
  end

  def destroy?
    true
  end
end
