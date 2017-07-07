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

ActiveRecord::Schema.define(version: 20170705235028) do

  create_table "address", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", comment: "Información correspondiente a dirección, comprende la entida" do |t|
    t.integer "commune_id",               comment: "Codigo unico de comunas"
    t.string  "street_name",   limit: 35, comment: "Calle de direccion"
    t.string  "street_number", limit: 7,  comment: "Numero de casa de direccion"
    t.string  "block_number",  limit: 5,  comment: "Block opcional de vivienda"
    t.string  "town_name",     limit: 20, comment: "Villa o poblacion"
    t.index ["commune_id"], name: "FK_Address_Comune", using: :btree
  end

  create_table "bank", id: :integer, comment: "Codigo unico del banco.", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", comment: "Entidad bancaria, información comercial establecida y defini" do |t|
    t.string "name",        limit: 50,  comment: "Nombre de banco."
    t.string "description", limit: 500, comment: "Descripcion del banco"
  end

  create_table "bank_account", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", comment: "Información comercial de la entidad cuenta bancaria la cual " do |t|
    t.integer "bank_id",                      comment: "Codigo unico del banco."
    t.integer "type_account_id",              comment: "Codigo unico para el tipo de cuenta"
    t.integer "account_number",               comment: "Numero de cuenta bancaria"
    t.string  "bank_account_type", limit: 20, comment: "Tipo de cuenta bancaria"
    t.index ["bank_id"], name: "FK_Bankaccount_Bank", using: :btree
    t.index ["type_account_id"], name: "FK_taccount_Bankaccount", using: :btree
  end

  create_table "category", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", comment: "Entidad referente a la categorización de los productos ofert" do |t|
    t.string "name",        limit: 35,  comment: "Nombre de la categoría de los productos."
    t.string "description", limit: 500, comment: "Descripcion de la categoria de los productos ofertados."
  end

  create_table "commune", id: :integer, comment: "Codigo unico de comunas", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", comment: "Información de localización, comprensión de las entidades co" do |t|
    t.integer "province_id",            comment: "Codigo de provincia"
    t.string  "name",        limit: 20, comment: "Nombre de comuna"
    t.index ["province_id"], name: "FK_Commune_Province", using: :btree
  end

  create_table "consumer", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", comment: "Perfil consumidor ejecutor de las compras, entidad relaciona" do |t|
    t.integer "address_id",                comment: "Codigo unico de direccion"
    t.string  "rut",            limit: 10, comment: "Rut del consumidor."
    t.string  "email",          limit: 40, comment: "Direccion del correo electronico del consumidor."
    t.string  "password",       limit: 50, comment: "clave unica de acceso log in para ingreso a KRT Driver"
    t.string  "facebook_Token",            comment: "Token de facebook para acceso a KRT Driver."
    t.string  "google_Token",              comment: "Token de google para acceso a KRT Driver."
    t.string  "first_name",     limit: 30, comment: "Nombre de consumidor."
    t.string  "last_name",      limit: 30, comment: "Apellido de consumidor."
    t.index ["address_id"], name: "FK_Consumer_Address", using: :btree
  end

  create_table "credit_card", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", comment: "Información comercial de los perfiles de consumo, referencia" do |t|
    t.integer "bank_id",                         comment: "Codigo unico del banco."
    t.integer "credit_card_brand_id",            comment: "Codigo unico para la marca de la tarjeta de credito"
    t.integer "consumer_id",                     comment: "Codigo unico de consumidor."
    t.string  "card_number",          limit: 25, comment: "Numero de tarjeta"
    t.index ["bank_id"], name: "FK_Creditcard_Bank", using: :btree
    t.index ["consumer_id"], name: "FK_Reference_37", using: :btree
    t.index ["credit_card_brand_id"], name: "FK_bank_brandct", using: :btree
  end

  create_table "credit_card_brand", id: :integer, comment: "Codigo unico para la marca de la tarjeta de credito", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", comment: "Marca de la tarjeta de credito con la cual operan los perfil" do |t|
    t.string "name", limit: 35, comment: "Nombre de la marca para la tarjeta de credito"
  end

  create_table "debit_card", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", comment: "Información comercial de los perfiles de consumo, referencia" do |t|
    t.integer "bank_id",                         comment: "Codigo unico del banco."
    t.integer "credit_card_brand_id",            comment: "Codigo unico para la marca de la tarjeta de credito"
    t.integer "consumer_id",                     comment: "Codigo unico de consumidor."
    t.string  "card_number",          limit: 25, comment: "Numero de tarjeta"
    t.index ["bank_id"], name: "FK_DebitCard_Bank", using: :btree
    t.index ["consumer_id"], name: "FK_Reference_36", using: :btree
    t.index ["credit_card_brand_id"], name: "FK_DebitCard_BrandCT", using: :btree
  end

  create_table "inventory", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", comment: "Referencia a entidad de conteo frente a los productos y por " do |t|
    t.integer "product_id",  comment: "Codigo unico del producto."
    t.integer "provider_id", comment: "Codigo unico de distribuidor."
    t.integer "quantity",    comment: "Cantidad del producto a comercializar."
    t.integer "price",       comment: "Precio de venta del producto."
    t.index ["product_id"], name: "FK_Inventory_Product", using: :btree
    t.index ["provider_id"], name: "FK_Inventory_Provider", using: :btree
  end

  create_table "location", id: :string, limit: 10, comment: "Sesión de perfil", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", comment: "Referencia a entidad de seguimiento, en la cual se estructur" do |t|
    t.integer "store_id",             comment: "Codigo unico de local"
    t.string  "latitude",  limit: 20, comment: "Latitud de la geolocalizacion"
    t.string  "longitude", limit: 20, comment: "Longitud de la geolocalizacion"
    t.index ["store_id"], name: "FK_Reference_40", using: :btree
  end

  create_table "order_sale", primary_key: "order_id", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", comment: "Instancia de generación de venta, referencia a entidad gener" do |t|
    t.integer  "total",                          comment: "Monto total del pedido."
    t.datetime "date",                           comment: "Fecha de pedido."
    t.integer  "provider_id",                    comment: "Codigo unico de distribuidor."
    t.integer  "consumer_id",       null: false, comment: "Codigo unico de consumidor foraneo"
    t.integer  "payment_method_id",              comment: "Codigo unico para la relacion de metodos de pago para ejecucion de logicas del negocio."
    t.integer  "order_status",                   comment: "Flag de entrega con factor de verificacion (3= Orden entregada ,2= Orden en reparto ,1= Orden rechazada, 0= Solicitud de orden)."
    t.integer  "ticket_number",                  comment: "Numero de boleta extendida."
    t.index ["consumer_id"], name: "FK_Consumer_order", using: :btree
    t.index ["payment_method_id"], name: "FK_OrderSale_PaymentMEthod", using: :btree
    t.index ["provider_id"], name: "fk_Pedido_Distribuidor1", using: :btree
  end

  create_table "payment_method", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", comment: "Metodos de pago para que acepta el perfilado de distribución" do |t|
    t.integer "cash",   comment: "Metodo de pago en efectivo (1= metodo de pago activado, 0= metodo de pago desactivo)."
    t.integer "debit",  comment: "Metodo de pago en debito (1= metodo de pago activado, 0= metodo de pago desactivo)."
    t.integer "credit", comment: "Metodo de pago en Credito (1= metodo de pago activado, 0= metodo de pago desactivo)."
  end

  create_table "product", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", comment: "Tabla de entidad producto, referente a la instancia de objet" do |t|
    t.integer "category_id",                comment: "Codigo unico de la categoría de los productos."
    t.string  "name",           limit: 30,  comment: "Nombre del producto."
    t.string  "description",    limit: 500, comment: "Descripción del producto."
    t.string  "image",          limit: 100, comment: "Imagen del producto definido."
    t.string  "file_in_server",             comment: "Nombre del archivo de imágen en servidor"
    t.integer "store_id"
    t.index ["category_id"], name: "FK_Product_Category", using: :btree
  end

  create_table "product_quantifier", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", comment: "Contador relacional m a m de las entidades de pedido y produ" do |t|
    t.integer "order_id",   comment: "Codigo unico del pedido."
    t.integer "product_id", comment: "Codigo unico del producto."
    t.integer "quantity",   comment: "Cantidad del produto determinado"
    t.index ["order_id"], name: "FK_Prodped_Order", using: :btree
    t.index ["product_id"], name: "FK_Proped_Product", using: :btree
  end

  create_table "provider", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", comment: "Perfil proveedor o distribuidor, entidad relacionada a los a" do |t|
    t.integer "vehicle_id",                   comment: "codigo unico de vehiculo"
    t.integer "store_id",                     comment: "Codigo unico de local"
    t.integer "address_id",                   comment: "Codigo unico de direccion"
    t.integer "payment_method_id",            comment: "Codigo unico para la relacion de metodos de pago para ejecucion de logicas del negocio."
    t.integer "bank_account_id",              comment: "Codigo unico de cuenta bancaria"
    t.string  "rut",               limit: 10, comment: "Rut del distribuidor."
    t.string  "email",             limit: 40, comment: "Correo electrónico de distribuidor."
    t.string  "password",          limit: 50, comment: "Password de acceso log in para perfil distribuidor."
    t.string  "first_name",        limit: 30, comment: "Nombre del distribuidor."
    t.string  "last_name",         limit: 30, comment: "Apellido del distribuidor."
    t.index ["address_id"], name: "FK_Provider_address", using: :btree
    t.index ["bank_account_id"], name: "FK_BankAccount_Provider", using: :btree
    t.index ["payment_method_id"], name: "FK_PaymentMethod_Provider", using: :btree
    t.index ["store_id"], name: "FK_Provider_Store", using: :btree
    t.index ["vehicle_id"], name: "FK_Vehicle_Provider", using: :btree
  end

  create_table "province", id: :integer, comment: "Codigo de provincia", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", comment: "Información de localización, referencia a la entidad de las " do |t|
    t.string "name", limit: 23, comment: "Nombre de provincia"
  end

  create_table "punishment", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", comment: "Información de consecuencia de incumplimiento de normativas " do |t|
    t.string  "reason",           limit: 100, comment: "Motivo de penalizacion"
    t.integer "duration",                     comment: "Inactividad en horas"
    t.integer "denegate_service",             comment: "Denegación de servicio o baneo de la plataforma."
    t.integer "count",                        comment: "Contador de incidencias de perfiles"
  end

  create_table "request", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", comment: "Entidad de peticion o contacto con los gestionadores de KRT " do |t|
    t.integer "request_category_id",              comment: "Codigo unico de categoria de peticion o contacto"
    t.integer "consumer_id",                      comment: "Codigo unico de consumidor."
    t.integer "provider_id",                      comment: "Codigo unico de distribuidor."
    t.string  "message",             limit: 1000, comment: "Mensaje de la petición o contacto."
    t.string  "name",                limit: 60,   comment: "Nombre de la persona que genera el contacto como NN."
    t.string  "email",               limit: 20,   comment: "Dirección de correo electronico de la persona que genera el contacto como NN."
    t.string  "phone_number",        limit: 15,   comment: "Número telefonico de la persona que genera el contacto como NN."
    t.index ["consumer_id"], name: "FK_Request_Consumer", using: :btree
    t.index ["provider_id"], name: "FK_Request_Provider", using: :btree
    t.index ["request_category_id"], name: "FK_Request_Request_category", using: :btree
  end

  create_table "request_category", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", comment: "Categoría de contacto, Entidad independiente de la clasifica" do |t|
    t.string "name",        limit: 30,  comment: "Nombre de categoría de solicitud"
    t.string "description", limit: 500, comment: "Descripción de la categoría a definir."
  end

  create_table "sale_historical", id: false, force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", comment: "Entidad de acumulación de ventas por proveedor." do |t|
    t.integer  "provider_id", comment: "Codigo unico de distribuidor."
    t.integer  "amount",      comment: "Monto de registro"
    t.datetime "date",        comment: "Fecha de registro"
    t.integer  "segment_id",  comment: "Código único de segmento comercial."
    t.index ["provider_id"], name: "FK_Reference_38", using: :btree
    t.index ["segment_id"], name: "FK_Reference_39", using: :btree
  end

  create_table "score", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", comment: "Entidad encargada de la información de comportamiento de los" do |t|
    t.integer "punishment_id",            comment: "Codigo unico de penalizacion"
    t.integer "consumer_id",              comment: "Codigo unico de consumidor."
    t.integer "provider_id",              comment: "Codigo unico de distribuidor."
    t.integer "puntuation",               comment: "Puntuacion"
    t.string  "comment",       limit: 70, comment: "Comentario"
    t.string  "suggest",       limit: 70, comment: "Recomendacion"
    t.string  "claim",         limit: 70, comment: "Reclamo"
    t.index ["consumer_id"], name: "FK_Score_Consumer", using: :btree
    t.index ["provider_id"], name: "FK_Score_Provider", using: :btree
    t.index ["punishment_id"], name: "FK_Score_Punishment", using: :btree
  end

  create_table "segment", id: :integer, comment: "Codigo de segmento comercial", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", comment: "Entidad por concepto de segmento comercial referente a la en" do |t|
    t.integer "amount",                             comment: "Monto del segmento"
    t.decimal "commission", precision: 4, scale: 2, comment: "Comision del segmento"
  end

  create_table "store", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", comment: "Información referente a la entidad Comercio o establecimient" do |t|
    t.integer "address_id",              comment: "Codigo unico de direccion"
    t.string  "name",        limit: 35,  comment: "Nombre de local"
    t.string  "description", limit: 200, comment: "Descripcion de local"
    t.integer "user_id"
    t.index ["address_id"], name: "FK_Store_Adress", using: :btree
    t.index ["user_id"], name: "index_store_on_user_id", using: :btree
  end

  create_table "tracing", primary_key: "sesion", id: :string, limit: 10, comment: "Sesión de perfil", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", comment: "Referencia a entidad de seguimiento, en la cual se estructur" do |t|
    t.integer "consumer_id",            comment: "Codigo unico de consumidor."
    t.integer "provider_id",            comment: "Codigo unico de distribuidor."
    t.string  "latitude",    limit: 20, comment: "Latitud de la geolocalizacion"
    t.string  "longitude",   limit: 20, comment: "Longitud de la geolocalizacion"
    t.integer "flag_Purge",             comment: "Flag de purga"
    t.index ["consumer_id"], name: "FK_Tracing_Consumer", using: :btree
    t.index ["provider_id"], name: "FK_Tracing_Provider", using: :btree
  end

  create_table "type_account", id: :integer, comment: "Codigo unico para el tipo de cuenta", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", comment: "Tipo de cuenta para uso del perfilado de distribucion, infor" do |t|
    t.string "name", limit: 35, comment: "Nombre del tipo de cuenta"
  end

  create_table "user", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=utf8" do |t|
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
    t.string   "store_name"
    t.string   "street_name"
    t.string   "store_description"
    t.string   "owner_name"
    t.index ["email"], name: "index_user_on_email", unique: true, using: :btree
    t.index ["reset_password_token"], name: "index_user_on_reset_password_token", unique: true, using: :btree
  end

  create_table "vehicle", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", comment: "Información referente a la marca, todo distribuidor debe reg" do |t|
    t.integer "vehicle_brand_id",            comment: "Codigo unico de marca de vehiculo"
    t.string  "model_name",       limit: 15, comment: "Modelo del vehiculo"
    t.string  "licence_plate",    limit: 6,  comment: "Matricula o patente del vehiculo"
    t.string  "color",            limit: 20, comment: "Color del vehiculo"
    t.index ["vehicle_brand_id"], name: "FK_Vehiclebrand_Vehicle", using: :btree
  end

  create_table "vehicle_brand", force: :cascade, options: "ENGINE=InnoDB DEFAULT CHARSET=latin1", comment: "Información referente a la marca, todo distribuidor debe reg" do |t|
    t.string "name", limit: 15, comment: "Nombre de marca de vehiculo"
  end

  add_foreign_key "address", "commune", name: "FK_Address_Comune"
  add_foreign_key "bank_account", "bank", name: "FK_Bankaccount_Bank"
  add_foreign_key "bank_account", "type_account", name: "FK_taccount_Bankaccount"
  add_foreign_key "commune", "province", name: "FK_Commune_Province"
  add_foreign_key "consumer", "address", name: "FK_Consumer_Address"
  add_foreign_key "credit_card", "bank", name: "FK_Creditcard_Bank"
  add_foreign_key "credit_card", "consumer", name: "FK_Reference_37"
  add_foreign_key "credit_card", "credit_card_brand", name: "FK_bank_brandct"
  add_foreign_key "debit_card", "bank", name: "FK_DebitCard_Bank"
  add_foreign_key "debit_card", "consumer", name: "FK_Reference_36"
  add_foreign_key "debit_card", "credit_card_brand", name: "FK_DebitCard_BrandCT"
  add_foreign_key "inventory", "product", name: "FK_Inventory_Product"
  add_foreign_key "inventory", "provider", name: "FK_Inventory_Provider"
  add_foreign_key "location", "store", name: "FK_Reference_40"
  add_foreign_key "order_sale", "consumer", name: "FK_Consumer_order"
  add_foreign_key "order_sale", "payment_method", name: "FK_OrderSale_PaymentMEthod"
  add_foreign_key "order_sale", "provider", name: "fk_Pedido_Distribuidor1"
  add_foreign_key "product", "category", name: "FK_Product_Category"
  add_foreign_key "product_quantifier", "order_sale", column: "order_id", primary_key: "order_id", name: "FK_Prodped_Order"
  add_foreign_key "product_quantifier", "product", name: "FK_Proped_Product"
  add_foreign_key "provider", "address", name: "FK_Provider_address"
  add_foreign_key "provider", "bank_account", name: "FK_BankAccount_Provider"
  add_foreign_key "provider", "payment_method", name: "FK_PaymentMethod_Provider"
  add_foreign_key "provider", "store", name: "FK_Provider_Store"
  add_foreign_key "provider", "vehicle", name: "FK_Vehicle_Provider"
  add_foreign_key "request", "consumer", name: "FK_Request_Consumer"
  add_foreign_key "request", "provider", name: "FK_Request_Provider"
  add_foreign_key "request", "request_category", name: "FK_Request_Request_category"
  add_foreign_key "sale_historical", "provider", name: "FK_Reference_38"
  add_foreign_key "sale_historical", "segment", name: "FK_Reference_39"
  add_foreign_key "score", "consumer", name: "FK_Score_Consumer"
  add_foreign_key "score", "provider", name: "FK_Score_Provider"
  add_foreign_key "score", "punishment", name: "FK_Score_Punishment"
  add_foreign_key "store", "address", name: "FK_Store_Adress"
  add_foreign_key "store", "user"
  add_foreign_key "tracing", "consumer", name: "FK_Tracing_Consumer"
  add_foreign_key "tracing", "provider", name: "FK_Tracing_Provider"
  add_foreign_key "vehicle", "vehicle_brand", name: "FK_Vehiclebrand_Vehicle"
end
