class Ability
  include CanCan::Ability

  def initialize(user)
    if !user.nil? && user.role == 'admin'
      can :manage, :all
    end

    if !user.nil? && user.role == 'user'
      can :read, Article
    end

    if user.nil? || user.role.nil?
      can :read, Article
    end

  end
end
