module FormValueTypeCaster

  # Cast check box values to booleans.
  def type_cast_attributes(attrs)
    casted_attrs = {}
    attrs.each do |k, v|
      if column_types[k].sql_type == 'boolean'
        casted_attrs[k] = ['1', true].include?(v) ? true : false
      else
        casted_attrs[k] = v
      end
    end
    casted_attrs
  end
end