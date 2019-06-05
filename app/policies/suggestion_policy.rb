class SuggestionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def destroy?
    record.event.user == user
  end
end
