class CartPlantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def create?
    true
  end

  def update?
    true
  end

  def destroy?
    true?
  end

  def delete_all?
    true
  end

  private

  def user_is_owner_or_admin?
    (record.cart.user == user) || user.admin
  end
end
