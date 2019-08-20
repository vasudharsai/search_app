require 'rails_helper'

RSpec.describe Organization, type: :model do

  context 'when search with nil attributes' do
    it 'should return all records' do
      result = Organization.get_result(nil,nil)
      total = Organization.all.count
      expect(result.count).to eql total
    end
  end

  context 'when search by an attribute' do
    it 'should return matched record' do
      attr = 'external_id'
      value = Organization.first.send(attr)
      result = Organization.get_result(attr, value )
      objects = Organization.where(attr.to_sym => value)
      expect(result).to match_array(objects)
    end
  end

  context 'when search by an associated model attribute' do
    it 'should return matched record - domain_names' do
      asscociation = 'domain_names'
      domain_name = Organization.first.send(asscociation).last.name
      result = Organization.get_result(asscociation,domain_name)
      total = DomainName.where(name: domain_name)
      expect(result.count).to eql total.count
    end

    it 'should return matched record - tags' do
      asscociation = 'tags'
      tag_name = Organization.first.send(asscociation).last.name
      result = Organization.get_result(asscociation,tag_name)
      total = Tag.where(name: tag_name)
      expect(result.count).to eql total.count
    end

  end

  context 'check all column names' do
    it 'return all column names including its associated models' do
      result = Organization.get_attributes
      expect(result.any?).to be true
    end
  end

end
