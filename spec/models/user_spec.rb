require 'rails_helper'

RSpec.describe User, type: :model do

    context 'when search with nil attributes' do
      it 'should return all records' do
        result = User.get_result(nil,nil)
        total = User.all.count
        expect(result.count).to eql total
      end
    end

    context 'when search by an attribute' do
      it 'should return matched record' do
        attr = 'email'
        value = User.first.send(attr)
        result = User.get_result(attr, value )
        objects = User.where(attr.to_sym => value)
        expect(result).to match_array(objects)
      end
    end

    context 'when search by an associated model attribute' do
      it 'should return matched record' do
        asscociation = 'tags'
        tag_name = User.first.send(asscociation).last.name
        result = User.get_result(asscociation,tag_name)
        total = Tag.where(name: tag_name)
        expect(result.count).to eql total.count
      end
    end

end
