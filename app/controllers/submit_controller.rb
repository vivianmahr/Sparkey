class SubmitController < SessionController
	def index
		
	end
	
	def create
		uploaded_io = params[:submit][:picture]
			File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
				file.write(uploaded_io.read)
			end
	end
	
	def show
		@submit = Submit.find(uploaded_io)
	end
end
