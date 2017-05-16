module WikisHelper
  def is_collab?(id, collaborators)
    collaborators.find { |user| user[:id] == id}
  end

end
