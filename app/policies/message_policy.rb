class MessagePolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(event: user.event)
    end
  end

  def index?
    true
  end
end
