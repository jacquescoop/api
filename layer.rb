#!/usr/bin/ruby
require 'rubygems'
require 'json'
require 'pp'
require 'sinatra'

before do
  jsonUID = File.read('ListeUID.json')
  @ListeUID = JSON.parse(jsonUID)

  jsonCoop = File.read('ListeCoop.json')
  @ListeCoop = JSON.parse(jsonCoop) 

  jsonUIDCoop = File.read('ListeUIDCoop.json')
  @ListeUIDCoop = JSON.parse(jsonUIDCoop)

  jsonUIDCompte = File.read('ListeUIDCompte.json')
  @ListeUIDCompte = JSON.parse(jsonUIDCompte)
  
# ATTENTION! @ListeUID, @ListeCoop sont des array...
  content_type :json, 'charset' => 'utf-8'
end

get '/' do
  "Les choix sont: /api/uid/{login_name}, /api/coops/{uid} et /api/comptes/{uid}".to_json
end

get '/api/uid/:nom' do 
  # the param[] hash stores querystring and form data
  @uid = params[:nom].to_sym
  erb :filtre1
end

get '/api/coop/:uid' do
  # the param[] hash stores querystring and form data
  @koop = params[:uid].to_sym
  erb :filtre2
end

get '/api/compte/:uid/:coop' do
  # the param[] hash stores querystring and form data
  @uid = params[:uid].to_sym
  @koop = params[:coop].to_sym
  erb :filtre3
end
