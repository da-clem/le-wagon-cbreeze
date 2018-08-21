class SessionPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(user: user)
    end
  end

  def create?
    true
  end

  def destroy?
    true
  end

  def callback?
    true
  end

  def calendars?
    true
  end
end
