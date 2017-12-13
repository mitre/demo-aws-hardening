
# Add attributes and arrays for accepted ports, protos and security_groups

control 'security_group-public-access-22' do
  impact 1.0
  title 'Security Group: No ingress access from CIDR block 0.0.0.0/0 to port 22'
  desc 'Security Groups must not allow inbound access from anywhere to port 22'
  tag nist: "AC-6"

  results = inspec.command("aws ec2 describe-security-groups --filters Name=ip-permission.from-port,Values=* Name=ip-permission.to-port,Values=22 Name=ip-permission.cidr,Values='0.0.0.0/0' --query 'SecurityGroups[*].{Name:GroupName}'").stdout.strip.chars.count

  describe results do
    it { should <= 2 }
  end
end

# research checking for 'http' proto from the world


control "s3buckets-public-access" do
  impact 0.7
  title "Ensure there are no publicly accessable S3 Buckets"
  desc "..."
  tag nist: "CM-7"

  regions = inspec.command("aws ec2 describe-regions --query 'Regions[].{Name:RegionName}' --output text").stdout.strip.lines

  regions.each do |region|

    buckets = inspec.command("aws --region #{region} s3api list-buckets --query 'Buckets[].Name' --output text").stdout.strip.split

    buckets.each do |bucket|
      next if bucket.nil?
      results = inspec.command("aws --region #{region} s3api get-bucket-acl --bucket #{bucket}  --output text ").stdout.strip
      describe results do
        it { should_not include "AllUsers" }
     end

     describe results do	
        it { should_not include "AuthenticatedUsers" }
     end
   end
 end
end

control "s3bucket-public-objects" do
  impact 0.7
  title "Ensure there are no Publicly Accessable S3 objects"
  desc "..."
  tag nist: "CM-7"

  # test for any public objects - expected fail
  # test for any non-public objects - expected pass

end


