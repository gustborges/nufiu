class PaymentPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def new?
    true
  end

  private

  def user_is_owner_or_admin?
    record.user == user || user.admin
  end
end
