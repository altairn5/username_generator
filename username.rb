# Make sure to run the tests in your /spec folder
# Run `rspec /spec/username_spec.rb` to get started.
$users = {}


def format_name(first, last)
	if last.length < 1 || first.length < 1
		return nil
	end
	first.downcase!
  	last.downcase!
  	new_first = first.gsub(/[^a-z]/, '')
  	new_last = last.gsub(/[^a-z]/, '')
  	new_first[0]+ new_last
end

def format_year(year)
	year = year.to_s
	if (year.length == 4)
		new_year = year[2] + year[3]
	else
		return nil
	end
end

def build_username(first, last, year, level=0)
	name = format_name(first, last)
	annual = format_year(year)
	privilege = user_type_prefix(level)
	username = privilege + name + annual
  	
end

def check_privilege(level = 0)
	level1 =  level.to_i
	if level1 == 1
		return 'seller'
	elsif level1 == 2
		return 'manager'
	elsif level1 >= 3
		return 'admin'
	else
		return 'user'
	end
end

def user_type_prefix(level = 0)
	level1 =  level.to_i
	if level1 == 1
		return 'seller-'
	elsif level1 == 2
		return 'manager-'
	elsif level1 >= 3
		return 'admin-'
	else
		return ''
	end
end

def generate_username(first_name, last_name, birth_year, privilege_level = 0)
	new_user = build_username(first_name, last_name, birth_year, privilege_level)
	if $users.has_key?(new_user)
		new_user += "_" + ($users[new_user] + 1).to_s
		$users[new_user] += 1
	else
		$users.merge({new_user => 1})
	end
	return new_user		
end



