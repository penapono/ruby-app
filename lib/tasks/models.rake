namespace :models do
  desc 'create or update models'
  task :create_or_update => :environment do
    puts "Creating Models"

    #search the models
    models_uri = URI("http://www.webmotors.com.br/carro/modelos")

    Brand.all.each do |brand|
      response = Net::HTTP.post_form(models_uri, { marca: brand.webmotors_id })
      models_json = JSON.parse response.body

      puts "Creating models for #{brand.name}"

      # Itera no resultado e grava os modelos que ainda não estão persistidos
      models_json.each do |json|
        puts "Creating #{brand.name} - #{json['Nome']}"
        Model.find_or_create_by(
          brand_id: brand.id,
          name: json["Nome"])
      end
    end

    puts "Finished creating or updating models"
  end
end
