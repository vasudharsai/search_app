namespace :import do

  desc 'Import all organizations'

  task organizations: :environment do
    Importer.import_organizations!
  end

  desc 'Import all users'

  task users: :environment do
    Importer.import_users!
  end

  desc 'Import all users'

  task tickets: :environment do
    Importer.import_tickets!
  end

end

