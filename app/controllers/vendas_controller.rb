<<<<<<< HEAD


class VendasController < ApplicationController
  before_action :set_venda, only: [:show, :edit, :update, :destroy]

  # GET /vendas
  # GET /vendas.json
  def index
       
    @vendas = Venda.all
    #paginate(page: params[:page], per_page: 10)

  end

  #recebe os dados do arquivo.csv
  def import
    Venda.import(params[:file])
    redirect_to vendas_path, notice: "Vendas Added successfully"
=======
class VendasController < ApplicationController
  before_action :set_venda, only: [:show, :edit, :update, :destroy]

def upload
  uploaded_io = params[:comprador][:descricao][:preco_unitario][:quantidade][:endereco][:fornecedor]
  File.open(Rails.root.join('public', 'uploads', uploaded_io.original_filename), 'wb') do |file|
    file.write(uploaded_io.read)
  end
end

  # GET /vendas
  # GET /vendas.json
  def index
    @vendas = Venda.all
>>>>>>> b6bf6ca40c7a2ceb486bbcf13cc7fb556249fdea
  end

  # GET /vendas/1
  # GET /vendas/1.json
  def show
  end

  # GET /vendas/new
  def new
    @venda = Venda.new
  end

  # GET /vendas/1/edit
  def edit
  end

  # POST /vendas
  # POST /vendas.json
  def create
    @venda = Venda.new(venda_params)

    respond_to do |format|
      if @venda.save
        format.html { redirect_to @venda, notice: 'Venda was successfully created.' }
        format.json { render :show, status: :created, location: @venda }
      else
        format.html { render :new }
        format.json { render json: @venda.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /vendas/1
  # PATCH/PUT /vendas/1.json
  def update
    respond_to do |format|
      if @venda.update(venda_params)
        format.html { redirect_to @venda, notice: 'Venda was successfully updated.' }
        format.json { render :show, status: :ok, location: @venda }
      else
        format.html { render :edit }
        format.json { render json: @venda.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /vendas/1
  # DELETE /vendas/1.json
  def destroy
    @venda.destroy
    respond_to do |format|
      format.html { redirect_to vendas_url, notice: 'Venda was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_venda
      @venda = Venda.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def venda_params
      params.require(:venda).permit(:comprador, :descricao, :preco_unitario, :quantidade, :endereco, :fornecedor)
    end
end
