class CartPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      scope.all
    end
  end

  def show?
    true
  end

  def new?
    true
  end

  def create?
    user_is_owner_or_admin?
  end

  def update?
    user_is_owner_or_admin?
  end

  # check if it's needed
  def delete_all?
    true
  end

  private

  def user_is_owner_or_admin?
    record.user == user || user.admin
  end
end
