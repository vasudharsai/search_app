class ApplicationRecord < ActiveRecord::Base
  self.abstract_class = true


  class << self

    def get_result(attribute,value)
      if attribute.nil? && value.nil?
        all
      elsif get_associated_models.include? attribute
        joins(attribute.to_sym).where("#{attribute}.name=?", value).distinct
      else
        where("#{attribute} = ?", value)
      end
    end


    def get_attributes
      column_names + get_associated_models
    end

    def get_associated_models
      reflect_on_all_associations(:has_many).map{|assc| assc.name.to_s}
    end

  end

end

