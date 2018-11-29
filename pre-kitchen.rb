#!/usr/bin/ruby
require 'yaml'

@run_kitchen = true
my_vars =
  [
    'AWS_ACCESS_KEY_ID',
    'AWS_SECRET_ACCESS_KEY',
    'TF_VAR_aws_secret_key',
    'AWS_DEFAULT_INSTANCE_TYPE',
    'AWS_SUBNET_ID',
    'AWS_REGION',
    'AWS_AMI_ID',
    'AWS_SG_ID',
  ]

my_vars.each do |value|
  if ENV.fetch(value,nil).to_s != ''
    puts "#{value} is:" + ENV.fetch(value,nil).to_s
  else
    @run_kitchen=false
    puts "Please set #{value}"
  end
end

puts "If you want to get JSON output, please set the USE_JSON = 'true'"

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
        puts ' --- '
        #puts " please update the 'tf_build/variables.tf' file and set the 'default_vpc' to 'false' "
	puts '  - please use an account/region with default VPC'
	puts '  - alternativelly,  consider hard-coding default vpc with terraform by setting Environment Variable to your VPC (below)'
	puts '  export TF_VAR_vpc_id=' + my_vpcs['Vpcs'][0]['VpcId']
else
	puts 'Default VPC Exists'
end

#   puts '-----'
#  my_vpc = my_vpcs['Vpcs']
#  puts '+++'
#  puts my_vpc[0]
