class EventPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.owned_events + user.events
    end
  end

  def index?
    record.user == user
  end

  def show?
    # Usuario tem que ser dono ou a lista de eventos do convidado tem que possuir o evento record
    record.user == user || user.events.include?(record)
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
