object false

node(:success) { true } 
child(@user) do  
  attributes :id, :email, :first_name, :last_name, :admin
  node(:csrf_authenticity_token) { form_authenticity_token.to_s }
  
  if @user.organizations
    node(:organizations) do
      @user.organizations.map do |org|
        partial 'alohomora/api/v1/sessions/organization', object: org, root: false
      end
    end
  end 
end

