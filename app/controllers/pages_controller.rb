class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
    @operacions = Operacion.order(id: :desc)
  end

  def control
    @operacions = Operacion.order(id: :desc)
  end
end
