module ActiveRecord
  class Base
    pluralize_table_names = false
    class << self
      def reset_table_name
        class_name_of_active_record_descendant(self)
      end
    end
  end

  set_primary_key "#{table_name}_id"
end
