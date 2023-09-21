class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user

    if user.profile == 'Stakeholder'
      can :read, ActiveAdmin::Page, name: 'Dashboard', namespace_name: 'admin'
      can :manage, In
      can :manage, Requisition
      can :read, Group
      can :read, Stock
    elsif user.profile == 'Manager'
      can :read, ActiveAdmin::Page, name: 'Dashboard', namespace_name: 'admin'
      can :manage, In
      can :manage, Requisition
      can :manage, Stock
      can :manage, Group
    elsif user.profile == 'Administrator'
      can :read, ActiveAdmin::Page, name: 'Dashboard', namespace_name: 'admin'
      can :manage, User
      can :read, Group
      can :read, Stock
      can :read, In
      can :read, Requisition
    end
  end
end
