module UsersHelper

  def grow_tree_for(comments)
    comments.each do |key, value|
          case key
          when :parent
            render(partial: "/users/comment.html.erb", locals: {comment: value})
          else
            if value
              content_tag(:div, grow_tree_for(value), class: "replies")
            end
          end
        end
  end

end
