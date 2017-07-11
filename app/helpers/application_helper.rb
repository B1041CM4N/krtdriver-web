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
    elsif opt == 'owner'
      return 'Tienda'
    else
      return 'Hacker'
    end
  end

  def price_format(price)
    price = number_to_currency(price, unit: '$', separator: ',', delimiter: '.')
    price
  end
end
