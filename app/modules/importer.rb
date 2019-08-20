module Importer

  def self.import_organizations!
    file = File.read(Rails.root.join('lib/assets/organizations.json'))
    data_hash = parse_file(file)
    begin
     data_hash.each do |hash|
       org = Organization.new
       domains = hash.select {|k,v| k == 'domain_names'}
       tags = get_tags(hash)
       iterate_hash(hash,org)
       map_domains(org,domains)
       map_tags(org,tags)
     end
    rescue => e
      puts "Exiting..... Error:#{e.inspect} "
    end
  end

  def self.import_users!
    file = File.read(Rails.root.join('lib/assets/users.json'))
    data_hash = parse_file(file)
    begin
      data_hash.each do |hash|
        org = User.new
        tags = get_tags(hash)
        iterate_hash(hash,org)
        map_tags(org,tags)
      end
    rescue => e
      puts "Exiting..... Error:#{e.inspect} "
    end
  end

  def self.import_tickets!
    file = File.read(Rails.root.join('lib/assets/tickets.json'))
    data_hash = parse_file(file)
    begin
      data_hash.each do |hash|
        org = Ticket.new
        tags = get_tags(hash)
        iterate_hash(hash,org)
        map_tags(org,tags)
      end
    rescue => e
      puts "Exiting..... Error:#{e.inspect} "
    end
  end


  def self.parse_file(file)
    JSON.parse(file)
  end

  def self.iterate_hash(hash,obj)
    hash.each do |k,v|
      next if v.class == Array
      obj[k.to_sym] = v
    end
    if obj.save
      puts "#{obj.class.to_s} saved: #{obj.id}"
    else
      puts "#{obj.class.to_s} cannot be saved due to following reasons : #{obj.errors.full_messages}"
    end
  end

  def self.get_tags(hash)
    hash.select {|k,v| k == 'tags'}
  end

  def self.map_domains(obj,hash)
    hash.values.flatten.each do |v|
      begin
        obj.domain_names.create(name:v)
      rescue => e
        puts "Exiting..... Error:#{e.inspect} "
      end
    end
  end

  def self.map_tags(obj,hash)
    hash.values.flatten.each do |v|
      begin
        obj.tags.create(name:v, taggable_id: obj.id, taggable_type: obj.class.to_s)
      rescue => e
        puts "Exiting..... Error:#{e.inspect} "
      end
    end
  end

end