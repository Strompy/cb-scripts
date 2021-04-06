require 'CSV'
require 'clearbit'

class DomainFinder
  attr_reader :data, :domain_names
  def initialize
    @data = []
    @domain_names = {}
    Clearbit.key = ENV['CLEARBIT_KEY']
  end

  def load_names
    CSV.foreach('./names.csv', headers: true, header_converters: :symbol) do |row|
      if row[:company_names].nil?
        next
      end
      case row[:company_names].downcase
      when /^[^A-Za-z]+$/ #filters for no letters
        next
      when 'n/a'
        next
      when 'none'
        next
      else
        data << row[:company_names].downcase
      end
    end
  end

  def find_domains
    # remove duplicates
    uniq_names = data.uniq

    uniq_names.map do |name|
      response = Clearbit::NameDomain.find(name: name)
      p "Searching for #{name}"
      if response.nil?
        domain_names[name] = 'Not found'
      else
        domain_names[name] = response[:domain]
      end
    end
  end

  def output_results
    headers = ['company_names, company_domains']
    CSV.open('./domains.csv', 'w') do |csv|
      csv << headers
      domain_names.each do |name, domain|
        csv << CSV::Row.new(['company_names', 'company_domains'], [name, domain])
      end
    end
  end

  def run
    puts "Loading Company Names..."
    load_names
    puts "Done"
    puts "Finding Company Domains..."
    find_domains
    puts "Done"
    puts "Writing to CSV"
    output_results
    puts "Done"
  end

end

DomainFinder.new.run
