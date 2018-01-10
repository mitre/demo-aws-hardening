#!/usr/bin/ruby
require 'yaml'

@run_kitchen = true
file_content = YAML.load_file(".kitchen.yml")
my_vars = file_content['driver']['variables']

my_vars.each_pair do |key, value|
  x = ENV.key?(value.split("'")[1]) ? "#{ENV[value.split("'")[1]]}" : 'unset'
  if x == 'unset'
    @run_kitchen = false
    puts "Please set #{value.split("'")[1]}"
  else
    puts key.to_s + ': ' + x.to_s
  end
end

puts ''
puts '----------'
puts 'You are OK to run Test Kitchen' if @run_kitchen == true
puts 'Please SET the above Envrioment variables before running kitchen' if @run_kitchen == false

require 'rubygems'; require 'json'; 
# puts  %x[aws ec2 describe-vpcs]

# puts JSON.pretty_generate(JSON[STDIN.read]);"
# puts JSON.pretty_generate(['CidrBlock: 172.31.0.0/16']);
# puts '*****'

my_vpcs =  JSON.parse(%x[aws ec2 describe-vpcs]);

# puts my_vpcs['Vpcs'][0]['IsDefault']

re = Regexp.union('false')
if my_vpcs['Vpcs'][0]['IsDefault'].to_s.match(re)
	puts 'Default VPC does NOT exist'
	puts '  - please use an account/region with default VPC'
	puts '  - alternativelly,  consider hard-coding default vpc with terraform by setting Environment Variable to your VPC (below)'
	puts '		export TF_VAR_vpc_id=' + my_vpcs['Vpcs'][0]['VpcId']
else
	puts 'Default VPC Exists'
end

# puts '-----'
# my_vpc = my_vpcs['Vpcs']
# puts '+++'
# puts my_vpc[0]
