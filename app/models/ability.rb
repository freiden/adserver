class Ability
  include CanCan::Ability

  def initialize(user)
    if user.administrator?
      can :manage, :all
    else
      can :manage, Advertiser, user_id: user.id
      can :manage, Campaign, advertiser: { user_id: user.id }
      can %i(edit update), User, id: user.id
    end
  end
end
