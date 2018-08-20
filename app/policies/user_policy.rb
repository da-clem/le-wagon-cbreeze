class UserPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def settings?
    true
  end

  def change?
    true
  end
end
