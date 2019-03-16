class Scrapping

    def self.connect(url)
        web = HTTParty.get(url)
        html = Nokogiri::HTML(web)
        html
    end


    def self.scrap  
        Site.all.each do |site| 
            content=self.connect(site.url+site.contexto)
            ap "TOtal articulos: #{content.count}"
            elementos = Element.where(site_id: site.id, parent_id: nil, new_page: false)
            
            elementos.each do |parent_element|
                
                    
                ap parent_element
                url = nil
                parentElement = getElement(content, parent_element.name)
                parentElement.each  do |post|
                    postEntry = Post.new
                    if parent_element.type_element == 'url'
                        postEntry.url =  post["href"]
                        url = parent_element
                    end

                   parent_element.childrens.each do |elementosHijo|
                        value = getElement(post, elementosHijo.name)
                        case elementosHijo.type_element 
                            when 'title'
                                postEntry.title = value.text
                                ap postEntry.title
                            when 'url'
                                if value.first["href"].present?
                                    postEntry.url =  value.first["href"]  
                                else
                                    postEntry.url =  value["href"] 
                                end
                                if postEntry.url.include? site.url

                                else
                                    postEntry.url = site.url + postEntry.url 
                                end
                              #  postEntry.url =  value["href"]
                                url = elementosHijo
                        end
                   end
                   ap postEntry.url 
                   if postEntry.url.present?

                        content2 = connect(postEntry.url)
                        ap url
                        url.childrens.each do |elementoanidado|
                            
                            value = getElement(content2, elementoanidado.name)
                            case elementoanidado.type_element
                                when "resume"
                                    postEntry.resume = value.text
                                when "date" 
                                    if elementoanidado.extras.present?
                                        postEntry.fecha_publicacion = Date.strptime(value.text, elementoanidado.extras)  

                                    else
                                        postEntry.fecha_publicacion = Date.parse(value.text)  
                                    end
                                    
                                when "image-element"
                                    ap value.first["src"]
                                    if value.first["data-lazy-src"].present?
                                        postEntry.image =  value.first["data-lazy-src"]
                                    
                                    elsif value.first["src"].present?
                                        postEntry.image = value.first["src"]
                                    end
                                when "content"
                                    ap "CONTENT: #{elementoanidado.name} - #{elementoanidado.type_element} #{value}"
                                    postEntry.content = value.to_html 
                                end
                        end

                   end
                   postEntry.save if postEntry.title.present? and Post.where(url: postEntry.url).count == 0 

                end
                
                
            end 
        end 
    end


    def self.getElement(origen, campos)
        origen.css(campos)
    end
end