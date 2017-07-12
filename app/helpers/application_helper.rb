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

  # Flag de entrega con factor de verificacion (3= Orden entregada ,2= Orden en reparto ,1= Orden rechazada, 0= Solicitud de orden).

  def order_status(order_status)
    stat_name = ''
    if order_status == 3
      stat_name = 'Orden Entregada'
    elsif order_status == 2
      stat_name = 'Orden en reparto'
    elsif order_status == 1
      stat_name = 'Orden rechazada'
    elsif order_status == 0
      stat_name = 'Solicitud en Orden'
    elsif order_status.nil?
      stat_name = 'No tiene estado'
    end
    stat_name
  end
  
  def payment_methods(paymentmethod_id)
    pay_methods = ''
    if paymentmethod_id == 1
      pay_methods = 'Crédito'
    elsif paymentmethod_id == 2
      pay_methods = 'Débito'
    elsif paymentmethod_id == 3
      pay_methods = 'Efectivo'
    elsif paymentmethod_id == 4
      pay_methods = 'Efectivo y Crédito'
    elsif paymentmethod_id == 5
      pay_methods = 'Débito y Crédito'
    elsif paymentmethod_id == 6
      pay_methods = 'Efectivo y Débito'
    elsif paymentmethod_id == 7
      pay_methods = 'Efectivo, Débito y Crédito'
    else
      pay_methods = 'Desconocido'
    end
    pay_methods
  end

  def price_format(price)
    price = number_to_currency(price, unit: '$', separator: ',', delimiter: '.')
    price
  end
end
