class CategoriesController < ApplicationController
  before_action :authorized_admin
  # before_action :get_city,only: [:create,:new]
  layout('admin')
  def new
    @category_list = []
    Dir.foreach("/Users/macbookshop/RubymineProjects/Test/app/models") do |model_path|
      @string =  File.basename(model_path, ".rb")
       if @string.include?"."
         next
       elsif @string.include?"Admin"
         next
       elsif @string.include?"concerns"
         next
       elsif @string.include?"application_record"
         next
       elsif @string.include?"items_import"
         next
       else
          @category_list<<@string
      end

    end

    @category = Category.new
    @categories = Category.all
    render 'categories/new'
  end

  def create

    ActiveRecord::Base.transaction do
      @new_category = Category.insert_all!(
        [
          { :name => params[:category][:category_name]+'_view' },
          { :name => params[:category][:category_name]+'_add' },
          { :name => params[:category][:category_name]+'_update' },
          { :name => params[:category][:category_name]+'_delete' }
        ])

      flash[:alert] = "new category added"
      redirect_to admin_category_new_path
    end

  rescue ActiveRecord::RecordNotUnique
    flash[:error] = "Something went wrong, Category must be unique"
    redirect_to admin_category_new_path
  end


  def destroy
    puts(params)
    @category = Category.find_by(id:params[:id]).destroy

    flash[:alert] = "The category deleted"
    redirect_to admin_category_new_path

  end


end
