module ApplicationHelper
  def set_active(opt)
    if controller_name == opt
      return 'active'
    end
  end
end
