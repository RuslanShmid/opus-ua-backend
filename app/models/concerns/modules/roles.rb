module Roles
  ROLES = %w(user admin).freeze

  ROLES.each do |rolename|
    define_method "#{rolename}?" do
      role == rolename
    end

    define_method "#{rolename}!" do
      self.role = rolename
    end
  end
end
