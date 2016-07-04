# encoding: UTF-8

puts "Creating brandings"

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

puts "Finished creating or updating brandings"

puts "Creating Models"

#search the models
models_uri = URI("http://www.webmotors.com.br/carro/modelos")

Brand.all.each do |brand|
  response = Net::HTTP.post_form(models_uri, { marca: brand.webmotors_id })
  models_json = JSON.parse response.body

  puts "Creating models for #{brand.name}"

  # Itera no resultado e grava os modelos que ainda não estão persistidas
  models_json.each do |json|
    puts "Creating #{brand.name} - #{json['Nome']}"
    Model.find_or_create_by(
      brand_id: brand.id,
      name: json["Nome"])
  end
end

puts "Finished creating or updating models"
