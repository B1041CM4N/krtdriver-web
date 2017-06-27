module ApplicationHelper
  def set_active(opt)
    if controller_name == opt
      return 'active'
    end
  end

  def get_role_name(opt)
    if opt == 'admin'
      return 'Administrador'
    elsif opt == 'provider'
      return 'Proveedor'
    else
      return 'Cliente'
    end
  end
end
