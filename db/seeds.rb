# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
Site.create([
    {name: 'Noticia Cristiana', url: 'https://www.noticiacristiana.com', contexto: "/"},
    {name: 'Mundo Cristiano', url: 'https://www1.cbn.com', contexto: "/mundocristiano"}
])

Element.create([
    {site_id: 1, parent_id: nil, name: '#mvp-feat-tab-col1 a', type_element: 'url', new_page: false}, 
   
    {site_id: 1, parent_id: 1, name: 'h2', type_element: 'title', new_page: false},  
    {site_id: 1, parent_id: 1, name: 'header span p', type_element: 'resume', new_page: true},
    {site_id: 1, parent_id: 1, name: '#mvp-content-main', type_element: 'content', new_page: true},
    {site_id: 1, parent_id: 1, name: '#mvp-post-content #mvp-post-feat-img img', type_element: 'image-element', new_page: true},
    {site_id: 1, parent_id: 1, name: 'data-lazy-src', type_element: 'image-src', new_page: true},
    {site_id: 1, parent_id: 1, name: 'time', type_element: 'date', new_page: true},

    {site_id: 2, parent_id: nil, name: '.view-content .col-md-section article', type_element: 'post', new_page: false}, 
    {site_id: 2, parent_id: 8, name: 'img', type_element: 'image-element', new_page: false}, 
    {site_id: 2, parent_id: 8, name: '.content a', type_element: 'url', new_page: false}, 
    {site_id: 2, parent_id: 8, name: 'h4', type_element: 'title', new_page: false},
    {site_id: 2, parent_id: 10, name: '.content img', type_element: 'image-element', new_page: true},
    {site_id: 2, parent_id: 10, name: '.field-name-body .field-items', type_element: 'content', new_page: true},
    {site_id: 1, parent_id: 10, name: '.date-display-single', type_element: 'date', new_page: true, extras: "%m-%d-%Y"}

    
])  