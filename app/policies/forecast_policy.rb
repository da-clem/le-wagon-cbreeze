class ForecastPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.where(spot: user.spots)
    end
  end
end
