class ReceitaController < ApplicationController
  before_action :set_receitum, only: [:show, :edit, :update, :destroy]

  # GET /receita
  # GET /receita.json
  def index
    @vendas = Venda.all
    total = 0
    receita = 0
    @vendas.each do |vd|

      qtd = Venda.where(:comprador => vd.comprador).count
      if qtd < 2
        valor_venda = vd.quantidade * vd.preco_unitario   
        
        if !Receitum.last.nil?
          receita = Receitum.last
          total = receita.receita_acumulada + valor_venda
        end
        
        Receitum.create(venda_id: vd.id, receita_venda: valor_venda, receita_acumulada: total)  
      end

    end

    @receita = Receitum.all
  end

  
  # GET /receita/1
  # GET /receita/1.json
  def show
  end

  # GET /receita/new
  def new
    @receitum = Receitum.new
  end

  # GET /receita/1/edit
  def edit
  end

  # POST /receita
  # POST /receita.json
  def create
    @receitum = Receitum.new(receitum_params)

    respond_to do |format|
      if @receitum.save
        format.html { redirect_to @receitum, notice: 'Receitum was successfully created.' }
        format.json { render :show, status: :created, location: @receitum }
      else
        format.html { render :new }
        format.json { render json: @receitum.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /receita/1
  # PATCH/PUT /receita/1.json
  def update
    respond_to do |format|
      if @receitum.update(receitum_params)
        format.html { redirect_to @receitum, notice: 'Receitum was successfully updated.' }
        format.json { render :show, status: :ok, location: @receitum }
      else
        format.html { render :edit }
        format.json { render json: @receitum.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /receita/1
  # DELETE /receita/1.json
  def destroy
    @receitum.destroy
    respond_to do |format|
      format.html { redirect_to receita_url, notice: 'Receitum was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_receitum
      @receitum = Receitum.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def receitum_params
      params.require(:receitum).permit(:venda_id, :receita_venda, :receita_acumulada)
    end
end
