module UsersHelper

  def grow(trees)
    trees.map do |key, value|
          case key
          when :comment
            render(partial: "/users/comment.html.erb", locals: {comment: value})
          else
            if value
              content_tag(:div, plant_trees_for(value), class: "replies")
            end
          end
        end
  end

def plant_trees_for(comments)
  comments.map do |comment|
    grow(comment)
  end.join.html_safe
end

end #mod end
