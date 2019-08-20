require 'rails_helper'

RSpec.describe Ticket, type: :model do

  context 'when search with nil attributes' do
    it 'should return all records' do
      result = Ticket.get_result(nil,nil)
      total = Ticket.all.count
      expect(result.count).to eql total
    end
  end

  context 'when search by an attribute' do
    it 'should return matched record' do
      attr = 'description'
      value = Ticket.first.send(attr)
      result = Ticket.get_result(attr, value )
      objects = Ticket.where(attr.to_sym => value)
      expect(result).to match_array(objects)
    end
  end

  context 'when search by an attribute without any value' do
    it 'should return no records' do
      attr = 'description'
      value = Ticket.first.send(attr)
      result = Ticket.get_result(attr, value )
      objects = Ticket.where(attr.to_sym => value)
      expect(result).to match_array(objects)
    end

    it 'should return records with no description' do
      attr = 'description'
      obj = FactoryBot.create(:ticket, description: '')
      result = Ticket.get_result(attr, obj.send(attr))
      objects = Ticket.where(attr.to_sym => obj.send(attr))
      expect(result).to match_array(objects)
    end

  end

  context 'when search by an associated model attribute' do
    it 'should return matched record' do
      asscociation = 'tags'
      tag_name = Ticket.first.send(asscociation).last.name
      result = Ticket.get_result(asscociation,tag_name)
      total = Tag.where(name: tag_name)
      expect(result.count).to eql total.count
    end
  end

end
