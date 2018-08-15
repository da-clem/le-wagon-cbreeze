module ApplicationHelper
  def nav_classes(path)
    classes = [
      'navbar-wagon-item',
      'navbar-wagon-link'
    ]

    classes << 'active' if current_page?(path)

    classes.join(' ')
  end

  def nav_link(text, path)
    link_to text, path, class: nav_classes(path)
  end
end
