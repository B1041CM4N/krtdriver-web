module EnumI18nHelper
  # Returns an array of the possible key/i18n values for the enum
  # Example usage:
  # enum_options_for_select(User, :approval_state)
  def enum_options_for_select(class_name, enum)
    class_name.const_get(enum.to_s.upcase).map do |key, _|
      [enum_i18n(class_name, enum, key), key.to_s]
    end
  end

  # Returns the i18n version the the models current enum key
  # Example usage:
  # enum_l(user, :approval_state)
  def enum_l(model, enum)
    enum_i18n(model.class, enum, model.send(enum))
  end

  def enum_i18n(class_name, enum, key)
    I18n.t("models.#{class_name.model_name.i18n_key}.#{enum.to_s.pluralize}.#{key}")
  end
end
