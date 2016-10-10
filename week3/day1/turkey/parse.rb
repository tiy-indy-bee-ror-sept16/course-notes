require_relative 'delivery'
require_relative 'pilot'
require_relative 'planet'
require 'csv'

class Parse

  def self.money_display(num)
    "$" + sprintf('%.2f', num).to_s.reverse.split(/(\d{3})/).reject{|s| s == ""}.join(",").reverse.gsub(",.", ".")
  end

  attr_accessor :data_file, :deliveries, :rows, :pilot_records, :planet_records

  def parse_data(file_name)
    self.data_file = file_name
    populate_rows
    populate_deliveries
    populate_pilots
    populate_planets
    self
  end

  def populate_rows
    self.rows = CSV.foreach(data_file, headers: true, :header_converters => :symbol)
  end

  def populate_deliveries
    self.deliveries = rows.map { |row| Delivery.new(row) }
  end

  def populate_pilots
    self.pilot_records = deliveries.group_by(&:pilot).map { |pilot, deliveries| Pilot.new(pilot, deliveries) }
  end

  def populate_planets
    self.planet_records = deliveries.group_by(&:planet).map { |planet, deliveries| Planet.new(planet, deliveries) }
  end

  def total_revenue
    deliveries.reduce(0) { |sum, delivery| sum + delivery.money }
  end

  def revenue_display
    self.class.money_display(total_revenue)
  end

  def delivery_attributes
    Delivery.attributes
  end

  def pilots
    pilot_records.collect(&:name).uniq
  end

  def planets
    planet_records.collect(&:name).uniq
  end

end
