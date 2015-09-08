module SubCastesHelper
  def sub_castes_options_tag(sub_castes)
    options_for_select(sub_castes.collect{|cs| [cs.name, cs.id]})
  end
end
