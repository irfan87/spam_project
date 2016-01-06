class TinymceAssetsController < ApplicationController
  def create
    # Take upload from params[:file] and store it somehow...
    # Optionally also accept params[:hint] and consume if needed
    file_uploader = PhotoUploader.new
    file_uploader.store!(params[:file])
    render json: {
      image: {
         url: file_uploader.url
      }
    }, content_type: "text/html"
  end
end