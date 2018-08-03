module ApplicationHelper
  def sort_link(column, title = nil)
    title ||= (@model_class ? @model_class.human_attribute_name(column) : column.titleize)
    direction = column == sort_column && sort_direction == "asc" ? "desc" : "asc"
    icon = sort_direction == "asc" ? "glyphicon glyphicon-sort-by-attributes" : "glyphicon glyphicon-sort-by-attributes-alt"
    icon = column == sort_column ? icon : ""
    link_title = sort_direction == "asc" ? "Sort table in descending order" : "Sort table in ascending order"
    link_to "<span title=\"#{h link_title}\">#{h title} <span class=\"#{icon}\"></span></span>".html_safe, {column: column, direction: direction}
  end
end
