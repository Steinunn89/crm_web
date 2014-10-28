require 'sinatra'
require './contact'
require './rolodex'


$rolodex = Rolodex.new	


get '/' do 

	@crm_app_name = "My CRM"

	erb :index
	
	
end

get '/contacts' do

	@contacts = []
	
	erb :contact
end

get "/contacts/new" do

	erb :new_contact

end

post "/contacts" do

	puts "PARAMS: #{params}"

	contact = Contact.new(params[:first_name], params[:last_name], params[:email], params[:note])
	$rolodex.add_contact(contact)
	redirect to ('/contacts')
end

