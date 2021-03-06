module Spree
  class Admin::MegaMenuItemsController < Admin::ResourceController
    
    before_action :set_mega_menu
    before_action :set_mega_menu_item, only: [:show, :update, :destroy, :edit]

    def index 
      @mega_menu_items = @mega_menu.mega_menu_items.order("spree_mega_menu_items.weight ASC")
    end
    
    
    def new
      @mega_menu_item = Spree::MegaMenuItem.new
    end
  

    def edit
      @mega_menu_item = Spree::MegaMenuItem.find(params[:id])
    end
  

    def create
      @mega_menu.mega_menu_items.build(mega_menu_item_params)
  
      respond_to do |format|
        if @mega_menu.save
          format.html { redirect_to admin_mega_menu_mega_menu_items_path, notice: 'Mega menu item was successfully created.' }
          format.json { render :show, status: :created, location: @mega_menu_item }
        else
          format.html { render :new }
          format.json { render json: @mega_menu_item.errors, status: :unprocessable_entity }
        end
      end
    end
  
    def update
      respond_to do |format|
        if @mega_menu.mega_menu_items.find(params[:id]).update(mega_menu_item_params)
          format.html { redirect_to admin_mega_menu_mega_menu_items_path, notice: 'Mega menu item was successfully updated.' }
          format.json { render :show, status: :ok, location: @admin_mega_menu }
        else
          format.html { render :edit }
          format.json { render json: @mega_menu.errors, status: :unprocessable_entity }
        end
      end
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_mega_menu
        @mega_menu = Spree::MegaMenu.find(params[:mega_menu_id])
      end
      
      def set_mega_menu_item
        @mega_menu_item = Spree::MegaMenuItem.find(params[:id])
      end
      
      # Never trust parameters from the scary internet, only allow the white list through.
      def mega_menu_item_params
        params[:mega_menu_item].permit(:title, :link, :weight, :parent_id, :type_of_link, :top_level, :css_class, :column, :menu_image)
      end
  end
end
