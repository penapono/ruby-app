namespace :brands do
  desc 'create or update brands'
  task :create_or_update => :environment do
    puts "Creating Brands"

    #search the brand
    brands_uri = URI("http://www.webmotors.com.br/carro/marcas")

    # Brand request for Webmotors site
    response = Net::HTTP.post_form(brands_uri, {})
    json = JSON.parse response.body

    # Itera no resultado e grava as marcas que ainda não estão persistidas
    json.each do |brand_params|
      puts "Creating #{brand_params['Id']} - #{brand_params['Nome']}"

      Brand.find_or_create_by(
        name: brand_params["Nome"],
        webmotors_id: brand_params["Id"])
    end

    puts "Finished creating or updating brands"
  end
end
