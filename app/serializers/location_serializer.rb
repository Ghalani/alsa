class LocationSerializer < ActiveModel::Serializer
  has_many    :children
  # has_one     :location_type
  # has_one     :parent
  attributes  :id, :name, :location_type_id, :parent_id, :ancestors, :children
  def ancestors
    if @options && @options[:show_parent_tree]
      object.ancestors 
    end
  end

  # def descendants
  #   object.descendants.to_json
  # end
end
