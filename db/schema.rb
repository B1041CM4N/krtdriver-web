# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 20170705053113) do

  create_table "Address", primary_key: "Address_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", comment: "Información correspondiente a dirección, comprende la entida" do |t|
    t.integer "Commune_id",               comment: "Codigo unico de comunas"
    t.string  "Street_name",   limit: 35, comment: "Calle de direccion"
    t.string  "Street_number", limit: 7,  comment: "Numero de casa de direccion"
    t.string  "Block_number",  limit: 5,  comment: "Block opcional de vivienda"
    t.string  "Town_name",     limit: 20, comment: "Villa o poblacion"
    t.index ["Commune_id"], name: "FK_Address_Comune", using: :btree
  end

  create_table "Bank", primary_key: "Bank_id", id: :integer, comment: "Codigo unico del banco.", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", comment: "Entidad bancaria, información comercial establecida y defini" do |t|
    t.string "Name",        limit: 50,  comment: "Nombre de banco."
    t.string "Description", limit: 500, comment: "Descripcion del banco"
  end

  create_table "BankAccount", primary_key: "Bank_account_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", comment: "Información comercial de la entidad cuenta bancaria la cual " do |t|
    t.integer "Bank_id",                      comment: "Codigo unico del banco."
    t.integer "Ta_id",                        comment: "Codigo unico para el tipo de cuenta"
    t.integer "Account_number",               comment: "Numero de cuenta bancaria"
    t.string  "Bank_account_type", limit: 20, comment: "Tipo de cuenta bancaria"
    t.index ["Bank_id"], name: "FK_Bankaccount_Bank", using: :btree
    t.index ["Ta_id"], name: "FK_taccount_Bankaccount", using: :btree
  end

  create_table "Brand_ct", primary_key: "Btc_id", id: :integer, comment: "Codigo unico para la marca de la tarjeta de credito", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", comment: "Marca de la tarjeta de credito con la cual operan los perfil" do |t|
    t.string "Name", limit: 35, comment: "Nombre de la marca para la tarjeta de credito"
  end

  create_table "Category", primary_key: "Category_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", comment: "Entidad referente a la categorización de los productos ofert" do |t|
    t.string "Name",        limit: 35,  comment: "Nombre de la categoría de los productos."
    t.string "Description", limit: 500, comment: "Descripcion de la categoria de los productos ofertados."
  end

  create_table "Commune", primary_key: "Commune_id", id: :integer, comment: "Codigo unico de comunas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", comment: "Información de localización, comprensión de las entidades co" do |t|
    t.integer "Province_id",            comment: "Codigo de provincia"
    t.string  "Name",        limit: 20, comment: "Nombre de comuna"
    t.index ["Province_id"], name: "FK_Commune_Province", using: :btree
  end

  create_table "CreditCard", primary_key: "Credit_card_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", comment: "Información comercial de los perfiles de consumo, referencia" do |t|
    t.integer "Bank_id",                comment: "Codigo unico del banco."
    t.integer "Btc_id",                 comment: "Codigo unico para la marca de la tarjeta de credito"
    t.integer "Consumer_id",            comment: "Codigo unico de consumidor."
    t.string  "Card_number", limit: 25, comment: "Numero de tarjeta"
    t.index ["Bank_id"], name: "FK_Creditcard_Bank", using: :btree
    t.index ["Btc_id"], name: "FK_bank_brandct", using: :btree
    t.index ["Consumer_id"], name: "FK_Reference_37", using: :btree
  end

  create_table "DebitCard", primary_key: "Debit_card_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", comment: "Información comercial de los perfiles de consumo, referencia" do |t|
    t.integer "Bank_id",                comment: "Codigo unico del banco."
    t.integer "Btc_id",                 comment: "Codigo unico para la marca de la tarjeta de credito"
    t.integer "Consumer_id",            comment: "Codigo unico de consumidor."
    t.string  "Card_number", limit: 25, comment: "Numero de tarjeta"
    t.index ["Bank_id"], name: "FK_DebitCard_Bank", using: :btree
    t.index ["Btc_id"], name: "FK_DebitCard_BrandCT", using: :btree
    t.index ["Consumer_id"], name: "FK_Reference_36", using: :btree
  end

  create_table "Inventory", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", comment: "Referencia a entidad de conteo frente a los productos y por " do |t|
    t.integer "Product_id",  comment: "Codigo unico del producto."
    t.integer "Provider_id", comment: "Codigo unico de distribuidor."
    t.integer "Quantity",    comment: "Cantidad del producto a comercializar."
    t.integer "Price",       comment: "Precio de venta del producto."
    t.index ["Product_id"], name: "FK_Inventory_Product", using: :btree
    t.index ["Provider_id"], name: "FK_Inventory_Provider", using: :btree
  end

  create_table "Location", primary_key: "Tracing_id", id: :string, limit: 10, comment: "Sesión de perfil", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", comment: "Referencia a entidad de seguimiento, en la cual se estructur" do |t|
    t.integer "Store_id",             comment: "Codigo unico de local"
    t.string  "Latitude",  limit: 20, comment: "Latitud de la geolocalizacion"
    t.string  "Longitude", limit: 20, comment: "Longitud de la geolocalizacion"
    t.index ["Store_id"], name: "FK_Reference_40", using: :btree
  end

  create_table "OrderSale", primary_key: "Order_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", comment: "Instancia de generación de venta, referencia a entidad gener" do |t|
    t.integer  "Total",                         comment: "Monto total del pedido."
    t.datetime "Date",                          comment: "Fecha de pedido."
    t.integer  "Provider_id",                   comment: "Codigo unico de distribuidor."
    t.integer  "Consumer_id",      null: false, comment: "Codigo unico de consumidor foraneo"
    t.integer  "PaymentMethod_id",              comment: "Codigo unico para la relacion de metodos de pago para ejecucion de logicas del negocio."
    t.integer  "Order_status",                  comment: "Flag de entrega con factor de verificacion (3= Orden entregada ,2= Orden en reparto ,1= Orden rechazada, 0= Solicitud de orden)."
    t.integer  "Ticket_number",                 comment: "Numero de boleta extendida."
    t.index ["Consumer_id"], name: "FK_Consumer_order", using: :btree
    t.index ["PaymentMethod_id"], name: "FK_OrderSale_PaymentMEthod", using: :btree
    t.index ["Provider_id"], name: "fk_Pedido_Distribuidor1", using: :btree
  end

  create_table "PaymentMethod", primary_key: "PaymentMethod_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", comment: "Metodos de pago para que acepta el perfilado de distribución" do |t|
    t.integer "MCash",   comment: "Metodo de pago en efectivo (1= metodo de pago activado, 0= metodo de pago desactivo)."
    t.integer "MDebit",  comment: "Metodo de pago en debito (1= metodo de pago activado, 0= metodo de pago desactivo)."
    t.integer "MCredit", comment: "Metodo de pago en Credito (1= metodo de pago activado, 0= metodo de pago desactivo)."
  end

  create_table "Product", primary_key: "Product_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", comment: "Tabla de entidad producto, referente a la instancia de objet" do |t|
    t.integer "Category_id",             comment: "Codigo unico de la categoría de los productos."
    t.string  "Name",        limit: 30,  comment: "Nombre del producto."
    t.string  "Description", limit: 500, comment: "Descripción del producto."
    t.string  "Image",       limit: 100, comment: "Imagen del producto definido."
    t.index ["Category_id"], name: "FK_Product_Category", using: :btree
  end

  create_table "ProductQuantifier", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", comment: "Contador relacional m a m de las entidades de pedido y produ" do |t|
    t.integer "order_id", comment: "Codigo unico del pedido."
    t.integer "IdProd",   comment: "Codigo unico del producto."
    t.integer "Quantity", comment: "Cantidad del produto determinado"
    t.index ["IdProd"], name: "FK_Proped_Product", using: :btree
    t.index ["order_id"], name: "FK_Prodped_Order", using: :btree
  end

  create_table "Provider", primary_key: "Provider_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", comment: "Perfil proveedor o distribuidor, entidad relacionada a los a" do |t|
    t.integer "Vehicle_id",                  comment: "codigo unico de vehiculo"
    t.integer "Store_id",                    comment: "Codigo unico de local"
    t.integer "Address_id",                  comment: "Codigo unico de direccion"
    t.integer "PaymentMethod_id",            comment: "Codigo unico para la relacion de metodos de pago para ejecucion de logicas del negocio."
    t.integer "Bank_account_id",             comment: "Codigo unico de cuenta bancaria"
    t.string  "Rut",              limit: 10, comment: "Rut del distribuidor."
    t.string  "EMail",            limit: 40, comment: "Correo electrónico de distribuidor."
    t.string  "Password",         limit: 50, comment: "Password de acceso log in para perfil distribuidor."
    t.string  "First_name",       limit: 30, comment: "Nombre del distribuidor."
    t.string  "Last_name",        limit: 30, comment: "Apellido del distribuidor."
    t.index ["Address_id"], name: "FK_Provider_address", using: :btree
    t.index ["Bank_account_id"], name: "FK_BankAccount_Provider", using: :btree
    t.index ["PaymentMethod_id"], name: "FK_PaymentMethod_Provider", using: :btree
    t.index ["Store_id"], name: "FK_Provider_Store", using: :btree
    t.index ["Vehicle_id"], name: "FK_Vehicle_Provider", using: :btree
  end

  create_table "Province", primary_key: "Province_id", id: :integer, comment: "Codigo de provincia", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", comment: "Información de localización, referencia a la entidad de las " do |t|
    t.string "Name", limit: 23, comment: "Nombre de provincia"
  end

  create_table "Punishment", primary_key: "Punishment_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", comment: "Información de consecuencia de incumplimiento de normativas " do |t|
    t.string  "Reason",           limit: 100, comment: "Motivo de penalizacion"
    t.integer "Duration",                     comment: "Inactividad en horas"
    t.integer "Denegate_service",             comment: "Denegación de servicio o baneo de la plataforma."
    t.integer "Count",                        comment: "Contador de incidencias de perfiles"
  end

  create_table "Request", primary_key: "Request_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", comment: "Entidad de peticion o contacto con los gestionadores de KRT " do |t|
    t.integer "Rc_id",                     comment: "Codigo unico de categoria de peticion o contacto"
    t.integer "Consumer_id",               comment: "Codigo unico de consumidor."
    t.integer "Provider_id",               comment: "Codigo unico de distribuidor."
    t.string  "Message",      limit: 1000, comment: "Mensaje de la petición o contacto."
    t.string  "Name",         limit: 60,   comment: "Nombre de la persona que genera el contacto como NN."
    t.string  "Email",        limit: 20,   comment: "Dirección de correo electronico de la persona que genera el contacto como NN."
    t.string  "Phone_number", limit: 15,   comment: "Número telefonico de la persona que genera el contacto como NN."
    t.index ["Consumer_id"], name: "FK_Request_Consumer", using: :btree
    t.index ["Provider_id"], name: "FK_Request_Provider", using: :btree
    t.index ["Rc_id"], name: "FK_Request_Request_category", using: :btree
  end

  create_table "Request_category", primary_key: "Rc_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", comment: "Categoría de contacto, Entidad independiente de la clasifica" do |t|
    t.string "Name",        limit: 30,  comment: "Nombre de categoría de solicitud"
    t.string "Description", limit: 500, comment: "Descripción de la categoría a definir."
  end

  create_table "SaleHistorical", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", comment: "Entidad de acumulación de ventas por proveedor." do |t|
    t.integer  "Provider_id", comment: "Codigo unico de distribuidor."
    t.integer  "Amount",      comment: "Monto de registro"
    t.datetime "Date",        comment: "Fecha de registro"
    t.integer  "Segment_id",  comment: "Código único de segmento comercial."
    t.index ["Provider_id"], name: "FK_Reference_38", using: :btree
    t.index ["Segment_id"], name: "FK_Reference_39", using: :btree
  end

  create_table "Score", primary_key: "Score_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", comment: "Entidad encargada de la información de comportamiento de los" do |t|
    t.integer "Punishment_id",            comment: "Codigo unico de penalizacion"
    t.integer "Consumer_id",              comment: "Codigo unico de consumidor."
    t.integer "Provider_id",              comment: "Codigo unico de distribuidor."
    t.integer "Puntuation",               comment: "Puntuacion"
    t.string  "Comment",       limit: 70, comment: "Comentario"
    t.string  "Suggest",       limit: 70, comment: "Recomendacion"
    t.string  "Claim",         limit: 70, comment: "Reclamo"
    t.index ["Consumer_id"], name: "FK_Score_Consumer", using: :btree
    t.index ["Provider_id"], name: "FK_Score_Provider", using: :btree
    t.index ["Punishment_id"], name: "FK_Score_Punishment", using: :btree
  end

  create_table "Segment", primary_key: "Segment_id", id: :integer, comment: "Codigo de segmento comercial", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", comment: "Entidad por concepto de segmento comercial referente a la en" do |t|
    t.integer "Amount",                            comment: "Monto del segmento"
    t.decimal "Comission", precision: 4, scale: 2, comment: "Comision del segmento"
  end

  create_table "Store", primary_key: "Store_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", comment: "Información referente a la entidad Comercio o establecimient" do |t|
    t.integer "Address_id",              comment: "Codigo unico de direccion"
    t.string  "Name",        limit: 35,  comment: "Nombre de local"
    t.string  "Description", limit: 200, comment: "Descripcion de local"
    t.integer "users_id"
    t.index ["Address_id"], name: "FK_Store_Adress", using: :btree
    t.index ["users_id"], name: "index_Store_on_users_id", using: :btree
  end

  create_table "Tracing", primary_key: "Sesion", id: :string, limit: 10, comment: "Sesión de perfil", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", comment: "Referencia a entidad de seguimiento, en la cual se estructur" do |t|
    t.integer "Consumer_id",            comment: "Codigo unico de consumidor."
    t.integer "Provider_id",            comment: "Codigo unico de distribuidor."
    t.string  "Latitude",    limit: 20, comment: "Latitud de la geolocalizacion"
    t.string  "Longitude",   limit: 20, comment: "Longitud de la geolocalizacion"
    t.integer "Flag_Purge",             comment: "Flag de purga"
    t.index ["Consumer_id"], name: "FK_Tracing_Consumer", using: :btree
    t.index ["Provider_id"], name: "FK_Tracing_Provider", using: :btree
  end

  create_table "Type_account", primary_key: "Ta_id", id: :integer, comment: "Codigo unico para el tipo de cuenta", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", comment: "Tipo de cuenta para uso del perfilado de distribucion, infor" do |t|
    t.string "Name", limit: 35, comment: "Nombre del tipo de cuenta"
  end

  create_table "Vehicle", primary_key: "Vehicle_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", comment: "Información referente a la marca, todo distribuidor debe reg" do |t|
    t.integer "Vehicle_brand_id",            comment: "Codigo unico de marca de vehiculo"
    t.string  "Model_name",       limit: 15, comment: "Modelo del vehiculo"
    t.string  "Licence_plate",    limit: 6,  comment: "Matricula o patente del vehiculo"
    t.string  "Color",            limit: 20, comment: "Color del vehiculo"
    t.index ["Vehicle_brand_id"], name: "FK_Vehiclebrand_Vehicle", using: :btree
  end

  create_table "VehicleBrand", primary_key: "Vehicle_brand_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", comment: "Información referente a la marca, todo distribuidor debe reg" do |t|
    t.string "Name", limit: 15, comment: "Nombre de marca de vehiculo"
  end

  create_table "consumer", primary_key: "Consumer_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", comment: "Perfil consumidor ejecutor de las compras, entidad relaciona" do |t|
    t.integer "Address_id",                comment: "Codigo unico de direccion"
    t.string  "Rut",            limit: 10, comment: "Rut del consumidor."
    t.string  "Email",          limit: 40, comment: "Direccion del correo electronico del consumidor."
    t.string  "Password",       limit: 50, comment: "clave unica de acceso log in para ingreso a KRT Driver"
    t.string  "Facebook_Token",            comment: "Token de facebook para acceso a KRT Driver."
    t.string  "Google_Token",              comment: "Token de google para acceso a KRT Driver."
    t.string  "First_name",     limit: 30, comment: "Nombre de consumidor."
    t.string  "Last_name",      limit: 30, comment: "Apellido de consumidor."
    t.index ["Address_id"], name: "FK_Consumer_Address", using: :btree
  end

  create_table "users", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
    t.string   "email",                  default: "",   null: false
    t.string   "encrypted_password",     default: "",   null: false
    t.string   "reset_password_token"
    t.datetime "reset_password_sent_at"
    t.datetime "remember_created_at"
    t.integer  "sign_in_count",          default: 0,    null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.string   "current_sign_in_ip"
    t.string   "last_sign_in_ip"
    t.datetime "created_at",                            null: false
    t.datetime "updated_at",                            null: false
    t.boolean  "status",                 default: true
    t.integer  "role"
    t.index ["email"], name: "index_users_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_users_on_reset_password_token", unique: true, using: :btree
  end

  add_foreign_key "Address", "Commune", primary_key: "Commune_id", name: "FK_Address_Comune"
  add_foreign_key "BankAccount", "Bank", primary_key: "Bank_id", name: "FK_Bankaccount_Bank"
  add_foreign_key "BankAccount", "Type_account", column: "Ta_id", primary_key: "Ta_id", name: "FK_taccount_Bankaccount"
  add_foreign_key "Commune", "Province", primary_key: "Province_id", name: "FK_Commune_Province"
  add_foreign_key "CreditCard", "Bank", primary_key: "Bank_id", name: "FK_Creditcard_Bank"
  add_foreign_key "CreditCard", "Brand_ct", column: "Btc_id", primary_key: "Btc_id", name: "FK_bank_brandct"
  add_foreign_key "CreditCard", "consumer", column: "Consumer_id", primary_key: "Consumer_id", name: "FK_Reference_37"
  add_foreign_key "DebitCard", "Bank", primary_key: "Bank_id", name: "FK_DebitCard_Bank"
  add_foreign_key "DebitCard", "Brand_ct", column: "Btc_id", primary_key: "Btc_id", name: "FK_DebitCard_BrandCT"
  add_foreign_key "DebitCard", "consumer", column: "Consumer_id", primary_key: "Consumer_id", name: "FK_Reference_36"
  add_foreign_key "Inventory", "Product", primary_key: "Product_id", name: "FK_Inventory_Product"
  add_foreign_key "Inventory", "Provider", primary_key: "Provider_id", name: "FK_Inventory_Provider"
  add_foreign_key "Location", "Store", primary_key: "Store_id", name: "FK_Reference_40"
  add_foreign_key "OrderSale", "PaymentMethod", primary_key: "PaymentMethod_id", name: "FK_OrderSale_PaymentMEthod"
  add_foreign_key "OrderSale", "Provider", primary_key: "Provider_id", name: "fk_Pedido_Distribuidor1"
  add_foreign_key "OrderSale", "consumer", column: "Consumer_id", primary_key: "Consumer_id", name: "FK_Consumer_order"
  add_foreign_key "Product", "Category", primary_key: "Category_id", name: "FK_Product_Category"
  add_foreign_key "ProductQuantifier", "OrderSale", column: "order_id", primary_key: "Order_id", name: "FK_Prodped_Order"
  add_foreign_key "ProductQuantifier", "Product", column: "IdProd", primary_key: "Product_id", name: "FK_Proped_Product"
  add_foreign_key "Provider", "Address", primary_key: "Address_id", name: "FK_Provider_address"
  add_foreign_key "Provider", "BankAccount", column: "Bank_account_id", primary_key: "Bank_account_id", name: "FK_BankAccount_Provider"
  add_foreign_key "Provider", "PaymentMethod", primary_key: "PaymentMethod_id", name: "FK_PaymentMethod_Provider"
  add_foreign_key "Provider", "Store", primary_key: "Store_id", name: "FK_Provider_Store"
  add_foreign_key "Provider", "Vehicle", primary_key: "Vehicle_id", name: "FK_Vehicle_Provider"
  add_foreign_key "Request", "Provider", primary_key: "Provider_id", name: "FK_Request_Provider"
  add_foreign_key "Request", "Request_category", column: "Rc_id", primary_key: "Rc_id", name: "FK_Request_Request_category"
  add_foreign_key "Request", "consumer", column: "Consumer_id", primary_key: "Consumer_id", name: "FK_Request_Consumer"
  add_foreign_key "SaleHistorical", "Provider", primary_key: "Provider_id", name: "FK_Reference_38"
  add_foreign_key "SaleHistorical", "Segment", primary_key: "Segment_id", name: "FK_Reference_39"
  add_foreign_key "Score", "Provider", primary_key: "Provider_id", name: "FK_Score_Provider"
  add_foreign_key "Score", "Punishment", primary_key: "Punishment_id", name: "FK_Score_Punishment"
  add_foreign_key "Score", "consumer", column: "Consumer_id", primary_key: "Consumer_id", name: "FK_Score_Consumer"
  add_foreign_key "Store", "Address", primary_key: "Address_id", name: "FK_Store_Adress"
  add_foreign_key "Store", "users", column: "users_id"
  add_foreign_key "Tracing", "Provider", primary_key: "Provider_id", name: "FK_Tracing_Provider"
  add_foreign_key "Tracing", "consumer", column: "Consumer_id", primary_key: "Consumer_id", name: "FK_Tracing_Consumer"
  add_foreign_key "Vehicle", "VehicleBrand", column: "Vehicle_brand_id", primary_key: "Vehicle_brand_id", name: "FK_Vehiclebrand_Vehicle"
  add_foreign_key "consumer", "Address", primary_key: "Address_id", name: "FK_Consumer_Address"
end
