require 'sinatra'
require './contact'
require './rolodex'


$rolodex = Rolodex.new	


get '/' do 

	@crm_app_name = "Steinunn's CRM"

	erb :index, :layout => :layout 
	
end

get '/contacts' do
	
	erb :contact
end

get '/contacts/new' do

	erb :new_contact

end

# post '/contacts' do

	

# 	new_contact = Contact.new(params[:first_name], params[:last_name], params[:email], params[:note])
# 	$rolodex.add_contact(new_contact)
# 	redirect to ('/contacts')
# end

post '/contacts' do

	puts params	
	new_contact = Contact.new(params[:first_name], params[:last_name], params[:email], params[:note])
	$rolodex.add_contact(new_contact)
 	redirect to ('/contacts')
end