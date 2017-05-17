class WikiPolicy < ApplicationPolicy

  class Scope < Scope
    attr_reader :user, :scope

    def initialize(user, scope)
      @user = user
      @scope = scope
    end

    def resolve
      wikis = []
      if user.admin?
          wikis = scope.all
      elsif user.premium?
          all_wikis = scope.all
          all_wikis.each do |wiki|
            if wiki.public? || wiki.user == user || wiki.users.include?(user)
              wikis << wiki
          end
        end
      else
        #this is for the standard user
        all_wikis = scope.all
        wikis = []
        all_wikis.each do |wiki|
          if wiki.public? || wiki.users.include?(user)
            wikis << wiki
        end
      end
    end
    wikis
  end
 end
end
