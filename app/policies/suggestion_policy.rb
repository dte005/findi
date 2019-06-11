class SuggestionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    record.event.user == user
  end

  def destroy?
    record.event.user == user
  end

  def update?
    record.event.user == user
  end
end
