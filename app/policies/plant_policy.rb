class PlantPolicy < ApplicationPolicy
  class Scope < Scope
    def resolve
      user.nil? || !user.admin? ? scope.where(published: true) : scope.all
    end
  end

  def show?
    true
  end

  def create?
    user_is_owner_or_admin?
  end

  def update?
    user_is_owner_or_admin?
  end

  def destroy?
    user_is_owner_or_admin?
  end

  def edit_published?
    user_is_owner_or_admin?
  end

  private

  def user_is_owner_or_admin?
    record.user == user || user.admin
  end
end
