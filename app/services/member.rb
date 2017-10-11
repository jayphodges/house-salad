class Member
  attr_reader :name,
              :role,
              :party,
              :district,
              :seniority

  def initialize(attributes = {})
    @attributes = attributes
    @name       = attributes[:name]
    @role       = attributes[:role]
    @party      = attributes[:party]
    @district   = attributes[:district]
    @seniority  = attributes[:seniority].to_i
  end

  def name
    "#{@attributes[:first_name]} #{@attributes[:last_name]}"
  end

end
